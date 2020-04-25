package minijava.symbol;

public class MIdentifier extends MType {
    public String name;
    public int row, col;

    public MIdentifier() {}
    public MIdentifier(String name, int row, int col) {
        this.name = name;
        this.row = row;
        this.col = col;
    }
    public String getName() {
        return this.name;
    }
    public int getRow() {
        return this.row;
    }
    public int getCol() {
        return this.col;
    }

}