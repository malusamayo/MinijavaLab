package symbol;

public class MVar extends MIdentifier {
    public MVar(String name, String type, int row, int col) {
        super(name, row, col);
        this.type = type;
    }

}
