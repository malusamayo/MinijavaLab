package minijava.symbol;

public class MArgInfo extends MType {
    public int curArgIdx = 0;
    public MMethod curMethod;
    public int tmpTempNum = -1;
    public MArgInfo (int idx, MMethod cur) {
        this.curArgIdx = idx;
        this.curMethod = cur;
        this.type = "Info";
    }
    public MArgInfo () {
        this.type = "Info";
    }
}