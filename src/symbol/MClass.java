package symbol;

import java.util.HashMap;

public class MClass extends MIdentifier {
    public HashMap<String, MMethod> methods = new HashMap<>();
    public HashMap<String, MVar> vars = new HashMap<>();
    public String parent;

    public MClass(String className, String parent, int row, int col) {
        super(className, row, col);
        this.parent = parent;

    }

    public String insertVar(MVar var) {
        String errMsg = null;
        if(vars.containsKey(var.getName())) {
            errMsg = "repeated variable name " + var.getName() + " in class: " + this.name;
        } else {
            vars.put(var.getName(), var);
        }
        return errMsg;
    }

    public String insertMethod(MMethod method) {
        String errMsg = null;
        if(methods.containsKey(method.getName())) {
            errMsg = "repeated method name " + method.getName() + " in class: " + this.name;
        } else {
            methods.put(method.getName(), method);
        }
        return errMsg;
    }

}