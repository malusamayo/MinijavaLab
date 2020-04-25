package piglet.symbol;

public class SPigletPrinter {
    public static boolean printTab = false;

    public static void myPrintln(String s) {
        if (printTab) System.out.print("\t");
        System.out.println(s);
    }

    public static void myPrint(String s) {
        if (printTab) System.out.print("\t");
        System.out.print(s);
    }

    public static void printMain() {
        myPrintln("MAIN");
        printTab = true;
    }

    public static void printBegin() {
        myPrintln("BEGIN");
        printTab = true;
    }

    public static void printEnd() {
        printTab = false;
        myPrintln("END");
    }
}
