package symbol;

import javax.print.DocFlavor;
import java.util.HashMap;

public class MClassList extends MType {
    public static HashMap<String, MClass> classList = new HashMap<>();

    public static String insert(MClass mClass) {
        String errMsg = null;
        if(classList.containsKey(mClass.getName())) {
            errMsg = "repeated class name: " + mClass.getName();
        } else {
            classList.put(mClass.getName(), mClass);
        }
        return errMsg;
    }

    public static MClass get(String className) {
        return classList.get(className);
    }

}