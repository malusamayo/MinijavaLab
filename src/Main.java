import java.io.*;

import visitor.*;
import syntaxtree.*;
import symbol.*;


public class Main {
    public static void main(String[] args) {
        try {
            InputStream in = new FileInputStream(args[0]);
            Node root = new MiniJavaParser(in).Goal();
            MType allClassList = new MClassList();
            root.accept(new BuildSymbolTableVisitor(), allClassList);
            if (ErrorPrinter.getSize() != 0) {
                System.out.println("Type error!");
                ErrorPrinter.printError();
                throw new ParseException("TE");
            } else {
                root.accept(new TypeCheckVisitor(), allClassList);
                if (ErrorPrinter.getSize() == 0) {
                    System.out.println("Program type checked successfully.");
                } else {
                    System.out.println("Type error!");
                    ErrorPrinter.printError();
                    throw new ParseException("TE");
                }
            }

            // Lab2 starts from here
            root.accept(new PigletTranslatorVisitor(), allClassList);
        } catch (TokenMgrError | Exception e) {
            e.printStackTrace();
        }
    }
}

