package symbol;

import java.util.ArrayList;
import java.util.HashMap;

public class MMethod extends MIdentifier {
    public String returnType;
    public String parent; // the method's class
    public HashMap<String, MVar> vars = new HashMap<>();
    public ArrayList<MVar> args = new ArrayList<>();
    public ArrayList<MVar> realArgs = new ArrayList<>(); // used for real arg check

    public MMethod(String name, String returnType, String parent, int row, int col) {
        super(name, row, col);
        this.returnType = returnType;
        this.parent = parent;
    }

    public String insertVar(MVar var) {
        String errMsg = null;
        if(vars.containsKey(var.getName())) {
            errMsg = "repeated variable name " + var.getName() + " in method: " + this.name;
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

    public void insertRealArgs(MVar var) {
        realArgs.add(var);
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

    // check parameters and return type, which should be identical
    public boolean isEqual(MMethod mMethod) {
        ArrayList<MVar> mArgs = mMethod.getArgs();
        if (args.size() != mArgs.size()) {
            String errMsg = "overloaded methods (arg number unequal): " + this.getName();
            ErrorPrinter.addError(errMsg);
            return false;
        }
        for (int i = 0; i < args.size(); i++) {
            if (!args.get(i).getType().equals(mArgs.get(i).getType())) {
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

    public static void checkRealArgs(ArrayList<MVar> args, ArrayList<MVar> realArgs, String info, int line) {
        if (args.size() != realArgs.size()) {
            String errMsg = "arg number mismatch: " + info + " in line " + line;
            ErrorPrinter.addError(errMsg);
            return;
        }
        for (int i = 0; i < args.size(); i++) {
            String argType = args.get(i).getType();
            String realArgType = realArgs.get(i).getType();
            // check inheritance
            if (argType.equals(realArgType))
                continue;
            MClass mClass = MClassList.get(realArgType);
            if (mClass != null && mClass.isChildOf(argType))
                continue;
            String errMsg = "arg type mismatch: " + info +  " in line " + line;
            ErrorPrinter.addError(errMsg);
        }
        realArgs.clear();
    }

}