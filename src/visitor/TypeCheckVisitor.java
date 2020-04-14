package visitor;

import syntaxtree.*;
import symbol.*;

public class TypeCheckVisitor extends GJDepthFirst<MType, MType> {

    public void handleTypeMismatch(String inType, String destType, String info, int line) {
        if (inType.equals(destType))
            return;
        MClass mClass = MClassList.get(destType);
        if (mClass != null && mClass.isChildOf(inType))
            return;
        String errMsg = "type mismatch (" + info + "): " + inType + ", " + destType + " in line " + line;
        ErrorPrinter.addError(errMsg);
    }

    public void handleUndefined(String info, int line) {
        String errMsg = "undefined " + info + " in line " + line;
        ErrorPrinter.addError(errMsg);
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
        MType _ret = null;
        n.f0.accept(this, argu);
        MType className = n.f1.accept(this, argu);
        MClass mainClass = MClassList.get(className.getType());
        MMethod mainMethod = mainClass.getMethod("main");
        n.f2.accept(this, argu);
        n.f3.accept(this, argu);
        n.f4.accept(this, argu);
        n.f5.accept(this, argu);
        n.f6.accept(this, argu);
        n.f7.accept(this, argu);
        n.f8.accept(this, argu);
        n.f9.accept(this, argu);
        n.f10.accept(this, argu);
        n.f11.accept(this, argu);
        n.f12.accept(this, argu);
        n.f13.accept(this, argu);
        n.f14.accept(this, argu);
        n.f15.accept(this, mainMethod);
        n.f16.accept(this, argu);
        n.f17.accept(this, argu);
        return _ret;
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
        MType _ret = null;
        n.f0.accept(this, argu);
        MType className = n.f1.accept(this, argu);
        MClass mClass = MClassList.get(className.getType());
        n.f2.accept(this, argu);
        n.f3.accept(this, argu);
        n.f4.accept(this, mClass);
        n.f5.accept(this, argu);
        return _ret;
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
        MType _ret = null;
        n.f0.accept(this, argu);
        MType className = n.f1.accept(this, argu);
        n.f2.accept(this, argu);
        MType parentClassName = n.f3.accept(this, argu);

        // check undefined parent class
        if (MClassList.get(parentClassName.getType()) == null) {
            handleUndefined("extended class: " + parentClassName.getType(), n.f2.beginLine);
            return _ret;
        }

        n.f4.accept(this, argu);
        n.f5.accept(this, argu);
        n.f6.accept(this, MClassList.get(className.getType()));
        n.f7.accept(this, argu);
        return _ret;
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
        MType _ret = null;
        n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        MType methodName = n.f2.accept(this, argu);
        MClass topClass = (MClass) argu;
        MMethod topMethod = topClass.getMethod(methodName.getType());

        // check override
        MClass curClass = MClassList.get(topClass.getParentName());
        while (curClass != null) {
            MMethod curMethod = curClass.getMethod(methodName.getType());
            if (curMethod != null && !topMethod.isEqual(curMethod)) {
                return _ret;
            }
            curClass = MClassList.get(curClass.getParentName());
        }

        n.f3.accept(this, argu);
        n.f4.accept(this, argu);
        n.f5.accept(this, argu);
        n.f6.accept(this, argu);
        n.f7.accept(this, argu);
        n.f8.accept(this, topMethod);
        n.f9.accept(this, argu);
        MType returnType = n.f10.accept(this, topMethod);
        n.f11.accept(this, argu);
        n.f12.accept(this, argu);

        // check return type consistency
        handleTypeMismatch(topMethod.getReturnType(), returnType.getType(), "return", n.f9.beginLine);
        return _ret;
    }

    /**
     * f0 -> ArrayType()
     * | BooleanType()
     * | IntegerType()
     * | Identifier()
     */
    public MType visit(Type n, MType argu) {
        MType _ret = null;
        n.f0.accept(this, argu);
        // we only have to check undefined class here once and for all
        if (n.f0.choice instanceof Identifier) {
            String className = ((Identifier) n.f0.choice).f0.toString();
            if (MClassList.get(className) == null) {
                handleUndefined("class: " + className, ((Identifier) n.f0.choice).f0.beginLine);
            }
        }
        return _ret;
    }

    /**
     * f0 -> Identifier()
     * f1 -> "="
     * f2 -> Expression()
     * f3 -> ";"
     */
    public MType visit(AssignmentStatement n, MType argu) {
        MType _ret = null;
        MType leftName = n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        MType rightType = n.f2.accept(this, argu);
        n.f3.accept(this, argu);
        MMethod curMethod = (MMethod) argu;
        MVar leftVar = curMethod.getVar(leftName.getType());
        if (leftVar == null) {
            handleUndefined("variable: " + leftName.getType(), n.f1.beginLine);
        } else {
            assert rightType != null;
            handleTypeMismatch(leftVar.getType(), rightType.getType(), "assign", n.f0.f0.beginLine);
        }
        return _ret;
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
        MType _ret = null;
        MType leftName = n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        MType indexType = n.f2.accept(this, argu);
        n.f3.accept(this, argu);
        n.f4.accept(this, argu);
        MType rightType = n.f5.accept(this, argu);
        n.f6.accept(this, argu);
        MMethod curMethod = (MMethod) argu;
        MVar leftVar = curMethod.getVar(leftName.getType());
        if (leftVar == null) {
            handleUndefined("variable: " + leftVar.getName(), n.f1.beginLine);
        } else {
            handleTypeMismatch(leftVar.getType(), "int[]", "array", n.f0.f0.beginLine);
            handleTypeMismatch(rightType.getType(), "int", "array", n.f0.f0.beginLine);
        }
        handleTypeMismatch(indexType.getType(), "int", "array index", n.f0.f0.beginLine);
        return _ret;
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
        MType _ret = null;
        n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        MType conditionType = n.f2.accept(this, argu);
        handleTypeMismatch(conditionType.getType(), "boolean", "if", n.f0.beginLine);
        n.f3.accept(this, argu);
        n.f4.accept(this, argu);
        n.f5.accept(this, argu);
        n.f6.accept(this, argu);
        return _ret;
    }

    /**
     * f0 -> "while"
     * f1 -> "("
     * f2 -> Expression()
     * f3 -> ")"
     * f4 -> Statement()
     */
    public MType visit(WhileStatement n, MType argu) {
        MType _ret = null;
        n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        MType conditionType = n.f2.accept(this, argu);
        handleTypeMismatch(conditionType.getType(), "boolean", "while", n.f0.beginLine);
        n.f3.accept(this, argu);
        n.f4.accept(this, argu);
        return _ret;
    }

    /**
     * f0 -> "System.out.println"
     * f1 -> "("
     * f2 -> Expression()
     * f3 -> ")"
     * f4 -> ";"
     */
    public MType visit(PrintStatement n, MType argu) {
        MType _ret = null;
        n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        MType printType = n.f2.accept(this, argu);
        handleTypeMismatch(printType.getType(), "int", "print", n.f0.beginLine);
        n.f3.accept(this, argu);
        n.f4.accept(this, argu);
        return _ret;
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
        // we expect all expressions return a type
        MType _ret = n.f0.accept(this, argu);
//        if (_ret == null)
//            _ret = new MType("none");
        return _ret;
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "&&"
     * f2 -> PrimaryExpression()
     */
    public MType visit(AndExpression n, MType argu) {
        MType _ret = new MType("boolean");
        MType leftType = n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        MType rightType = n.f2.accept(this, argu);
        handleTypeMismatch(leftType.getType(), "boolean", "&&", n.f1.beginLine);
        handleTypeMismatch(rightType.getType(), "boolean", "&&", n.f1.beginLine);
        return _ret;
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "<"
     * f2 -> PrimaryExpression()
     */
    public MType visit(CompareExpression n, MType argu) {
        MType _ret = new MType("boolean");
        MMethod curMethod = (MMethod) argu;
        MType leftType = n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        MType rightType = n.f2.accept(this, argu);
        handleTypeMismatch(leftType.getType(), "int", "<", n.f1.beginLine);
        handleTypeMismatch(rightType.getType(), "int", "<", n.f1.beginLine);
        return _ret;
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "+"
     * f2 -> PrimaryExpression()
     */
    public MType visit(PlusExpression n, MType argu) {
        MType _ret = new MType("int");
        MType leftType = n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        MType rightType = n.f2.accept(this, argu);
        handleTypeMismatch(leftType.getType(), "int", "+", n.f1.beginLine);
        handleTypeMismatch(rightType.getType(), "int", "+", n.f1.beginLine);
        return _ret;
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "-"
     * f2 -> PrimaryExpression()
     */
    public MType visit(MinusExpression n, MType argu) {
        MType _ret = new MType("int");
        MType leftType = n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        MType rightType = n.f2.accept(this, argu);
        handleTypeMismatch(leftType.getType(), "int", "-", n.f1.beginLine);
        handleTypeMismatch(rightType.getType(), "int", "-", n.f1.beginLine);
        return _ret;
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "*"
     * f2 -> PrimaryExpression()
     */
    public MType visit(TimesExpression n, MType argu) {
        MType _ret = new MType("int");
        MType leftType = n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        MType rightType = n.f2.accept(this, argu);
        handleTypeMismatch(leftType.getType(), "int", "*", n.f1.beginLine);
        handleTypeMismatch(rightType.getType(), "int", "*", n.f1.beginLine);
        return _ret;
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "["
     * f2 -> PrimaryExpression()
     * f3 -> "]"
     */
    public MType visit(ArrayLookup n, MType argu) {
        MType _ret = new MType("int");
        MType varType = n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        MType indexType = n.f2.accept(this, argu);
        n.f3.accept(this, argu);
        handleTypeMismatch(varType.getType(), "int[]", "array lookup", n.f1.beginLine);
        handleTypeMismatch(indexType.getType(), "int", "array lookup index", n.f1.beginLine);
        return _ret;
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "."
     * f2 -> "length"
     */
    public MType visit(ArrayLength n, MType argu) {
        MType _ret = new MType("int");
        MType varType = n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        n.f2.accept(this, argu);
        handleTypeMismatch(varType.getType(), "int[]", "array length", n.f1.beginLine);
        return _ret;
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
        MType _ret = new MType("token");
        MType type = n.f0.accept(this, argu);
        // f0 should be a user-defined class
        MClass curClass = MClassList.get(type.getType());
        if (curClass == null) {
            handleUndefined("user class: " + type.getType(), n.f1.beginLine);
            return _ret;
        }
        n.f1.accept(this, argu);

        MType methodName = n.f2.accept(this, argu);
        MMethod curMethod = curClass.getMethod(methodName.getType());
        if (curMethod == null) {
            handleUndefined("method: " + methodName.getType(), n.f1.beginLine);
            return _ret;
        }

        n.f3.accept(this, argu);
        n.f4.accept(this, argu);
        n.f5.accept(this, argu);

        MMethod.checkRealArgs(curMethod.getArgs(), ((MMethod) argu).realArgs, methodName.getType(), n.f1.beginLine);

        _ret = new MType(curMethod.getReturnType());
        return _ret;
    }

    /**
     * f0 -> Expression()
     * f1 -> ( ExpressionRest() )*
     */
    public MType visit(ExpressionList n, MType argu) {
        MType _ret = null;
        MType type = n.f0.accept(this, argu);
        ((MMethod) argu).insertRealArgs(new MVar("token", type.getType(), -1, -1));
        n.f1.accept(this, argu);
        return _ret;
    }

    /**
     * f0 -> ","
     * f1 -> Expression()
     */
    public MType visit(ExpressionRest n, MType argu) {
        MType _ret = null;
        n.f0.accept(this, argu);
        MType type = n.f1.accept(this, argu);
        ((MMethod) argu).insertRealArgs(new MVar("token", type.getType(), -1, -1));
        return _ret;
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
        MType _ret = n.f0.accept(this, argu);
        // we only need the type of a variable
        if (n.f0.choice instanceof Identifier) {
            MMethod curMethod = (MMethod) argu;
            MVar var = curMethod.getVar(_ret.getType());
            if (var == null)
                handleUndefined("variable: " + _ret.getType(), ((Identifier) n.f0.choice).f0.beginLine);
            else
                _ret = new MType(var.getType());
        }
//        if (_ret == null)
//            _ret = new MType("none");
        return _ret;
    }

    /**
     * f0 -> <INTEGER_LITERAL>
     */
    public MType visit(IntegerLiteral n, MType argu) {
        MType _ret = new MType("int");
        n.f0.accept(this, argu);
        return _ret;
    }

    /**
     * f0 -> "true"
     */
    public MType visit(TrueLiteral n, MType argu) {
        MType _ret = new MType("boolean");
        n.f0.accept(this, argu);
        return _ret;
    }

    /**
     * f0 -> "false"
     */
    public MType visit(FalseLiteral n, MType argu) {
        MType _ret = new MType("boolean");
        n.f0.accept(this, argu);
        return _ret;
    }

    /**
     * f0 -> <IDENTIFIER>
     */
    public MType visit(Identifier n, MType argu) {
        MType _ret = new MType(n.f0.toString());
        n.f0.accept(this, argu);
        return _ret;
    }

    /**
     * f0 -> "this"
     */
    public MType visit(ThisExpression n, MType argu) {
        MType _ret = new MType("token");
        n.f0.accept(this, argu);
        if (argu instanceof MClass) {
            _ret = new MType(((MClass) argu).getName());
        } else if (argu instanceof MMethod) {
            _ret = new MType(((MMethod) argu).getParent());
        }
        return _ret;
    }

    /**
     * f0 -> "new"
     * f1 -> "int"
     * f2 -> "["
     * f3 -> Expression()
     * f4 -> "]"
     */
    public MType visit(ArrayAllocationExpression n, MType argu) {
        MType _ret = new MType("int[]");
        n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        n.f2.accept(this, argu);
        MType lenType = n.f3.accept(this, argu);
        n.f4.accept(this, argu);
        handleTypeMismatch(lenType.getType(), "int", "array alloc len", n.f0.beginLine);
        return _ret;
    }

    /**
     * f0 -> "new"
     * f1 -> Identifier()
     * f2 -> "("
     * f3 -> ")"
     */
    public MType visit(AllocationExpression n, MType argu) {
        MType _ret = null;
        n.f0.accept(this, argu);
        MType className = n.f1.accept(this, argu);
        _ret = new MType(className.getType());
        n.f2.accept(this, argu);
        n.f3.accept(this, argu);
        if (MClassList.get(className.getType()) == null) {
            handleUndefined("class: " + className.getType(), n.f0.beginLine);
        }
        return _ret;
    }

    /**
     * f0 -> "!"
     * f1 -> Expression()
     */
    public MType visit(NotExpression n, MType argu) {
        MType _ret = new MType("boolean");
        n.f0.accept(this, argu);
        MType expType = n.f1.accept(this, argu);
        handleTypeMismatch(expType.getType(), "boolean", "!", n.f0.beginLine);
        return _ret;
    }

    /**
     * f0 -> "("
     * f1 -> Expression()
     * f2 -> ")"
     */
    public MType visit(BracketExpression n, MType argu) {
        MType _ret = null;
        n.f0.accept(this, argu);
        _ret = n.f1.accept(this, argu);
        n.f2.accept(this, argu);
        return _ret;
    }

}