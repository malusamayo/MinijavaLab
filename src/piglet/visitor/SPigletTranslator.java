package piglet.visitor;

import piglet.visitor.*;
import piglet.syntaxtree.*;
import piglet.symbol.*;

import java.util.Enumeration;

public class SPigletTranslator extends GJDepthFirst<String, String> {

    private boolean outMove = false;

    public String visit(NodeListOptional n, String argu) {
        if (n.present()) {
            StringBuilder _ret = new StringBuilder();
            for (Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
                _ret.append(e.nextElement().accept(this, argu));
            }
            return _ret.toString();
        } else
            return "";
    }

    public String visit(NodeOptional n, String argu) {
        if (n.present()) {
            SPigletPrinter.printTab = false;
            SPigletPrinter.myPrint(n.node.accept(this, argu));
            SPigletPrinter.printTab = true;
        }
        return null;
    }

    /**
     * f0 -> "MAIN"
     * f1 -> StmtList()
     * f2 -> "END"
     * f3 -> ( Procedure() )*
     * f4 -> <EOF>
     */
    public String visit(Goal n, String argu) {
        SPigletPrinter.printMain();
        n.f1.accept(this, "MAIN");
        SPigletPrinter.printEnd();
        n.f3.accept(this, argu);
        return null;
    }

    /**
     * f0 -> Label()
     * f1 -> "["
     * f2 -> IntegerLiteral()
     * f3 -> "]"
     * f4 -> StmtExp()
     */
    public String visit(Procedure n, String argu) {
        String procedureName = n.f0.f0.toString();
        SPigletPrinter.myPrintln(String.format("%s [%s]", procedureName, n.f2.f0.toString()));
        SPigletPrinter.printBegin();
        SPigletPrinter.myPrintln(String.format("RETURN %s", n.f4.accept(this, procedureName)));
        SPigletPrinter.printEnd();
        return null;
    }

    /**
     * f0 -> NoOpStmt()
     * | ErrorStmt()
     * | CJumpStmt()
     * | JumpStmt()
     * | HStoreStmt()
     * | HLoadStmt()
     * | MoveStmt()
     * | PrintStmt()
     */
    public String visit(Stmt n, String argu) {
        SPigletPrinter.myPrintln(n.f0.accept(this, argu));
        return null;
    }

    /**
     * f0 -> "NOOP"
     */
    public String visit(NoOpStmt n, String argu) {
        return "NOOP";
    }

    /**
     * f0 -> "ERROR"
     */
    public String visit(ErrorStmt n, String argu) {
        return "ERROR";
    }

    /**
     * f0 -> "CJUMP"
     * f1 -> Exp()
     * f2 -> Label()
     */
    public String visit(CJumpStmt n, String argu) {
        return String.format("CJUMP %s %s", n.f1.accept(this, argu), n.f2.accept(this, argu));
    }

    /**
     * f0 -> "JUMP"
     * f1 -> Label()
     */
    public String visit(JumpStmt n, String argu) {
        return String.format("JUMP %s", n.f1.accept(this, argu));
    }

    /**
     * f0 -> "HSTORE"
     * f1 -> Exp()
     * f2 -> IntegerLiteral()
     * f3 -> Exp()
     */
    public String visit(HStoreStmt n, String argu) {
        return String.format("HSTORE %s %s %s", n.f1.accept(this, argu), n.f2.accept(this, argu),
                n.f3.accept(this, argu));
    }

    /**
     * f0 -> "HLOAD"
     * f1 -> Temp()
     * f2 -> Exp()
     * f3 -> IntegerLiteral()
     */
    public String visit(HLoadStmt n, String argu) {
        return String.format("HLOAD %s %s %s", n.f1.accept(this, argu), n.f2.accept(this, argu),
                n.f3.accept(this, argu));
    }

    /**
     * f0 -> "MOVE"
     * f1 -> Temp()
     * f2 -> Exp()
     */
    public String visit(MoveStmt n, String argu) {
        outMove = true;
        String retValue = String.format("MOVE %s %s", n.f1.accept(this, argu), n.f2.accept(this, argu));
        outMove = false;
        return retValue;
    }

    /**
     * f0 -> "PRINT"
     * f1 -> Exp()
     */
    public String visit(PrintStmt n, String argu) {
        return String.format("PRINT %s", n.f1.accept(this, argu));
    }

    /**
     * f0 -> StmtExp()
     * | Call()
     * | HAllocate()
     * | BinOp()
     * | Temp()
     * | IntegerLiteral()
     * | Label()
     */
    public String visit(Exp n, String argu) {
        if (outMove) {
            outMove = false;
            String retValue = n.f0.accept(this, argu);
            outMove = true;
            return retValue;
        }

        int curTemp = Counter.MaxTemp.get(argu);
        Counter.MaxTemp.put(argu, curTemp + 1);
        SPigletPrinter.myPrintln(String.format("MOVE TEMP %d %s", curTemp,
                n.f0.accept(this, argu)));
        return String.format("TEMP %d ", curTemp);
    }

    /**
     * f0 -> "BEGIN"
     * f1 -> StmtList()
     * f2 -> "RETURN"
     * f3 -> Exp()
     * f4 -> "END"
     */
    public String visit(StmtExp n, String argu) {
        n.f1.accept(this, argu);
        return n.f3.accept(this, argu);
    }

    /**
     * f0 -> "CALL"
     * f1 -> Exp()
     * f2 -> "("
     * f3 -> ( Exp() )*
     * f4 -> ")"
     */
    public String visit(Call n, String argu) {
        return String.format("CALL %s (%s)", n.f1.accept(this, argu),
                n.f3.accept(this, argu));
    }

    /**
     * f0 -> "HALLOCATE"
     * f1 -> Exp()
     */
    public String visit(HAllocate n, String argu) {
        return String.format("HALLOCATE %s", n.f1.accept(this, argu));
    }

    /**
     * f0 -> Operator()
     * f1 -> Exp()
     * f2 -> Exp()
     */
    public String visit(BinOp n, String argu) {
        return String.format("%s %s %s", n.f0.accept(this, argu),
                n.f1.accept(this, argu), n.f2.accept(this, argu));
    }

    /**
     * f0 -> "LT"
     * | "PLUS"
     * | "MINUS"
     * | "TIMES"
     */
    public String visit(Operator n, String argu) {
        return n.f0.choice.toString();
    }

    /**
     * f0 -> "TEMP"
     * f1 -> IntegerLiteral()
     */
    public String visit(Temp n, String argu) {
        return "TEMP " + n.f1.accept(this, argu);
    }

    /**
     * f0 -> <INTEGER_LITERAL>
     */
    public String visit(IntegerLiteral n, String argu) {
        return n.f0.toString() + " ";
    }

    /**
     * f0 -> <IDENTIFIER>
     */
    public String visit(Label n, String argu) {
        return n.f0.toString() + " ";
    }
}
