package spiglet.symbol;

import java.util.HashMap;
import java.util.HashSet;

public class CGraph {
    public HashMap<Integer, Vertex> vertexMap = new HashMap<>();
    public HashMap<Integer, HashSet<Integer>> pred = new HashMap<>();
    public HashMap<Integer, HashSet<Integer>> succ = new HashMap<>();

    public void insertVertex(Vertex v) {
        vertexMap.put(v.line, v);
        succ.put(v.line, new HashSet<>());
        if (!pred.containsKey(v.line))
            pred.put(v.line, new HashSet<>());
    }
    public void insertEdge(int from, int to) {
        succ.get(from).add(to);
        if (!pred.containsKey(to))
            pred.put(to, new HashSet<>());
        pred.get(to).add(from);
    }
    public void addGen(int line, int tmpNum) {
        vertexMap.get(line).addGen(tmpNum);
    }
    public void addKill(int line, int tmpNum) {
        vertexMap.get(line).addKill(tmpNum);
    }

}
