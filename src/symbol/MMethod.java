package symbol;

import javax.print.DocFlavor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

public class MMethod extends MIdentifier {
    public String returnType;
    public String parent; // the method's class
    public HashMap<String, MVar> vars = new HashMap<>();
    public ArrayList<MVar> args = new ArrayList<>();
    public ArrayList<MVar> tmpArgs = new ArrayList<>(); // used for temp check

    public MMethod(String name, String returnType, String parent, int row, int col) {
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

    public MVar getVar(String var) {
        MVar mVar = vars.get(var);
        if (mVar == null) {
            mVar = MClassList.get(parent).getVar(var);
        }
        return mVar;
    }

    public String insertArg(MVar var) {
        args.add(var);
        String errMsg = this.insertVar(var);
        return errMsg;
    }

    public void insertTmpArg(MVar var) {
        tmpArgs.add(var);
    }

    public ArrayList<MVar> getArgs() {
        return this.args;
    }

    public String getReturnType() {
        return returnType;
    }

    public String getParent() {
        return parent;
    }

    // check parameters and return type
    public boolean isEqual(MMethod mMethod) {
        ArrayList<MVar> mArgs = mMethod.getArgs();
        if (args.size() != mArgs.size()) {
            String errMsg = "overloaded methods (arg number unequal): " + this.getName();
            ErrorPrinter.addError(errMsg);
            return false;
        }
        for (int i = 0; i < args.size(); i++) {
            if (!args.get(i).getType().equals(args.get(i).getType())) {
                String errMsg = "overloaded methods (arg type mismatch): " + this.getName();
                ErrorPrinter.addError(errMsg);
                return false;
            }
        }
        if (!this.getReturnType().equals(mMethod.getReturnType())) {
            String errMsg = "overloaded methods (return type mismatch): " + this.getName();
            ErrorPrinter.addError(errMsg);
            return false;
        }
        return true;
    }

}