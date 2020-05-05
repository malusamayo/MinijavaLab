package spiglet.symbol;

import java.util.HashMap;
import java.util.HashSet;

public class MMethod {
    String name;
    CGraph graph = new CGraph();
    int argNum, stackNum = 0, maxCalleeArgNum = 0;

    public HashSet<Integer> callSites = new HashSet<>();

    // the followings are for liveness analysis and reg allocation


    public HashMap<Integer, Integer> sReg = new HashMap<>();
    public HashMap<Integer, Integer> tReg = new HashMap<>();
    public HashMap<Integer, Integer> stack = new HashMap<>();

    public MMethod(String name, int argNum) {
        this.name = name;
        this.argNum = argNum;
    }

    public String getName() {
        return name;
    }

    public void setStackNum(int stackNum) {
        this.stackNum = stackNum;
    }

    public void setMaxCalleeArgNum(int maxCalleeArgNum) {
        this.maxCalleeArgNum = maxCalleeArgNum;
    }

    public int getArgNum() {
        return argNum;
    }

    public int getStackNum() {
        return stackNum;
    }

    public int getMaxCalleeArgNum() {
        return maxCalleeArgNum;
    }

    public CGraph getGraph() {
        return graph;
    }

    public void addCallSites(int line) {
        callSites.add(line);
    }

    public void buildLiveVars() {

    }

    public void linearScan() {

    }

}
