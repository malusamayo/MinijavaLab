package piglet.visitor;

import piglet.syntaxtree.*;
import piglet.symbol.*;

public class CountTempMax extends GJVoidDepthFirst<String> {

    /**
    * f0 -> "MAIN"
    * f1 -> StmtList()
    * f2 -> "END"
    * f3 -> ( Procedure() )*
    * f4 -> <EOF>
    */
    public void visit(Goal n, String argu) {
        n.f0.accept(this, argu);
        Counter.MaxTemp.put("MAIN", 20);
        n.f1.accept(this, "MAIN");
        n.f2.accept(this, argu);
        n.f3.accept(this, argu);
        n.f4.accept(this, argu);
    }

    /**
    * f0 -> Label()
    * f1 -> "["
    * f2 -> IntegerLiteral()
    * f3 -> "]"
    * f4 -> StmtExp()
    */
    public void visit(Procedure n, String argu) {
        String procedureName = n.f0.f0.toString();
        Counter.MaxTemp.put(procedureName, 20);
        n.f1.accept(this, argu);
        n.f2.accept(this, argu);
        n.f3.accept(this, argu);
        n.f4.accept(this, procedureName);
    }

    /**
    * f0 -> "TEMP"
    * f1 -> IntegerLiteral()
    */
    public void visit(Temp n, String argu) {
        n.f0.accept(this, argu);
        Integer tmpMax = Integer.parseInt(n.f1.f0.toString()) + 1;
        Integer nowMax = Counter.MaxTemp.get(argu);
        Counter.MaxTemp.put(argu, Integer.max(tmpMax, nowMax));
    }
}