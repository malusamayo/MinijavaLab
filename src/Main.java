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
            switch (fileType) {
                case ".kg": {
                    // final lab starts from here
                    // yeahhhhhhhhhhhhhhhhhhhhhh
                    kanga.syntaxtree.Node root = new kanga.KangaParser(in).Goal();
                    FileOutputStream outFile = new FileOutputStream(fileName + ".s");
                    System.setOut(new PrintStream(outFile));
                    root.accept(new kanga.visitor.MIPSTranslator(), null);
                    break;
                }
                case ".spg": {
                    // lab4 starts
                    spiglet.syntaxtree.Node root = new spiglet.SpigletParser(in).Goal();
                    FileOutputStream outFile = new FileOutputStream(fileName + ".kg");
                    System.setOut(new PrintStream(outFile));
                    root.accept(new spiglet.visitor.BuildGraphVisitor(), null);
                    root.accept(new spiglet.visitor.KangaTranslator(), null);
                    break;
                }
                case ".pg": {
                    // lab3 starts
                    piglet.syntaxtree.Node root = new piglet.PigletParser(in).Goal();
                    FileOutputStream outFile = new FileOutputStream(fileName + ".spg");
                    System.setOut(new PrintStream(outFile));
                    root.accept(new piglet.visitor.CountTempMax(), null);
                    root.accept(new piglet.visitor.SPigletTranslator(), null);
                    break;
                }
                default: {
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
                    break;
                }
            }
        } catch (TokenMgrError | Exception e) {
            e.printStackTrace();
        }
    }
}

