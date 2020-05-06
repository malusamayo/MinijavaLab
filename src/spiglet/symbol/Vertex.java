package spiglet.symbol;

import java.util.HashSet;

public class Vertex implements Comparable<Vertex> {
    public int line;
    public HashSet<Integer> gen = new HashSet<>();
    public HashSet<Integer> kill = new HashSet<>();
    public HashSet<Integer> live = new HashSet<>();
    public Vertex(int line) {
        this.line = line;
    }
    public void addGen(int num) {
        gen.add(num);
    }
    public void addKill(int num) {
        kill.add(num);
    }

    public int compareTo(Vertex o) {
        return o.line - line;
    }

    public boolean update(CGraph graph) {
        HashSet<Integer> savedLive = live;
        live = new HashSet<>();
        for (Integer line: graph.succ.get(line)) {
            live.addAll(graph.vertexMap.get(line).live);
        }
        live.removeAll(kill);
        live.addAll(gen);
        if (live.equals(savedLive))
            return false;
        return true;
    }

}
