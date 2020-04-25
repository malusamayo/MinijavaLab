package minijava.visitor;

import minijava.symbol.*;
import minijava.syntaxtree.*;

import java.util.HashSet;

public class BuildSymbolTableVisitor extends GJDepthFirst<MType, MType> {

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
        MIdentifier classId = (MIdentifier) n.f1.accept(this, argu);
        n.f2.accept(this, argu);
        n.f3.accept(this, argu);
        n.f4.accept(this, argu);
        n.f5.accept(this, argu);
        n.f6.accept(this, argu);
        n.f7.accept(this, argu);
        n.f8.accept(this, argu);
        n.f9.accept(this, argu);
        n.f10.accept(this, argu);
        MIdentifier argId = (MIdentifier) n.f11.accept(this, argu);

        MClass mainClass = new MClass(classId.getName(), "Object",
                classId.getRow(), classId.getCol());
        MClassList.insert(mainClass);
        MMethod mainMethod = new MMethod("main", "void",
                mainClass.getName(), n.f6.beginLine, n.f6.beginColumn);
        mainClass.insertMethod(mainMethod);
        MVar mainArg = new MVar(argId.getName(), "String[]", argId.getRow(), argId.getCol());
        mainMethod.insertArg(mainArg);

        n.f12.accept(this, argu);
        n.f13.accept(this, argu);
        n.f14.accept(this, mainMethod); // explore subtree VarDeclaration
        n.f15.accept(this, argu);
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
        MIdentifier classId = (MIdentifier) n.f1.accept(this, argu);
        MClass mClass = new MClass(classId.getName(), "Object",
                classId.getRow(), classId.getCol());
        String errMsg = MClassList.insert(mClass);
        if (errMsg != null) {
            ErrorPrinter.addError(errMsg);
            return _ret;
        }
        n.f2.accept(this, argu);
        n.f3.accept(this, mClass);
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
        MIdentifier classId = (MIdentifier) n.f1.accept(this, argu);
        n.f2.accept(this, argu);
        MIdentifier parentId = (MIdentifier) n.f3.accept(this, argu);
        MClass mClass = new MClass(classId.getName(), parentId.getName(),
                classId.getRow(), classId.getCol());
        String errMsg = MClassList.insert(mClass);
        if (errMsg != null) {
            ErrorPrinter.addError(errMsg);
            return _ret;
        }

        // check circular definition
        // if there is a circle, when the last edge is added, we could always find it
        HashSet<String> checkedClass = new HashSet<>();
        MClass curClass = MClassList.get(classId.getName());
        while (curClass != null) {
            if (checkedClass.contains(curClass.getName())) {
                errMsg = "circular definition: " + checkedClass.toString();
                ErrorPrinter.addError(errMsg);
                return _ret;
            }
            checkedClass.add(curClass.getName());
            curClass = MClassList.get(curClass.getParentName());
        }

        n.f4.accept(this, argu);
        n.f5.accept(this, mClass);
        n.f6.accept(this, mClass);
        n.f7.accept(this, argu);
        return _ret;
    }

    /**
     * f0 -> Type()
     * f1 -> Identifier()
     * f2 -> ";"
     */
    public MType visit(VarDeclaration n, MType argu) {
        MType _ret = null;
        MType varType = n.f0.accept(this, argu);
        MIdentifier varId = (MIdentifier) n.f1.accept(this, argu);
        n.f2.accept(this, argu);
        MVar var = new MVar(varId.getName(), varType.getType(), varId.getRow(), varId.getCol());
        String errMsg = null;
        if (argu instanceof MClass) {
            errMsg = ((MClass) argu).insertVar(var);
        } else if (argu instanceof MMethod) {
            errMsg = ((MMethod) argu).insertVar(var);
        }
        if (errMsg != null)
            ErrorPrinter.addError(errMsg);
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
        MType returnType = n.f1.accept(this, argu);
        MIdentifier methodId = (MIdentifier) n.f2.accept(this, argu);

        MMethod mMethod = new MMethod(methodId.getName(), returnType.getType(),
                ((MClass) argu).getName(), methodId.getRow(), methodId.getCol());
        String errMsg = ((MClass) argu).insertMethod(mMethod);
        if (errMsg != null) {
            ErrorPrinter.addError(errMsg);
            return _ret;
        }

        n.f3.accept(this, argu);
        n.f4.accept(this, mMethod);
        n.f5.accept(this, argu);
        n.f6.accept(this, argu);
        n.f7.accept(this, mMethod);
        n.f8.accept(this, argu);
        n.f9.accept(this, argu);
        n.f10.accept(this, argu);
        n.f11.accept(this, argu);
        n.f12.accept(this, argu);
        return _ret;
    }

    /**
     * f0 -> Type()
     * f1 -> Identifier()
     */
    public MType visit(FormalParameter n, MType argu) {
        MType _ret = null;
        MType paraType = n.f0.accept(this, argu);
        MIdentifier paraId = (MIdentifier) n.f1.accept(this, argu);
        MVar var = new MVar(paraId.getName(), paraType.getType(), paraId.getRow(), paraId.getCol());
        String errMsg = ((MMethod) argu).insertArg(var);
        if (errMsg != null)
            ErrorPrinter.addError(errMsg);
        return _ret;
    }

    /**
     * f0 -> ArrayType()
     * | BooleanType()
     * | IntegerType()
     * | Identifier()
     */
    public MType visit(Type n, MType argu) {
        MType _ret = n.f0.accept(this, argu);
        if (n.f0.choice instanceof Identifier) {
            _ret = new MType(((MIdentifier) _ret).getName());
        }
        return _ret;
    }

    /**
     * f0 -> "int"
     * f1 -> "["
     * f2 -> "]"
     */
    public MType visit(ArrayType n, MType argu) {
        MType _ret = new MType("int[]");
        n.f0.accept(this, argu);
        n.f1.accept(this, argu);
        n.f2.accept(this, argu);
        return _ret;
    }

    /**
     * f0 -> "boolean"
     */
    public MType visit(BooleanType n, MType argu) {
        MType _ret = new MType("boolean");
        n.f0.accept(this, argu);
        return _ret;
    }

    /**
     * f0 -> "int"
     */
    public MType visit(IntegerType n, MType argu) {
        MType _ret = new MType("int");
        n.f0.accept(this, argu);
        return _ret;
    }

    /**
     * f0 -> <IDENTIFIER>
     */
    public MType visit(Identifier n, MType argu) {
        MType _ret = new MIdentifier(n.f0.toString(), n.f0.beginLine, n.f0.beginColumn);
        n.f0.accept(this, argu);
        return _ret;
    }

}