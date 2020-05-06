//
// Generated by JTB 1.3.2
//

package spiglet.syntaxtree;

/**
 * Grammar production:
 * f0 -> NoOpStmt()
 *       | ErrorStmt()
 *       | CJumpStmt()
 *       | JumpStmt()
 *       | HStoreStmt()
 *       | HLoadStmt()
 *       | MoveStmt()
 *       | PrintStmt()
 */
public class Stmt implements Node {
   public NodeChoice f0;

   public Stmt(NodeChoice n0) {
      f0 = n0;
   }

   public void accept(spiglet.visitor.Visitor v) {
      v.visit(this);
   }
   public <R,A> R accept(spiglet.visitor.GJVisitor<R,A> v, A argu) {
      return v.visit(this,argu);
   }
   public <R> R accept(spiglet.visitor.GJNoArguVisitor<R> v) {
      return v.visit(this);
   }
   public <A> void accept(spiglet.visitor.GJVoidVisitor<A> v, A argu) {
      v.visit(this,argu);
   }
}

