package symbol;

public class PigletPrinter {
    public static String piglet_code;
    public static int tabNum = 0;
    public static boolean toString = false;

    public static void saveCode(String file_path) {

    }

    public static void myPrintln(String s) {
        if (toString) {
            piglet_code += s + '\n';
            for (int idx = 0; idx < tabNum; ++idx) {
                piglet_code += "\t";
            }
        }
        else {
            System.out.println(s);
            for (int idx = 0; idx < tabNum; ++idx) {
                System.out.print("\t");
            }
        }
    }

    public static void myPrint(String s) {
        if (toString) {
            piglet_code += s;
        }
        else {
            System.out.print(s);
        }
    }

    public static void MainPrinter() {
        tabNum++;
        myPrintln("MAIN");
    }

    public static void EndPrinter() {
        tabNum--;
        myPrintln("END");
    }

    public static void BeginPrinter() {
        myPrintln("BEGIN");
        tabNum++;
    }

    public static void ReturnPrinter() {
        myPrint("RETURN");
        tabNum--;
    }
}
