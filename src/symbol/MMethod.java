package symbol;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

public class MMethod extends MIdentifier {
    public String returnType;
    public MIdentifier parent; // the method's class
    public HashMap<String, MVar> vars = new HashMap<>();
    public ArrayList<MVar> args = new ArrayList<>();

    public MMethod(String name, String returnType, MIdentifier parent, int row, int col) {
        super(name, row, col);
        this.returnType = returnType;
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

    public String insertArg(MVar var) {
        args.add(var);
        String errMsg = this.insertVar(var);
        return errMsg;
    }


}