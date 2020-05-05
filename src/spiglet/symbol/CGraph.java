package spiglet.symbol;

import java.util.HashMap;
import java.util.HashSet;

public class CGraph {
    public HashMap<Integer, Vertex> vertexMap = new HashMap<>();
    public HashMap<Integer, HashSet<Integer>> edge = new HashMap<>();

    public void insertVertex(Vertex v) {
        vertexMap.put(v.line, v);
    }
    public void insertEdge(int from, int to) {
        if (!edge.containsKey(from))
            edge.put(from, new HashSet<>());
        edge.get(from).add(to);
    }
    public void addGen(int line, int tmpNum) {
        vertexMap.get(line).addGen(tmpNum);
    }
    public void addKill(int line, int tmpNum) {
        vertexMap.get(line).addKill(tmpNum);
    }

}
