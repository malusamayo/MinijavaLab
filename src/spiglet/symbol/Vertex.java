package spiglet.symbol;

import java.util.HashSet;

public class Vertex {
    public int line;
    public HashSet<Integer> gen = new HashSet<>();
    public HashSet<Integer> kill = new HashSet<>();
    public HashSet<Integer> in = new HashSet<>();
    public HashSet<Integer> out = new HashSet<>();
    public Vertex(int line) {
        this.line = line;
    }
    public void addGen(int num) {
        gen.add(num);
    }
    public void addKill(int num) {
        kill.add(num);
    }
    public void addIn(int num) {
        in.add(num);
    }
    public void addOut(int num) {
        out.add(num);
    }
}
