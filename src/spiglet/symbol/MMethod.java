package spiglet.symbol;

import java.lang.reflect.Array;
import java.util.*;

public class MMethod {
    String name;
    CGraph graph = new CGraph();
    int argNum, stackNum = 0, maxCalleeArgNum = 0;
    long sRegNumMax = 0;
    // should stackNum be accurate?

    public HashSet<Integer> callSites = new HashSet<>();

    // the followings are for liveness analysis and reg allocation

    public HashMap<Integer, Interval> intervals = new HashMap<>();

    public Boolean[] sRegUsed = new Boolean[8];
    public Boolean[] tRegUsed = new Boolean[10];
    public HashMap<Integer, Integer> sReg = new HashMap<>();
    public HashMap<Integer, Integer> tReg = new HashMap<>();
    public HashMap<Integer, Integer> stack = new HashMap<>();

    public MMethod(String name, int argNum) {
        this.name = name;
        this.argNum = argNum;
        Arrays.fill(sRegUsed, false);
        Arrays.fill(tRegUsed, false);
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

    public long getsRegNumMax() {
        return sRegNumMax;
    }

    public CGraph getGraph() {
        return graph;
    }

    public void addCallSites(int line) {
        callSites.add(line);
    }

    public void buildLiveVars() {
        LinkedList<Vertex> curVars = new LinkedList<>();
        curVars.addAll(graph.vertexMap.values());
        Collections.sort(curVars);
        curVars.removeFirst();
        while(!curVars.isEmpty()) {
            Vertex q = curVars.poll();
            if (q.update(graph)) {
                curVars.add(q);
                for (Integer line: graph.pred.get(q.line)) {
                    Vertex p = graph.vertexMap.get(line);
                    if (!curVars.contains(p))
                        curVars.add(p);
                }
            }
        }
    }

    public void buildIntervals() {
        for (Vertex v: graph.vertexMap.values()) {
            for (Integer i: v.live) {
                Interval interval = intervals.get(i);
                interval.setInterval(Integer.min(interval.st, v.line), Integer.max(interval.ed, v.line));
            }
        }
        for (Interval interval: intervals.values()) {
            for (Integer i: callSites) {
                if (interval.checkContainCall(i))
                    break;
            }
        }
    }

    public void freeReg(Interval interval) {
        if (sReg.containsKey(interval.num))
            sRegUsed[sReg.get(interval.num)] = false;
        else if (tReg.containsKey(interval.num))
            tRegUsed[tReg.get(interval.num)] = false;
        else
            assert false;
    }

    public boolean checkReg(Interval interval) {
        if (!interval.containCall) {
            for (int i=0; i<10; i++) {
                if (!tRegUsed[i]) {
                    tReg.put(interval.num, i);
                    tRegUsed[i] = true;
                    return true;
                }
            }
        }
        for (int i=0; i<8; i++) {
            if (!sRegUsed[i]) {
                sReg.put(interval.num, i);
                sRegUsed[i] = true;
                return true;
            }
        }
        return false;
    }

    public void spillReg(PriorityQueue<Interval> activeInterval, Interval interval) {
        Interval last = null;
        // intervals that contain call must be allocated an sReg
        if (interval.containCall) {
            for (Interval q: activeInterval) {
                if (sReg.containsKey(q.num)) {
                    last = q;
                    break;
                }
            }
        } else
            last = activeInterval.peek();
        if (last.ed > interval.ed) {
            // the spilled var should never use register
            if (tReg.containsKey(last.num)) {
                tReg.put(interval.num, tReg.get(last.num));
                tReg.remove(last.num);
            } else if (sReg.containsKey(last.num)) {
                sReg.put(interval.num, sReg.get(last.num));
                sReg.remove(last.num);
            }
            stack.put(last.num, stackNum);
            stackNum++;
            activeInterval.remove(last);
            activeInterval.add(interval);
        } else {
            stack.put(interval.num, stackNum);
            stackNum++;
        }
    }

    public void linearScan() {
        LinkedList<Interval> intervalList = new LinkedList<>();
        PriorityQueue<Interval> activeInterval = new PriorityQueue<>(Interval::compareByEd);
        intervalList.addAll(intervals.values());
        intervalList.sort(Interval::compareBySt);
        for (Interval interval: intervalList) {
            Iterator<Interval> iter = activeInterval.iterator(); // avoid concurrent exception
            while (iter.hasNext()) {
                Interval q = iter.next();
                if (q.ed < interval.st) {
                    freeReg(q);
                    iter.remove();
                }
            }
            if (checkReg(interval))
                activeInterval.add(interval);
            else {
                spillReg(activeInterval, interval);
            }
            // check sReg num
            sRegNumMax = Long.max(sRegNumMax, Arrays.stream(sRegUsed).filter(x -> x==true).count());
        }
        stackNum += sRegNumMax;
    }

}
