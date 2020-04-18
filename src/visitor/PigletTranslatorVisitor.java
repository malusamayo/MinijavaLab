package visitor;

import symbol.*;
import syntaxtree.*;

import java.util.*;

public class PigletTranslatorVisitor extends GJDepthFirst<MType, MType> {

    private Hashtable<String, Vector<String>> variables = new Hashtable<>();
    private Hashtable<String, Vector<String>> methods = new Hashtable<>();
    private Hashtable<String, String> renamedMethods = new Hashtable<>();
    private Hashtable<String, Integer> presentLocalVar = new Hashtable<>();
    private Integer tempNum = 20; // current temp number
    private Integer labelNum = 0; // current label num
    private MClass presentClass;
    private MMethod presentMethod;

    private void buildVariables(MClass curClass) {
        assert curClass != null;
        MClass thisClass = curClass;
        Vector<MClass> classList = new Vector<>();
        Vector<String> varList = new Vector<>();
        while (curClass != null) {
            classList.add(curClass);
            curClass = MClassList.get(curClass.getParentName());
        }
        // add root variables first, this makes the idx for parent vars stay the same
        // we store all hidden vars
        // we use @ as separator to avoid confusion with identifier char
        for (int idx = classList.size() - 1; idx >= 0; idx--) {
            for (String key : classList.get(idx).vars.keySet()) {
                varList.add(String.format("%s@%s", classList.get(idx).getName(), key));
            }
        }
        variables.put(thisClass.getName(), varList);
    }

    // find nearest var in the inheritance tree
    private int getVarOffset(String varName, String className) {
        Vector<String> thisVarList = variables.get(className);
        for (int idx = thisVarList.size() - 1; idx >= 0; idx--) {
            String curValue = thisVarList.get(idx);
            if (curValue.substring(curValue.indexOf('@') + 1).equals(varName))
                return (idx + 1) * 4;
        }
        throw new UnknownError("Unknown Error from get member variables");
    }

    private void buildMethods(MClass curClass) {
        assert curClass != null;
        MClass thisClass = curClass;
        Vector<MClass> classList = new Vector<>();
        Vector<String> methodList = new Vector<>();
        while (curClass != null) {
            classList.add(curClass);
            curClass = MClassList.get(curClass.getParentName());
        }
        // add root methods first
        // note that in minijava, the overrided methods will never be called, but the hidden vars could be used
        for (int idx = classList.size() - 1; idx >= 0; idx--) {
            String className = classList.get(idx).getName();
            for (String method : classList.get(idx).methods.keySet()) {
                int existIdx = -1;
                for (int x = 0; x < methodList.size(); ++x) {
                    String curVal = methodList.get(x);
                    curVal = curVal.substring(curVal.indexOf('@') + 1);
                    if (curVal.equals(method))
                        existIdx = x;
                }
                if (existIdx < 0)
                    methodList.add(String.format("%s@%s", className, method));
                else
                    methodList.set(existIdx, String.format("%s@%s", className, method));
            }
        }
        methods.put(thisClass.getName(), methodList);
    }

    private void buildRenameMap() {
        ArrayList<String> allMethods = new ArrayList<>();
        for (Map.Entry<String, MClass> mClassEntry : MClassList.classList.entrySet()) {
            MClass curClass = mClassEntry.getValue();
            for (String method : curClass.methods.keySet()) {
                String midName = curClass.getName() + "@" + method;
                String finalName = curClass.getName() + "_" + method;
                // add '_' to the end until no conflicts
                while (allMethods.contains(finalName)) {
                    finalName = finalName + '_';
                }
                allMethods.add(finalName);
                renamedMethods.put(midName, finalName);
            }
        }
    }

    private int getMethodOffset(String className, String methodName) {
        Vector<String> thisMethodList = methods.get(className);
        // the order is not important, since there is only **one** method with methodName
        for (int idx = 0; idx < thisMethodList.size(); ++idx) {
            String thisMethodName = thisMethodList.get(idx);
            thisMethodName = thisMethodName.substring(thisMethodName.indexOf('@') + 1);
            if (thisMethodName.equals(methodName))
                return idx * 4;
        }
        throw new UnknownError(String.format("Unmatched method: %s in class: %s", methodName, className));
    }

    private int getArgIdx(String leftVarName, MMethod curMethod) {
        for (int i = 0; i < curMethod.args.size(); ++i) {
            if (curMethod.args.get(i).name.equals(leftVarName))
                return i;
        }
        return -1;
    }

    /**
     * f0 -> MainClass()
     * f1 -> ( TypeDeclaration() )*
     * f2 -> <EOF>
     */
    public MType visit(Goal n, MType argu) {
        buildRenameMap();
        // get class information
        for (Map.Entry<String, MClass> mClassEntry : MClassList.classList.entrySet()) {
            MClass curClass = mClassEntry.getValue();
            buildVariables(curClass);
            buildMethods(curClass);
        }
        n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        n.f2.accept(this, argu);
        return null;
    }

    /**
     * f0 -> "class"
     * f1 -> Identifier()
     * f2 -> "{"
     * f3 -> "public"
     * f4 -> "static"
     * f5 -> "void"
     * f6 -> "main"
     * f7 -> "("
     * f8 -> "String"
     * f9 -> "["
     * f10 -> "]"
     * f11 -> Identifier()
     * f12 -> ")"
     * f13 -> "{"
     * f14 -> ( VarDeclaration() )*
     * f15 -> ( Statement() )*
     * f16 -> "}"
     * f17 -> "}"
     */
    public MType visit(MainClass n, MType argu) {
        PigletPrinter.MainPrinter();
        String className = n.f1.f0.toString();
        MClass curClass = MClassList.get(className);
        MMethod mainMethod = curClass.getMethod("main");
        presentClass = curClass;
        presentMethod = mainMethod;

        presentLocalVar = new Hashtable<>();
        presentLocalVar.put("this", 0);
        tempNum = 20;

        assert (mainMethod.args.size() == 1);
        presentLocalVar.put(mainMethod.args.get(0).name, 1);
        for (String localVar : mainMethod.vars.keySet()) {
            if (!presentLocalVar.containsKey(localVar)) // will there be any repeated var?
                presentLocalVar.put(localVar, tempNum++);
        }
        n.f15.accept(this, mainMethod);
        PigletPrinter.EndPrinter();
        return null;
    }

    /**
     * f0 -> "class"
     * f1 -> Identifier()
     * f2 -> "{"
     * f3 -> ( VarDeclaration() )*
     * f4 -> ( MethodDeclaration() )*
     * f5 -> "}"
     */
    public MType visit(ClassDeclaration n, MType argu) {
        PigletPrinter.myPrintln("");
        String thisClassName = n.f1.f0.toString();
        MClass thisClass = MClassList.get(thisClassName);
        presentClass = thisClass;

        n.f4.accept(this, thisClass);
        return null;
    }

    /**
     * f0 -> "class"
     * f1 -> Identifier()
     * f2 -> "extends"
     * f3 -> Identifier()
     * f4 -> "{"
     * f5 -> ( VarDeclaration() )*
     * f6 -> ( MethodDeclaration() )*
     * f7 -> "}"
     */
    public MType visit(ClassExtendsDeclaration n, MType argu) {
        String thisClassName = n.f1.f0.toString();
        MClass thisClass = MClassList.get(thisClassName);
        presentClass = thisClass;

        n.f6.accept(this, thisClass);
        return null;
    }

    /**
     * f0 -> "public"
     * f1 -> Type()
     * f2 -> Identifier()
     * f3 -> "("
     * f4 -> ( FormalParameterList() )?
     * f5 -> ")"
     * f6 -> "{"
     * f7 -> ( VarDeclaration() )*
     * f8 -> ( Statement() )*
     * f9 -> "return"
     * f10 -> Expression()
     * f11 -> ";"
     * f12 -> "}"
     */
    public MType visit(MethodDeclaration n, MType argu) {
        // TEMP0: this (Vtable), TEMP1-18: normal args, TEMP19: pointer to remaining args (if any)
        String thisMethodName = n.f2.f0.toString();
        MMethod thisMethod = presentClass.methods.get(thisMethodName);
        presentMethod = thisMethod;
        presentLocalVar = new Hashtable<>();
        presentLocalVar.put("this", 0);
        tempNum = 20;
        int idx = 1;
        // 为前18个参数和局部变量分配寄存器
        if (thisMethod.args.size() <= 18) {
            for (int i = 0; i < thisMethod.args.size(); ++i) {
                presentLocalVar.put(thisMethod.args.get(i).getName(), idx++);
            }
        } else {
            for (int i = 0; i < 18; ++i) {
                presentLocalVar.put(thisMethod.args.get(i).getName(), idx++);
            }
        }
        for (String localName : thisMethod.vars.keySet()) {
            // we do this because args are all in vars, need to separate them
            boolean containsFlag = false;
            for (MVar var : thisMethod.args) {
                if (var.name.equals(localName)) {
                    containsFlag = true;
                    break;
                }
            }
            if (containsFlag) continue;
            presentLocalVar.put(localName, tempNum++);
        }

        PigletPrinter.myPrintlnWithTab(String.format("%s [ %d ]",
                renamedMethods.get(presentClass.getName() + '@' +presentMethod.getName()),
                Math.min(presentMethod.args.size() + 1, 20)));
        PigletPrinter.tabNum++;
        PigletPrinter.BeginPrinter(true);
        n.f8.accept(this, thisMethod);
        PigletPrinter.ReturnPrinter();
        n.f10.accept(this, thisMethod);
        PigletPrinter.myPrintln("");
        PigletPrinter.EndPrinter();
        PigletPrinter.tabNum--;
        PigletPrinter.myPrintln("");
        return null;
    }

    /**
     * f0 -> Block()
     * | AssignmentStatement() done
     * | ArrayAssignmentStatement() done
     * | IfStatement() done
     * | WhileStatement() done
     * | PrintStatement() done
     */
    public MType visit(Statement n, MType argu) {
        n.f0.accept(this, argu);
        return null;
    }

    /**
     * f0 -> "if"
     * f1 -> "("
     * f2 -> Expression()
     * f3 -> ")"
     * f4 -> Statement()
     * f5 -> "else"
     * f6 -> Statement()
     */
    public MType visit(IfStatement n, MType argu) {
        int L1 = labelNum++;
        int L2 = labelNum++;
        PigletPrinter.myPrintWithTab("CJUMP "); // 如果条件不满足则跳转
        n.f2.accept(this, argu);
        PigletPrinter.myPrintlnWithTab("L" + L1);
        n.f4.accept(this, argu);
        PigletPrinter.myPrintln("");
        PigletPrinter.myPrintlnWithTab("JUMP L" + L2);
        PigletPrinter.myPrint("L" + L1); // add a label
        PigletPrinter.myPrintlnWithTab("NOOP"); // after label, add NOOP to avoid bugs
        n.f6.accept(this, argu);
        PigletPrinter.myPrintln("");
        PigletPrinter.myPrint(String.format("L%d", L2));
        PigletPrinter.myPrintlnWithTab("NOOP");
        return null;
    }


    /**
     * f0 -> "while"
     * f1 -> "("
     * f2 -> Expression()
     * f3 -> ")"
     * f4 -> Statement()
     */
    public MType visit(WhileStatement n, MType argu) {
        int label1 = labelNum++, label2 = labelNum++;
        PigletPrinter.myPrintln("");
        PigletPrinter.myPrint("L" + label1);
        PigletPrinter.myPrintWithTab("CJUMP ");
        n.f2.accept(this, argu);
        PigletPrinter.myPrintlnWithTab("L" + label2);
        n.f4.accept(this, argu);
        PigletPrinter.myPrintln("");
        PigletPrinter.myPrintlnWithTab("JUMP L" + label1);
        PigletPrinter.myPrint("L" + label2);
        PigletPrinter.myPrintlnWithTab("NOOP");
        return null;
    }

    /**
     * f0 -> "System.out.println"
     * f1 -> "("
     * f2 -> Expression()
     * f3 -> ")"
     * f4 -> ";"
     */
    public MType visit(PrintStatement n, MType argu) {
        PigletPrinter.myPrintWithTab("PRINT ");
        n.f2.accept(this, argu);
        PigletPrinter.myPrintln("");
        return null;
    }

    /**
     * f0 -> Identifier()
     * f1 -> "="
     * f2 -> Expression()
     * f3 -> ";"
     */
    public MType visit(AssignmentStatement n, MType argu) {
        String leftVarName = n.f0.f0.toString();
        MMethod curMethod = (MMethod) argu;
        MClass curClass = MClassList.get(curMethod.getParent());

        if (presentLocalVar.get(leftVarName) != null) {
            PigletPrinter.myPrintWithTab(String.format("MOVE TEMP %d ", presentLocalVar.get(leftVarName)));
        } else {
            int idx = getArgIdx(leftVarName, curMethod);
            assert ((idx == -1) || (idx > 18));
            if (idx == -1) {
                // 不在参数列表里，是成员变量
                PigletPrinter.myPrintWithTab(String.format("HSTORE TEMP 0 %d ",
                        getVarOffset(leftVarName, curClass.getName())));
            } else {
                // 有超过了18个参数，需要从Temp19指向的数组中存储元素
                PigletPrinter.myPrintWithTab(String.format("HSTORE TEMP 19 %d ",
                        4 * (idx - 18)));
            }
        }

        n.f2.accept(this, argu);
        PigletPrinter.myPrintln("");
        return null;
    }

    /**
     * f0 -> Identifier()
     * f1 -> "["
     * f2 -> Expression()
     * f3 -> "]"
     * f4 -> "="
     * f5 -> Expression()
     * f6 -> ";"
     */
    public MType visit(ArrayAssignmentStatement n, MType argu) {
        String leftVarName = n.f0.f0.toString();
        MMethod curMethod = (MMethod) argu;
        MClass curClass = MClassList.get(curMethod.getParent());
        int arrTemp = tempNum++; // 数组指针寄存器
        int tmpTemp = tempNum++; // 因为HLOAD后面的偏移只能接数字，所以必须先找到指针位置

        if (presentLocalVar.get(leftVarName) != null) {
            PigletPrinter.myPrintlnWithTab(String.format("MOVE TEMP %d TEMP %d", arrTemp,
                    presentLocalVar.get(leftVarName)));
        } else {
            int idx = getArgIdx(leftVarName, curMethod);
            assert ((idx == -1) || (idx > 18));
            if (idx == -1) {
                // 不在参数列表里，是成员变量
                PigletPrinter.myPrintlnWithTab(String.format("HLOAD TEMP %d TEMP 0 %d ",
                        arrTemp, getVarOffset(leftVarName, curClass.getName())));
            } else {
                // 有超过了18个参数，需要从Temp19指向的数组中提取元素
                PigletPrinter.myPrintlnWithTab(String.format("HLOAD TEMP %d TEMP 19 %d ",
                        arrTemp, 4 * (idx - 18)));
            }
        }
        PigletPrinter.myPrintWithTab(String.format("MOVE TEMP %d PLUS TEMP %d TIMES 4 PLUS 1 ", tmpTemp, arrTemp));
        n.f2.accept(this, argu);
        PigletPrinter.myPrintln("");
        PigletPrinter.myPrintWithTab(String.format("HSTORE TEMP %d 0 ", tmpTemp));
        n.f5.accept(this, argu);
        PigletPrinter.myPrintln("");
        return null;
    }

    /**
     * f0 -> AndExpression() done
     * | CompareExpression() done
     * | PlusExpression() done
     * | MinusExpression() done
     * | TimesExpression() done
     * | ArrayLookup() done
     * | ArrayLength() done
     * | MessageSend() done
     * | PrimaryExpression()
     */
    public MType visit(Expression n, MType argu) {
        return n.f0.accept(this, argu);
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "&&"
     * f2 -> PrimaryExpression()
     */
    public MType visit(AndExpression n, MType argu) {
        int nLabel1 = labelNum++;
        int nLabel2 = labelNum++;
        int retTemp = tempNum++;
        PigletPrinter.BeginPrinter(false);
        PigletPrinter.myPrintWithTab("CJUMP ");
        n.f0.accept(this, argu);
        PigletPrinter.myPrintlnWithTab("L" + nLabel1);
        PigletPrinter.myPrintWithTab("CJUMP ");
        n.f2.accept(this, argu);
        PigletPrinter.myPrintlnWithTab("L" + nLabel1);
        PigletPrinter.myPrintlnWithTab(String.format("MOVE TEMP %d 1", retTemp));
        PigletPrinter.myPrintlnWithTab(String.format("JUMP L%d", nLabel2));
        PigletPrinter.myPrint("L" + nLabel1);
        PigletPrinter.myPrintlnWithTab(String.format("MOVE TEMP %d 0", retTemp));
        PigletPrinter.myPrint("L" + nLabel2);
        PigletPrinter.myPrintlnWithTab("NOOP");
        PigletPrinter.ReturnPrinter();
        PigletPrinter.myPrintln("TEMP " + retTemp);
        PigletPrinter.EndPrinter();
        return null;
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "<"
     * f2 -> PrimaryExpression()
     */
    public MType visit(CompareExpression n, MType argu) {
        PigletPrinter.myPrint("LT ");
        n.f0.accept(this, argu);
        PigletPrinter.myPrint(" ");
        n.f2.accept(this, argu);
        return null;
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "+"
     * f2 -> PrimaryExpression()
     */
    public MType visit(PlusExpression n, MType argu) {
        PigletPrinter.myPrint("PLUS ");
        n.f0.accept(this, argu);
        PigletPrinter.myPrint(" ");
        n.f2.accept(this, argu);
        return null;
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "-"
     * f2 -> PrimaryExpression()
     */
    public MType visit(MinusExpression n, MType argu) {
        PigletPrinter.myPrint("MINUS ");
        n.f0.accept(this, argu);
        PigletPrinter.myPrint(" ");
        n.f2.accept(this, argu);
        return null;
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "*"
     * f2 -> PrimaryExpression()
     */
    public MType visit(TimesExpression n, MType argu) {
        PigletPrinter.myPrint("TIMES ");
        n.f0.accept(this, argu);
        PigletPrinter.myPrint(" ");
        n.f2.accept(this, argu);
        return null;
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "["
     * f2 -> PrimaryExpression()
     * f3 -> "]"
     */
    public MType visit(ArrayLookup n, MType argu) {
        int retTemp = tempNum++;
        int tmpTemp = tempNum++;
        PigletPrinter.BeginPrinter(true);
        PigletPrinter.myPrintWithTab(String.format("MOVE TEMP %d ", tmpTemp));
        n.f0.accept(this, argu);
        PigletPrinter.myPrintln("");
        // PigletPrinter.myPrintWithTab(String.format("HLOAD TEMP %d TEMP %d TIMES 4 ", retTemp, tmpTemp));
        PigletPrinter.myPrintWithTab(String.format("MOVE TEMP %d PLUS TEMP %d TIMES 4 PLUS 1 ", tmpTemp, tmpTemp));
        n.f2.accept(this, argu);
        PigletPrinter.myPrintln("");
        PigletPrinter.myPrintlnWithTab(String.format("HLOAD TEMP %d TEMP %d 0", retTemp, tmpTemp));
        PigletPrinter.ReturnPrinter();
        PigletPrinter.myPrintln("TEMP " + retTemp);
        PigletPrinter.EndPrinter();
        return null;
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "."
     * f2 -> "length"
     */
    public MType visit(ArrayLength n, MType argu) {
        int retTemp = tempNum++;
        PigletPrinter.myPrintln("");
        PigletPrinter.BeginPrinter(true);
        PigletPrinter.myPrintWithTab(String.format("MOVE TEMP %d ", retTemp));
        n.f0.accept(this, argu);
        PigletPrinter.myPrintln("");
        PigletPrinter.myPrintlnWithTab(String.format("HLOAD TEMP %d TEMP %d 0", retTemp, retTemp));
        PigletPrinter.ReturnPrinter();
        PigletPrinter.myPrintln("TEMP " + retTemp);
        PigletPrinter.EndPrinter();
        return null;
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "."
     * f2 -> Identifier()
     * f3 -> "("
     * f4 -> ( ExpressionList() )?
     * f5 -> ")"
     */
    public MType visit(MessageSend n, MType argu) {
        int instanceTemp = tempNum++;
        int methodsTemp = tempNum++;
        String calledMethodName = n.f2.f0.toString();
        PigletPrinter.myPrint("CALL");
        PigletPrinter.BeginPrinter(true);
        PigletPrinter.myPrintWithTab("MOVE TEMP " + instanceTemp + " ");

        // process PrimaryExpression
        // [debug] for debug
        /*
        MType tmpType = n.f0.accept(this, argu);
        if (tmpType == null) {
            System.out.println("DEBUG");
        }
        assert tmpType != null;
        String calledClassName = tmpType.getType();
        */
        // [debug] debug end
        String calledClassName = n.f0.accept(this, argu).getType();
        MMethod calledMethod = MClassList.get(calledClassName).getMethod(calledMethodName);
        PigletPrinter.myPrintln("");
        PigletPrinter.myPrintlnWithTab("HLOAD TEMP " + methodsTemp + " TEMP " + instanceTemp + " 0");

        // get method location
        int methodBias = getMethodOffset(calledClassName, calledMethodName);
        PigletPrinter.myPrintlnWithTab("HLOAD TEMP " + methodsTemp + " TEMP " +
                methodsTemp + " " + methodBias);
        PigletPrinter.ReturnPrinter();
        PigletPrinter.myPrintln("TEMP " + methodsTemp);
        PigletPrinter.EndPrinter();
        PigletPrinter.myPrintWithTab("(TEMP " + instanceTemp + " ");

        n.f4.accept(this, calledMethod);
        PigletPrinter.myPrintln(")");
        return new MType(calledMethod.returnType);
    }

    /**
     * f0 -> Expression()
     * f1 -> ( ExpressionRest() )*
     */
    public MType visit(ExpressionList n, MType argu) {
        MMethod curMethod = (MMethod) argu;
        MArgInfo argInfo = new MArgInfo(1, curMethod);
        n.f0.accept(this, argu);
        n.f1.accept(this, argInfo);
        return null;
    }

    /**
     * f0 -> ","
     * f1 -> Expression()
     */
    public MType visit(ExpressionRest n, MType argu) {
        MArgInfo argInfo = (MArgInfo) argu;
        argInfo.curArgIdx++;
        assert (argInfo.curArgIdx >= 2);
        if (argInfo.curArgIdx < 19) {
            n.f1.accept(this, argInfo.curMethod);
        } else {
            if (argInfo.curArgIdx == 19) {
                PigletPrinter.BeginPrinter(false);
                argInfo.tmpTempNum = tempNum++;
                PigletPrinter.myPrintlnWithTab(String.format("MOVE TEMP %d HALLOCATE %d",
                        argInfo.tmpTempNum, 4 * (argInfo.curMethod.args.size() - 18)));
                PigletPrinter.myPrintWithTab(String.format("HSTORE TEMP %d 0 ", argInfo.tmpTempNum));
            } else {
                PigletPrinter.myPrintWithTab(String.format("HSTORE TEMP %d %d ", argInfo.tmpTempNum,
                        4 * (argInfo.curArgIdx - 19)));
            }
            n.f1.accept(this, argInfo.curMethod);
            PigletPrinter.myPrintln("");
            if (argInfo.curArgIdx == argInfo.curMethod.args.size()) {
                PigletPrinter.ReturnPrinter();
                PigletPrinter.myPrintln(String.format("TEMP %d", argInfo.tmpTempNum));
                PigletPrinter.EndPrinter();
            }
        }
        return null;
    }

    /**
     * f0 -> IntegerLiteral() done
     * | TrueLiteral() done
     * | FalseLiteral() done
     * | Identifier() done
     * | ThisExpression() done
     * | ArrayAllocationExpression() done
     * | AllocationExpression() done
     * | NotExpression() done
     * | BracketExpression() done
     */
    public MType visit(PrimaryExpression n, MType argu) {
        return n.f0.accept(this, argu);
    }

    /**
     * f0 -> "new"
     * f1 -> "int"
     * f2 -> "["
     * f3 -> Expression()
     * f4 -> "]"
     */
    public MType visit(ArrayAllocationExpression n, MType argu) {
        // 0 offset used to store len, remaining ones to store contents
        int retTemp = tempNum++;
        int tmpTemp = tempNum++;
        PigletPrinter.BeginPrinter(true);
        PigletPrinter.myPrintWithTab(String.format("MOVE TEMP %d ", tmpTemp));
        n.f3.accept(this, argu);
        PigletPrinter.myPrintln("");
        PigletPrinter.myPrintlnWithTab(String.format("MOVE TEMP %d HALLOCATE TIMES 4 PLUS 1 TEMP %d ",
                retTemp, tmpTemp));
        PigletPrinter.myPrintlnWithTab(String.format("HSTORE TEMP %d 0 TEMP %d ", retTemp, tmpTemp)); // store len
        PigletPrinter.ReturnPrinter();
        PigletPrinter.myPrintln("TEMP " + retTemp);
        PigletPrinter.EndPrinter();
        return new MType("int[]");
    }

    /**
     * f0 -> <IDENTIFIER>
     */
    public MType visit(Identifier n, MType argu) {
        String thisId = n.f0.toString();
        // find where this identifier is
        MClass curClass = presentClass;
        MMethod curMethod = presentMethod;
        MType _ret = curMethod.getVar(thisId);

        if (presentLocalVar.get(thisId) != null) {
            // 如果在局部变量中（包含前18个参数中）
            PigletPrinter.myPrint(String.format("TEMP %s ", presentLocalVar.get(thisId).toString()));
        } else {
            int tmpTempNum = tempNum++;
            int idx = getArgIdx(thisId, curMethod);
            assert ((idx == -1) || (idx > 18));
            if (idx == -1) {
                // 不在参数列表里，是成员变量
                int varOffset = getVarOffset(thisId, curClass.getName());
                PigletPrinter.BeginPrinter(true);
                PigletPrinter.myPrintlnWithTab(String.format("HLOAD TEMP %d TEMP 0 %d",
                        tmpTempNum, varOffset));
                PigletPrinter.ReturnPrinter();
                PigletPrinter.myPrintln(String.format("TEMP %d", tmpTempNum));
                PigletPrinter.EndPrinter();
            } else {
                // 有超过了18个参数，需要从Temp19指向的数组中提取元素
                PigletPrinter.BeginPrinter(true);
                PigletPrinter.myPrintln(String.format("HLOAD TEMP %d TEMP 19 %d",
                        tmpTempNum, (idx - 18) * 4));
                PigletPrinter.ReturnPrinter();
                PigletPrinter.myPrintln(String.format("TEMP %d", tmpTempNum));
                PigletPrinter.EndPrinter();
            }
        }
        return _ret;
    }


    /**
     * f0 -> "new"
     * f1 -> Identifier()
     * f2 -> "("
     * f3 -> ")"
     */
    public MType visit(AllocationExpression n, MType argu) {
        // 生成函数体，以BEGIN开头，RETURN结尾
        // 返回一个寄存器，存储instance的位置
        // instance的格式：methods的头的地址->var1->var2...
        String thisClassName = n.f1.f0.toString();
        Vector<String> thisMethods = methods.get(thisClassName);

        int instanceTemp = tempNum++;
        int methodsTemp = tempNum++;
        PigletPrinter.BeginPrinter(true);
        PigletPrinter.myPrintlnWithTab(String.format("MOVE TEMP %d HALLOCATE %d",
                instanceTemp, (variables.get(thisClassName).size() + 1) * 4));
        PigletPrinter.myPrintlnWithTab(String.format("MOVE TEMP %d HALLOCATE %d",
                methodsTemp, (methods.get(thisClassName).size() * 4)));
        PigletPrinter.myPrintlnWithTab(String.format("HSTORE TEMP %d 0 TEMP %d",
                instanceTemp, methodsTemp));
        for (int i = 0; i < variables.get(thisClassName).size(); ++i) {
            PigletPrinter.myPrintlnWithTab(String.format("HSTORE TEMP %d %d 0",
                    instanceTemp, (i + 1) * 4));
        }
        for (int i = 0; i < thisMethods.size(); ++i) {
            PigletPrinter.myPrintlnWithTab(String.format("HSTORE TEMP %d %d %s",
                    methodsTemp, i * 4, renamedMethods.get(thisMethods.get(i))));
        }
        PigletPrinter.ReturnPrinter();
        PigletPrinter.myPrintln("TEMP " + instanceTemp);
        PigletPrinter.EndPrinter();
        return new MType(thisClassName);
    }

    /**
     * f0 -> "("
     * f1 -> Expression()
     * f2 -> ")"
     */
    public MType visit(BracketExpression n, MType argu) {
        return n.f1.accept(this, argu);
    }

    /**
     * f0 -> "this"
     */
    public MType visit(ThisExpression n, MType argu) {
        assert (argu instanceof MMethod);
        PigletPrinter.myPrintln("TEMP 0 ");
        // 如果没有bug，这里的presentClass和curMethod.parent应该是一样的
        MMethod curMethod = (MMethod) argu;
        assert (presentClass.getName().equals(curMethod.parent));
        return new MType(curMethod.parent);
    }

    /**
     * f0 -> "!"
     * f1 -> Expression()
     */
    public MType visit(NotExpression n, MType argu) {
        PigletPrinter.myPrintWithTab("MINUS 1 ");
        return n.f1.accept(this, argu);
    }

    /**
     * f0 -> <INTEGER_LITERAL>
     */
    public MType visit(IntegerLiteral n, MType argu) {
        PigletPrinter.myPrint(String.format("%s ", n.f0.toString()));
        return null;
    }

    /**
     * f0 -> "true"
     */
    public MType visit(TrueLiteral n, MType argu) {
        PigletPrinter.myPrint("1 ");
        return null;
    }

    /**
     * f0 -> "false"
     */
    public MType visit(FalseLiteral n, MType argu) {
        PigletPrinter.myPrint("0 ");
        return null;
    }
}
