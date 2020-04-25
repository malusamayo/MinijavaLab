package minijava.symbol;

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

    public MVar getVar(String var) {
        MVar mVar = vars.get(var);
        MClass parentClass = MClassList.get(parent);
        if (mVar == null && parentClass != null) {
            mVar = parentClass.getVar(var);
        }
        return mVar;
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

    // a problem: circular inheritance would lead to infinite loop?
    // actually not, since if circular inheritance happens, we will never check its contents!
    public MMethod getMethod(String method) {
        MMethod curMethod = methods.get(method);
        MClass parentClass = MClassList.get(parent);
        if (curMethod == null && parentClass != null) {
            curMethod = MClassList.get(parent).getMethod(method);
        }
        return curMethod;
    }

    public String getParentName() {
        return parent;
    }

    public boolean isChildOf(String name) {
        MClass curClass = this;
        while (curClass != null) {
            if (curClass.getName().equals(name))
                return true;
            curClass = MClassList.get(curClass.getParentName());
        }
        return false;
    }

}