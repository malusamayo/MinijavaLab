import java.io.*;
import visitor.*;
import syntaxtree.*;
import symbol.*;

class MyVisitor extends DepthFirstVisitor {
	public void visit(VarDeclaration n) {
		Identifier id = (Identifier)n.f1;
		System.out.println("VarName: " + id.f0.toString());
		n.f0.accept(this);
		n.f1.accept(this);
		n.f2.accept(this);
	}
}

public class Main {
	// TODO 子类赋值给父类未实现
	// 这个似乎number类型只有int？
	// 小问题：同一个方法的嵌套定义变量似乎词法分析根本不允许
	public static void main(String[] args){
		try {
			InputStream in = new FileInputStream(args[0]);
			Node root = new MiniJavaParser(in).Goal();
			MType allClassList = new MClassList();
			root.accept(new BuildSymbolTableVisitor(), allClassList);
			root.accept(new TypeCheckVisitor(), allClassList);
			if (ErrorPrinter.getSize() == 0) {
				System.out.println("Program type checked successfully.");
			} else {
				System.out.println("Type error!");
				ErrorPrinter.printError();
			}
		} catch (TokenMgrError | Exception e) {
			e.printStackTrace();
		}
	}
}

