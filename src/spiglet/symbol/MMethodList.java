package spiglet.symbol;

import java.util.HashMap;

public class MMethodList {
    static HashMap<String, MMethod> methodList = new HashMap<>();
    public static void insert(MMethod mMethod) {
        methodList.put(mMethod.getName(), mMethod);
    }
    public static MMethod get(String methodName) {
        return methodList.get(methodName);
    }
    public static void buildLiveVars() {
        for (MMethod mMethod : methodList.values()) {
            mMethod.buildLiveVars();
            mMethod.buildIntervals();
            mMethod.linearScan();
        }
    }
}
