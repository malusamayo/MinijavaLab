package symbol;

import java.util.ArrayList;

public class ErrorPrinter {
    public static ArrayList<String> errMsgs = new ArrayList<>();
    public static void addError(String errMsg) {
        errMsgs.add(errMsg);
    }
    public static int getSize() {
        return errMsgs.size();
    }
    public static void printError() {
        for (String errMsg: errMsgs) {
            System.out.println(errMsg);
        }
    }
}
