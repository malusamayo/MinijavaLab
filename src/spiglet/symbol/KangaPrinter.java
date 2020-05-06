package spiglet.symbol;

public class KangaPrinter {
    public static boolean printTab = false;

    public static void myPrintln(String s) {
        if (printTab) System.out.print("\t");
        System.out.println(s);
    }

    public static void myPrint(String s) {
        if (printTab) System.out.print("\t");
        System.out.print(s);
    }

    public static void printMethod(String name, int x, int y, int z) {
        myPrintln(String.format("%s[%d][%d][%d]", name, x, y, z));
        printTab = true;
    }

    public static void printEnd() {
        printTab = false;
        myPrintln("END");
    }
}
