package visitor;

import symbol.*;
import syntaxtree.*;

import java.util.*;

public class PigletTranslatorVisitor extends GJDepthFirst<MType, MType> {

    private Hashtable<String, Vector<String>> Variables = new Hashtable<>();
    private Hashtable<String, Vector<String>> Methods = new Hashtable<>();
    private Hashtable<String, Integer> presentLocalVar = new Hashtable<>();
    private Integer tempNum = 20; // current temp number
    private MClass presentClass;
    private MMethod presentMethod;

    private String getTemp() {
        String ret = "TEMP " + tempNum.toString();
        tempNum++;
        return ret;
    }

    private int getVarOffset(String varName, String className) {
        Vector<String> thisVarList = Variables.get(className);
        String realName = String.format("%s_%s", className, varName);
        for (int idx = 0; idx < thisVarList.size(); ++idx) {
            if (thisVarList.get(idx).equals(realName))
                return (idx + 1) * 4;
        }
        throw new UnknownError("Unknown Error from get member variables");
    }

    private void getFromOver18(int tmp, int offset, String idName) {
        PigletPrinter.BeginPrinter(true);
        PigletPrinter.myPrintln(String.format("HLOAD TEMP %d TEMP 19 %d",
                tmp, offset));
        PigletPrinter.ReturnPrinter();
        PigletPrinter.myPrintln(String.format("TEMP %d", tmp));
        PigletPrinter.EndPrinter();
    }

    private void buildVariables(MClass curClass) {
        assert curClass != null;
        MClass thisClass = curClass;
        Vector<MClass> classList = new Vector<>();
        Vector<String> varList = new Vector<>();
        while (curClass != null) {
            classList.add(curClass);
            curClass = MClassList.get(curClass.getParentName());
        }
        // add root variables first
        for (int idx = classList.size() - 1; idx >= 0; idx--) {
            for (String key : classList.get(idx).vars.keySet()) {
                varList.add(String.format("%s_%s", classList.get(idx).getName(), key));
            }
        }
        Variables.put(thisClass.getName(), varList);
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
        for (int idx = classList.size() - 1; idx >= 0; idx--) {
            String className = classList.get(idx).getName();
            for (String method : classList.get(idx).methods.keySet()) {
                int existIdx = -1;
                for (int x = 0; x < methodList.size(); ++x) {
                    String curVal = methodList.get(x);
                    curVal = curVal.substring(curVal.indexOf('_'));
                    if (curVal.equals(method))
                        existIdx = x;
                }
                if (existIdx < 0)
                    methodList.add(String.format("%s_%s", className, method));
                else
                    methodList.set(existIdx, String.format("%s_%s", className, method));
            }
        }
        Methods.put(thisClass.getName(), methodList);
    }

    private int getMethodBias(String className, String methodName) {
        Vector<String> thisMethodList = Methods.get(className);
        for (int idx = 0; idx < thisMethodList.size(); ++idx) {
            String thisMethodName = thisMethodList.get(idx);
            thisMethodName = thisMethodName.substring(thisMethodName.indexOf('_') + 1);
            if (thisMethodName.equals(methodName))
                return idx * 4;
        }
        throw new UnknownError(String.format("Unmatched method: %s in class: %s", methodName, className));
    }

    /**
     * f0 -> MainClass()
     * f1 -> ( TypeDeclaration() )*
     * f2 -> <EOF>
     */
    public MType visit(Goal n, MType argu) {
        // get class information
        for (Map.Entry<String, MClass> stringMClassEntry : MClassList.classList.entrySet()) {
            MClass curClass = stringMClassEntry.getValue();
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

        presentLocalVar = new Hashtable<String, Integer>();
        presentLocalVar.put("this", 0);
        tempNum = 20;

        assert (mainMethod.args.size() == 1);
        presentLocalVar.put(mainMethod.args.get(0).name, 1);
        for (String localVar : mainMethod.vars.keySet()) {
            if (!presentLocalVar.containsKey(localVar))
                presentLocalVar.put(localVar, tempNum++);
        }
        n.f15.accept(this, mainMethod);
        PigletPrinter.EndPrinter();
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
        return null;
    }

    /**
     * f0 -> AndExpression()
     * | CompareExpression()
     * | PlusExpression()
     * | MinusExpression()
     * | TimesExpression()
     * | ArrayLookup()
     * | ArrayLength()
     * | MessageSend()
     * | PrimaryExpression()
     */
    public MType visit(Expression n, MType argu) {
        return n.f0.accept(this, argu);
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
        PigletPrinter.myPrintln("CALL");
        PigletPrinter.BeginPrinter(true);
        PigletPrinter.myPrintWithTab("MOVE TEMP " + instanceTemp + " ");

        // process PrimaryExpression
        String calledClassName = n.f0.accept(this, argu).getType();
        MMethod calledMethod = MClassList.get(calledClassName).getMethod(calledMethodName);
        PigletPrinter.myPrintlnWithTab("HLOAD TEMP " + methodsTemp + " TEMP " + instanceTemp + " 0");

        // get method location
        int methodBias = getMethodBias(calledClassName, calledMethodName);
        PigletPrinter.myPrintlnWithTab("HLOAD TEMP " + methodsTemp + " TEMP " +
                methodsTemp + " " + methodBias);
        PigletPrinter.ReturnPrinter();
        PigletPrinter.myPrintln("TEMP" + methodsTemp);
        PigletPrinter.EndPrinter();
        PigletPrinter.myPrintWithTab("(TEMP " + instanceTemp + " ");

        n.f4.accept(this, calledMethod);
        PigletPrinter.myPrintln(")");
        return null;
    }

    /**
     * f0 -> IntegerLiteral()
     * | TrueLiteral()
     * | FalseLiteral()
     * | Identifier()
     * | ThisExpression()
     * | ArrayAllocationExpression()
     * | AllocationExpression()
     * | NotExpression()
     * | BracketExpression()
     */
    public MType visit(PrimaryExpression n, MType argu) {
        return n.f0.accept(this, argu);
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
        Vector<String> thisMethods = Methods.get(thisClassName);

        int instanceTemp = tempNum++;
        int methodsTemp = tempNum++;
        PigletPrinter.BeginPrinter(false);
        PigletPrinter.myPrintlnWithTab(String.format("MOVE TEMP %d HALLOCATE %d",
                instanceTemp, (Variables.get(thisClassName).size() + 1) * 4));
        PigletPrinter.myPrintlnWithTab(String.format("MOVE TEMP %d HALLOCATE %d",
                methodsTemp, (Methods.get(thisClassName).size() * 4)));
        PigletPrinter.myPrintlnWithTab(String.format("HSTORE TEMP %d 0 TEMP %d",
                instanceTemp, methodsTemp));
        for (int i = 0; i < thisMethods.size(); ++i) {
            PigletPrinter.myPrintlnWithTab(String.format("HSTORE TEMP %d %d %s",
                    methodsTemp, i * 4, thisMethods.get(i)));
        }
        PigletPrinter.ReturnPrinter();
        PigletPrinter.myPrintln("Temp " + instanceTemp);
        PigletPrinter.EndPrinter();
        return new MType(thisClassName);
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
            int idx = -1;
            for (int i = 0; i < curMethod.args.size(); ++i) {
                if (curMethod.args.get(i).name.equals(thisId)) {
                    idx = i;
                    break;
                }
            }
            assert ((idx == -1) || (idx > 18));
            if (idx == -1) {
                // 不在参数列表里，是成员变量
                int varOffset = getVarOffset(thisId, curClass.getName());
                PigletPrinter.BeginPrinter(true);
                PigletPrinter.myPrintln(String.format("HLOAD TEMP %d TEMP 0 %d",
                        tmpTempNum, varOffset));
                PigletPrinter.ReturnPrinter();
                PigletPrinter.myPrintln(String.format("Temp %d", tmpTempNum));
                PigletPrinter.EndPrinter();
            } else {
                // 有超过了18个参数，需要从Temp19指向的数组中提取元素
                getFromOver18(tmpTempNum, (idx - 18) * 4, thisId);
            }
        }
        return _ret;
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

    /**
     * f0 -> "class"
     * f1 -> Identifier()
     * f2 -> "{"
     * f3 -> ( VarDeclaration() )*
     * f4 -> ( MethodDeclaration() )*
     * f5 -> "}"
     */
    public MType visit(ClassDeclaration n, MType argu) {
        String thisClassName = n.f1.f0.toString();
        MClass thisClass = MClassList.get(thisClassName);
        presentClass = thisClass;

        n.f4.accept(this, thisClass);
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
        String thisMethodName = n.f2.f0.toString();
        MMethod thisMethod = presentClass.methods.get(thisMethodName);
        presentLocalVar = new Hashtable<>();
        presentLocalVar.put("this", 0);
        tempNum = 20;
        return null;
    }

}
