package kanga.visitor;

import kanga.syntaxtree.*;

import java.util.*;

public class MIPSTranslator extends GJDepthFirst<String, String> {
    private int present_stack_size;

    private void printWithTab(String s) {
        System.out.println("\t\t" + s);
    }

    private void printNoTab(String s) {
        System.out.print(s);
    }

    public String visit(NodeOptional n, String argu) {
        if (n.present())
            printNoTab(n.node.accept(this, argu) + ":");
        return null;
    }


    public String visit(Reg n, String argu) {
        return "$" + n.f0.choice.toString();
    }

    /**
     * f0 -> <INTEGER_LITERAL>
     */
    public String visit(IntegerLiteral n, String argu) {
        return n.f0.toString();
    }

    /**
     * f0 -> <IDENTIFIER>
     */
    public String visit(Label n, String argu) {
        return n.f0.toString();
    }

    /**
     * f0 -> "MAIN"
     * f1 -> "["
     * f2 -> IntegerLiteral()
     * f3 -> "]"
     * f4 -> "["
     * f5 -> IntegerLiteral()
     * f6 -> "]"
     * f7 -> "["
     * f8 -> IntegerLiteral()
     * f9 -> "]"
     * f10 -> StmtList()
     * f11 -> "END"
     * f12 -> ( Procedure() )*
     * f13 -> <EOF>
     */
    public String visit(Goal n, String argu) {
        int f5_num = Integer.parseInt(n.f5.accept(this, argu));
        int stack_size = 4 * (f5_num + 1);
        present_stack_size = stack_size - 4;

        printWithTab(".data");
        printWithTab(".align 0");
        printNoTab("newline:");
        printWithTab(".asciiz \"\\n\"\n");

        printWithTab(".text");
        printWithTab(".globl\tmain");
        printNoTab("main:\n");

        printWithTab("sw $ra, -4($sp)");
        printWithTab("move $fp, $sp");
        printWithTab("subu $sp, $sp, " + stack_size);

        n.f10.accept(this, argu);

        printWithTab("addu $sp, $sp, " + stack_size);
        printWithTab("lw $ra, -4($sp)");
        printWithTab("j $ra\n");

        n.f12.accept(this, argu);
        return null;
    }

    /**
     * f0 -> Label()
     * f1 -> "["
     * f2 -> IntegerLiteral()
     * f3 -> "]"
     * f4 -> "["
     * f5 -> IntegerLiteral()
     * f6 -> "]"
     * f7 -> "["
     * f8 -> IntegerLiteral()
     * f9 -> "]"
     * f10 -> StmtList()
     * f11 -> "END"
     */
    public String visit(Procedure n, String argu) {
        int stack_size = 4 * Integer.parseInt(n.f5.accept(this, argu)) + 8;
        present_stack_size = stack_size - 8;
        String func_name = n.f0.accept(this, argu);
        printWithTab(".text");
        printWithTab(String.format(".globl %s", func_name));
        printNoTab(func_name + ":\n");

        printWithTab("sw $fp, -8($sp)");
        printWithTab("sw $ra, -4($sp)");
        printWithTab("move $fp, $sp");
        printWithTab(String.format("subu $sp, $sp, %d", stack_size));

        n.f10.accept(this, argu);

        printWithTab(String.format("addu $sp, $sp, %d", stack_size));
        printWithTab("lw $fp, -8($sp)");
        printWithTab("lw $ra, -4($sp)");
        printWithTab("j $ra\n");

        return null;
    }


    /**
     * f0 -> "NOOP"
     */
    public String visit(NoOpStmt n, String argu) {
        printWithTab("nop");
        return null;
    }

    /**
     * f0 -> "CJUMP"
     * f1 -> Reg()
     * f2 -> Label()
     */
    public String visit(CJumpStmt n, String argu) {
        String reg = n.f1.accept(this, argu);
        String label = n.f2.accept(this, argu);
        printWithTab(String.format("beqz %s, %s", reg, label));
        return null;
    }

    /**
     * f0 -> "JUMP"
     * f1 -> Label()
     */
    public String visit(JumpStmt n, String argu) {
        String label = n.f1.accept(this, argu);
        printWithTab(String.format("b %s", label));
        return null;
    }

    /**
     * f0 -> "HSTORE"
     * f1 -> Reg()
     * f2 -> IntegerLiteral()
     * f3 -> Reg()
     */
    public String visit(HStoreStmt n, String argu) {
        String target_base = n.f1.accept(this, argu);
        String offset = n.f2.accept(this, argu);
        String src_reg = n.f3.accept(this, argu);
        printWithTab(String.format("sw %s, %s(%s)", src_reg, offset, target_base));
        return null;
    }

    /**
     * f0 -> "HLOAD"
     * f1 -> Reg()
     * f2 -> Reg()
     * f3 -> IntegerLiteral()
     */
    public String visit(HLoadStmt n, String argu) {
        String target = n.f1.accept(this, argu);
        String src_base = n.f2.accept(this, argu);
        String offset = n.f3.accept(this, argu);
        printWithTab(String.format("lw %s, %s(%s)", target, offset, src_base));
        return null;
    }

    /**
     * f0 -> "MOVE"
     * f1 -> Reg()
     * f2 -> Exp()
     */
    public String visit(MoveStmt n, String argu) {
        String trg_reg = n.f1.accept(this, argu);
        String src_exp = n.f2.accept(this, argu);

        Node exp_type = n.f2.f0.choice;
        if (exp_type instanceof HAllocate) {
            printWithTab(String.format("move %s, %s", trg_reg, src_exp));
        } else if (exp_type instanceof BinOp) {
            BinOp bin_op = (BinOp) exp_type;
            String operator = bin_op.f0.f0.choice.toString();
            String left_val = bin_op.f1.accept(this, argu);
            String right_val = bin_op.f2.accept(this, argu);
            Node right_type = bin_op.f2.f0.choice;
            String available_reg = left_val.equals("$v1") ? "$v0" : "$v1";

            if (right_type instanceof IntegerLiteral) {
                printWithTab(String.format("li %s, %s", available_reg, right_val));
            } else if (right_type instanceof Label) {
                printWithTab(String.format("la %s, %s", available_reg, right_val));
            } else available_reg = right_val;

            String new_op;
            switch (operator) {
                case "LT": {
                    new_op = "slt";
                    break;
                }
                case "PLUS": {
                    new_op = "add";
                    break;
                }
                case "MINUS": {
                    new_op = "sub";
                    break;
                }
                default: {
                    new_op = "mul";
                    break;
                }
            }
            printWithTab(String.format("%s %s, %s, %s", new_op, trg_reg, left_val, available_reg));
        } else {
            assert (exp_type instanceof SimpleExp);
            Node simple_exp_type = ((SimpleExp) exp_type).f0.choice;
            if (simple_exp_type instanceof Reg) {
                printWithTab(String.format("move %s, %s", trg_reg, src_exp));
            } else if (simple_exp_type instanceof IntegerLiteral) {
                printWithTab(String.format("li %s, %s", trg_reg, src_exp));
            } else {
                printWithTab(String.format("la %s, %s", trg_reg, src_exp));
            }
        }
        return null;
    }

    /**
     * f0 -> "PRINT"
     * f1 -> SimpleExp()
     */
    public String visit(PrintStmt n, String argu) {
        String print_exp = n.f1.accept(this, argu);
        if (n.f1.f0.choice instanceof IntegerLiteral) {
            printWithTab(String.format("li $a0, %s", print_exp));
        } else {
            assert (n.f1.f0.choice instanceof Reg);
            printWithTab(String.format("move $a0, %s", print_exp));
        }
        printWithTab("li $v0, 1");
        printWithTab("syscall");

        printWithTab("li $v0, 4");
        printWithTab("la $a0, newline");
        printWithTab("syscall");
        return null;
    }

    /**
     * f0 -> "ALOAD"
     * f1 -> Reg()
     * f2 -> SpilledArg()
     */
    public String visit(ALoadStmt n, String argu) {
        String trg_reg = n.f1.accept(this, argu);
        String src_reg = n.f2.accept(this, argu);
        printWithTab(String.format("lw %s, %s", trg_reg, src_reg));
        return null;
    }

    /**
     * f0 -> "ASTORE"
     * f1 -> SpilledArg()
     * f2 -> Reg()
     */
    public String visit(AStoreStmt n, String argu) {
        String trg_reg = n.f2.accept(this, argu);
        String src_reg = n.f1.accept(this, argu);
        printWithTab(String.format("sw %s, %s", trg_reg, src_reg));
        return null;
    }

    /**
     * f0 -> "PASSARG"
     * f1 -> IntegerLiteral()
     * f2 -> Reg()
     */
    public String visit(PassArgStmt n, String argu) {
        int loc = Integer.parseInt(n.f1.accept(this, argu));
        String src_reg = n.f2.accept(this, argu);
        printWithTab(String.format("sw %s %d($sp)", src_reg, -4 * (loc + 2)));
        return null;
    }

    /**
     * f0 -> "CALL"
     * f1 -> SimpleExp()
     */
    public String visit(CallStmt n, String argu) {
        String simple_exp = n.f1.accept(this, argu);
        assert (!(n.f1.f0.choice instanceof IntegerLiteral));
        if (n.f1.f0.choice instanceof Label) {
            printWithTab("jal " + simple_exp);
        } else {
            printWithTab("jalr " + simple_exp);
        }
        return null;
    }

    /**
     * f0 -> HAllocate()
     * | BinOp()
     * | SimpleExp()
     */
    public String visit(Exp n, String argu) {
        return n.f0.accept(this, argu);
    }

    /**
     * f0 -> "HALLOCATE"
     * f1 -> SimpleExp()
     */
    public String visit(HAllocate n, String argu) {
        String simple_exp = n.f1.accept(this, argu);
        Node exp_type = n.f1.f0.choice;
        if (exp_type instanceof Reg) {
            printWithTab(String.format("move $a0, %s", simple_exp));
        } else {
            assert (exp_type instanceof IntegerLiteral);
            // It shouldn't be `Label`
            printWithTab(String.format("li $a0, %s", simple_exp));
        }

        printWithTab("li $v0, 9");
        printWithTab("syscall");
        return "$v0";
    }

    public String visit(BinOp n, String argu) {
        return null;
    }

    public String visit(SimpleExp n, String argu) {
        return n.f0.accept(this, argu);
    }

    public String visit(Operator n, String argu) {
        return n.f0.accept(this, argu);
    }

    /**
     * f0 -> "SPILLEDARG"
     * f1 -> IntegerLiteral()
     */
    public String visit(SpilledArg n, String argu) {
        int loc_num = Integer.parseInt(n.f1.accept(this, argu));
        return String.format("%d($sp)", present_stack_size - 4 * loc_num - 4);
    }


}
