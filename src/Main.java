import java.io.*;

import visitor.*;
import syntaxtree.*;
import symbol.*;
import piglet.*;


public class Main {
    public static void main(String[] args) {
        try {
            InputStream in = new FileInputStream(args[0]);
            String fileName = args[0].substring(0, args[0].indexOf('.'));
            String fileType = args[0].substring(args[0].indexOf('.'));
            if (fileType.equals(".pg")) {
                piglet.syntaxtree.Node root = new PigletParser(in).Goal();
            }
            else {
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
                FileOutputStream outFile = new FileOutputStream(fileName + ".pg");
                System.setOut(new PrintStream(outFile));
                root.accept(new PigletTranslatorVisitor(), allClassList);
            }
        } catch (TokenMgrError | Exception e) {
            e.printStackTrace();
        }
    }
}

