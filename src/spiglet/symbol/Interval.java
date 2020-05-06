package spiglet.symbol;

public class Interval {
    int st, ed, num;
    boolean containCall = false;
    public Interval(int st, int ed, int num) {
        this.st = st;
        this.ed = ed;
        this.num = num;
    }

    public boolean checkContainCall(int line) {
        if (line >= st && line < ed)
            this.containCall = true;
        return this.containCall;
    }

    public void setInterval(int st, int ed) {
        this.st = st;
        this.ed = ed;
    }

    public int compareBySt(Interval o) {
        return st - o.st;
    }

    public int compareByEd(Interval o) {
        return o.ed - ed;
    }
}
