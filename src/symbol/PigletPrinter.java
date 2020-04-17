package symbol;

public class PigletPrinter {
    public static int tabNum = 0;

    public static void myPrintln(String s) {
        System.out.println(s);
    }

    public static void myPrintlnWithTab(String s) {
        for (int idx = 0; idx < tabNum; ++idx) {
            System.out.print("\t");
        }
        System.out.println(s);
    }

    public static void myPrint(String s) {
        System.out.print(s);
    }

    public static void myPrintWithTab(String s) {
        for (int idx = 0; idx < tabNum; ++idx) {
            System.out.print("\t");
        }
        System.out.print(s);
    }

    public static void MainPrinter() {
        myPrintlnWithTab("MAIN");
        tabNum++;
    }

    public static void EndPrinter() {
        tabNum--;
        myPrintlnWithTab("END");
    }

    public static void BeginPrinter(boolean withTab) {
        if (withTab)
            myPrintlnWithTab("BEGIN");
        else
            myPrintln("BEGIN");
        tabNum++;
    }

    public static void ReturnPrinter() {
        myPrintWithTab("RETURN ");
    }
}
