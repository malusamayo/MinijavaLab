package symbol;

import javax.print.DocFlavor;
import java.util.HashMap;

public class MClassList extends MType {
    public HashMap<String, MClass> classList = new HashMap<>();

    public String insert(MClass mClass) {
        String errMsg = null;
        if(classList.containsKey(mClass.getName())) {
            errMsg = "repeated class name: " + mClass.getName();
        } else {
            classList.put(mClass.getName(), mClass);
        }
        return errMsg;
    }
}