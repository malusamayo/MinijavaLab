import java.io.*;

import minijava.MiniJavaParser;
import minijava.ParseException;
import minijava.TokenMgrError;
import minijava.visitor.*;
import minijava.syntaxtree.*;
import minijava.symbol.*;


public class Main {
    public static void main(String[] args) {
        try {
            InputStream in = new FileInputStream(args[0]);
            String fileName = args[0].substring(0, args[0].indexOf('.'));
            String fileType = args[0].substring(args[0].indexOf('.'));
            if (fileType.equals(".pg")) {
                // lab3 starts
                piglet.syntaxtree.Node root = new piglet.PigletParser(in).Goal();
                FileOutputStream outFile = new FileOutputStream(fileName + ".spg");
                System.setOut(new PrintStream(outFile));
                root.accept(new piglet.visitor.CountTempMax(), null);
                root.accept(new piglet.visitor.SPigletTranslator(), null);
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

