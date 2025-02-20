/* Generated By:JavaCC: Do not edit this line. PigletParser.java */
package piglet;
import piglet.syntaxtree.*;
import java.util.Vector;


public class PigletParser implements PigletParserConstants {

  static final public Goal Goal() throws ParseException {
   NodeToken n0;
   Token n1;
   StmtList n2;
   NodeToken n3;
   Token n4;
   NodeListOptional n5 = new NodeListOptional();
   Procedure n6;
   NodeToken n7;
   Token n8;
    n1 = jj_consume_token(MAIN);
               n0 = JTBToolkit.makeNodeToken(n1);
    n2 = StmtList();
    n4 = jj_consume_token(END);
              n3 = JTBToolkit.makeNodeToken(n4);
    label_1:
    while (true) {
      switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
      case IDENTIFIER:
        ;
        break;
      default:
        jj_la1[0] = jj_gen;
        break label_1;
      }
      n6 = Procedure();
        n5.addNode(n6);
    }
     n5.nodes.trimToSize();
    n8 = jj_consume_token(0);
      n8.beginColumn++; n8.endColumn++;
      n7 = JTBToolkit.makeNodeToken(n8);
     {if (true) return new Goal(n0,n2,n3,n5,n7);}
    throw new Error("Missing return statement in function");
  }

  static final public StmtList StmtList() throws ParseException {
   NodeListOptional n0 = new NodeListOptional();
   NodeSequence n1;
   NodeOptional n2;
   Label n3;
   Stmt n4;
    label_2:
    while (true) {
      switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
      case NOOP:
      case MOVE:
      case ERROR:
      case PRINT:
      case JUMP:
      case CJUMP:
      case HSTORE:
      case HLOAD:
      case IDENTIFIER:
        ;
        break;
      default:
        jj_la1[1] = jj_gen;
        break label_2;
      }
        n2 = new NodeOptional();
        n1 = new NodeSequence(2);
      switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
      case IDENTIFIER:
        n3 = Label();
           n2.addNode(n3);
        break;
      default:
        jj_la1[2] = jj_gen;
        ;
      }
        n1.addNode(n2);
      n4 = Stmt();
        n1.addNode(n4);
        n0.addNode(n1);
    }
     n0.nodes.trimToSize();
     {if (true) return new StmtList(n0);}
    throw new Error("Missing return statement in function");
  }

  static final public Procedure Procedure() throws ParseException {
   Label n0;
   NodeToken n1;
   Token n2;
   IntegerLiteral n3;
   NodeToken n4;
   Token n5;
   StmtExp n6;
    n0 = Label();
    n2 = jj_consume_token(LSQPAREN);
            n1 = JTBToolkit.makeNodeToken(n2);
    n3 = IntegerLiteral();
    n5 = jj_consume_token(RSQPAREN);
            n4 = JTBToolkit.makeNodeToken(n5);
    n6 = StmtExp();
     {if (true) return new Procedure(n0,n1,n3,n4,n6);}
    throw new Error("Missing return statement in function");
  }

  static final public Stmt Stmt() throws ParseException {
   NodeChoice n0;
   NoOpStmt n1;
   ErrorStmt n2;
   CJumpStmt n3;
   JumpStmt n4;
   HStoreStmt n5;
   HLoadStmt n6;
   MoveStmt n7;
   PrintStmt n8;
    switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
    case NOOP:
      n1 = NoOpStmt();
        n0 = new NodeChoice(n1, 0);
      break;
    case ERROR:
      n2 = ErrorStmt();
        n0 = new NodeChoice(n2, 1);
      break;
    case CJUMP:
      n3 = CJumpStmt();
        n0 = new NodeChoice(n3, 2);
      break;
    case JUMP:
      n4 = JumpStmt();
        n0 = new NodeChoice(n4, 3);
      break;
    case HSTORE:
      n5 = HStoreStmt();
        n0 = new NodeChoice(n5, 4);
      break;
    case HLOAD:
      n6 = HLoadStmt();
        n0 = new NodeChoice(n6, 5);
      break;
    case MOVE:
      n7 = MoveStmt();
        n0 = new NodeChoice(n7, 6);
      break;
    case PRINT:
      n8 = PrintStmt();
        n0 = new NodeChoice(n8, 7);
      break;
    default:
      jj_la1[3] = jj_gen;
      jj_consume_token(-1);
      throw new ParseException();
    }
     {if (true) return new Stmt(n0);}
    throw new Error("Missing return statement in function");
  }

  static final public NoOpStmt NoOpStmt() throws ParseException {
   NodeToken n0;
   Token n1;
    n1 = jj_consume_token(NOOP);
               n0 = JTBToolkit.makeNodeToken(n1);
     {if (true) return new NoOpStmt(n0);}
    throw new Error("Missing return statement in function");
  }

  static final public ErrorStmt ErrorStmt() throws ParseException {
   NodeToken n0;
   Token n1;
    n1 = jj_consume_token(ERROR);
                n0 = JTBToolkit.makeNodeToken(n1);
     {if (true) return new ErrorStmt(n0);}
    throw new Error("Missing return statement in function");
  }

  static final public CJumpStmt CJumpStmt() throws ParseException {
   NodeToken n0;
   Token n1;
   Exp n2;
   Label n3;
    n1 = jj_consume_token(CJUMP);
                n0 = JTBToolkit.makeNodeToken(n1);
    n2 = Exp();
    n3 = Label();
     {if (true) return new CJumpStmt(n0,n2,n3);}
    throw new Error("Missing return statement in function");
  }

  static final public JumpStmt JumpStmt() throws ParseException {
   NodeToken n0;
   Token n1;
   Label n2;
    n1 = jj_consume_token(JUMP);
               n0 = JTBToolkit.makeNodeToken(n1);
    n2 = Label();
     {if (true) return new JumpStmt(n0,n2);}
    throw new Error("Missing return statement in function");
  }

  static final public HStoreStmt HStoreStmt() throws ParseException {
   NodeToken n0;
   Token n1;
   Exp n2;
   IntegerLiteral n3;
   Exp n4;
    n1 = jj_consume_token(HSTORE);
                 n0 = JTBToolkit.makeNodeToken(n1);
    n2 = Exp();
    n3 = IntegerLiteral();
    n4 = Exp();
     {if (true) return new HStoreStmt(n0,n2,n3,n4);}
    throw new Error("Missing return statement in function");
  }

  static final public HLoadStmt HLoadStmt() throws ParseException {
   NodeToken n0;
   Token n1;
   Temp n2;
   Exp n3;
   IntegerLiteral n4;
    n1 = jj_consume_token(HLOAD);
                n0 = JTBToolkit.makeNodeToken(n1);
    n2 = Temp();
    n3 = Exp();
    n4 = IntegerLiteral();
     {if (true) return new HLoadStmt(n0,n2,n3,n4);}
    throw new Error("Missing return statement in function");
  }

  static final public MoveStmt MoveStmt() throws ParseException {
   NodeToken n0;
   Token n1;
   Temp n2;
   Exp n3;
    n1 = jj_consume_token(MOVE);
               n0 = JTBToolkit.makeNodeToken(n1);
    n2 = Temp();
    n3 = Exp();
     {if (true) return new MoveStmt(n0,n2,n3);}
    throw new Error("Missing return statement in function");
  }

  static final public PrintStmt PrintStmt() throws ParseException {
   NodeToken n0;
   Token n1;
   Exp n2;
    n1 = jj_consume_token(PRINT);
                n0 = JTBToolkit.makeNodeToken(n1);
    n2 = Exp();
     {if (true) return new PrintStmt(n0,n2);}
    throw new Error("Missing return statement in function");
  }

  static final public Exp Exp() throws ParseException {
   NodeChoice n0;
   StmtExp n1;
   Call n2;
   HAllocate n3;
   BinOp n4;
   Temp n5;
   IntegerLiteral n6;
   Label n7;
    switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
    case BEGIN:
      n1 = StmtExp();
        n0 = new NodeChoice(n1, 0);
      break;
    case CALL:
      n2 = Call();
        n0 = new NodeChoice(n2, 1);
      break;
    case HALLOCATE:
      n3 = HAllocate();
        n0 = new NodeChoice(n3, 2);
      break;
    case LT:
    case PLUS:
    case MINUS:
    case TIMES:
      n4 = BinOp();
        n0 = new NodeChoice(n4, 3);
      break;
    case TEMP:
      n5 = Temp();
        n0 = new NodeChoice(n5, 4);
      break;
    case INTEGER_LITERAL:
      n6 = IntegerLiteral();
        n0 = new NodeChoice(n6, 5);
      break;
    case IDENTIFIER:
      n7 = Label();
        n0 = new NodeChoice(n7, 6);
      break;
    default:
      jj_la1[4] = jj_gen;
      jj_consume_token(-1);
      throw new ParseException();
    }
     {if (true) return new Exp(n0);}
    throw new Error("Missing return statement in function");
  }

  static final public StmtExp StmtExp() throws ParseException {
   NodeToken n0;
   Token n1;
   StmtList n2;
   NodeToken n3;
   Token n4;
   Exp n5;
   NodeToken n6;
   Token n7;
    n1 = jj_consume_token(BEGIN);
                n0 = JTBToolkit.makeNodeToken(n1);
    n2 = StmtList();
    n4 = jj_consume_token(RETURN);
                 n3 = JTBToolkit.makeNodeToken(n4);
    n5 = Exp();
    n7 = jj_consume_token(END);
              n6 = JTBToolkit.makeNodeToken(n7);
     {if (true) return new StmtExp(n0,n2,n3,n5,n6);}
    throw new Error("Missing return statement in function");
  }

  static final public Call Call() throws ParseException {
   NodeToken n0;
   Token n1;
   Exp n2;
   NodeToken n3;
   Token n4;
   NodeListOptional n5 = new NodeListOptional();
   Exp n6;
   NodeToken n7;
   Token n8;
    n1 = jj_consume_token(CALL);
               n0 = JTBToolkit.makeNodeToken(n1);
    n2 = Exp();
    n4 = jj_consume_token(LPAREN);
            n3 = JTBToolkit.makeNodeToken(n4);
    label_3:
    while (true) {
      switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
      case LT:
      case PLUS:
      case MINUS:
      case TIMES:
      case HALLOCATE:
      case CALL:
      case BEGIN:
      case TEMP:
      case INTEGER_LITERAL:
      case IDENTIFIER:
        ;
        break;
      default:
        jj_la1[5] = jj_gen;
        break label_3;
      }
      n6 = Exp();
        n5.addNode(n6);
    }
     n5.nodes.trimToSize();
    n8 = jj_consume_token(RPAREN);
            n7 = JTBToolkit.makeNodeToken(n8);
     {if (true) return new Call(n0,n2,n3,n5,n7);}
    throw new Error("Missing return statement in function");
  }

  static final public HAllocate HAllocate() throws ParseException {
   NodeToken n0;
   Token n1;
   Exp n2;
    n1 = jj_consume_token(HALLOCATE);
                    n0 = JTBToolkit.makeNodeToken(n1);
    n2 = Exp();
     {if (true) return new HAllocate(n0,n2);}
    throw new Error("Missing return statement in function");
  }

  static final public BinOp BinOp() throws ParseException {
   Operator n0;
   Exp n1;
   Exp n2;
    n0 = Operator();
    n1 = Exp();
    n2 = Exp();
     {if (true) return new BinOp(n0,n1,n2);}
    throw new Error("Missing return statement in function");
  }

  static final public Operator Operator() throws ParseException {
   NodeChoice n0;
   NodeToken n1;
   Token n2;
   NodeToken n3;
   Token n4;
   NodeToken n5;
   Token n6;
   NodeToken n7;
   Token n8;
    switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
    case LT:
      n2 = jj_consume_token(LT);
                n1 = JTBToolkit.makeNodeToken(n2);
        n0 = new NodeChoice(n1, 0);
      break;
    case PLUS:
      n4 = jj_consume_token(PLUS);
                  n3 = JTBToolkit.makeNodeToken(n4);
        n0 = new NodeChoice(n3, 1);
      break;
    case MINUS:
      n6 = jj_consume_token(MINUS);
                   n5 = JTBToolkit.makeNodeToken(n6);
        n0 = new NodeChoice(n5, 2);
      break;
    case TIMES:
      n8 = jj_consume_token(TIMES);
                   n7 = JTBToolkit.makeNodeToken(n8);
        n0 = new NodeChoice(n7, 3);
      break;
    default:
      jj_la1[6] = jj_gen;
      jj_consume_token(-1);
      throw new ParseException();
    }
     {if (true) return new Operator(n0);}
    throw new Error("Missing return statement in function");
  }

  static final public Temp Temp() throws ParseException {
   NodeToken n0;
   Token n1;
   IntegerLiteral n2;
    n1 = jj_consume_token(TEMP);
               n0 = JTBToolkit.makeNodeToken(n1);
    n2 = IntegerLiteral();
     {if (true) return new Temp(n0,n2);}
    throw new Error("Missing return statement in function");
  }

  static final public IntegerLiteral IntegerLiteral() throws ParseException {
   NodeToken n0;
   Token n1;
    n1 = jj_consume_token(INTEGER_LITERAL);
                          n0 = JTBToolkit.makeNodeToken(n1);
     {if (true) return new IntegerLiteral(n0);}
    throw new Error("Missing return statement in function");
  }

  static final public Label Label() throws ParseException {
   NodeToken n0;
   Token n1;
    n1 = jj_consume_token(IDENTIFIER);
                     n0 = JTBToolkit.makeNodeToken(n1);
     {if (true) return new Label(n0);}
    throw new Error("Missing return statement in function");
  }

  static private boolean jj_initialized_once = false;
  /** Generated minijava.spiglet.Token Manager. */
  static public PigletParserTokenManager token_source;
  static JavaCharStream jj_input_stream;
  /** Current token. */
  static public Token token;
  /** Next token. */
  static public Token jj_nt;
  static private int jj_ntk;
  static private int jj_gen;
  static final private int[] jj_la1 = new int[7];
  static private int[] jj_la1_0;
  static private int[] jj_la1_1;
  static {
      jj_la1_init_0();
      jj_la1_init_1();
   }
   private static void jj_la1_init_0() {
      jj_la1_0 = new int[] {0x0,0x0,0x0,0x0,0x48c10000,0x48c10000,0x8c10000,};
   }
   private static void jj_la1_init_1() {
      jj_la1_1 = new int[] {0x8000,0x879b,0x8000,0x79b,0xd024,0xd024,0x0,};
   }

  /** Constructor with InputStream. */
  public PigletParser(java.io.InputStream stream) {
     this(stream, null);
  }
  /** Constructor with InputStream and supplied encoding */
  public PigletParser(java.io.InputStream stream, String encoding) {
    if (jj_initialized_once) {
      System.out.println("ERROR: Second call to constructor of static parser.  ");
      System.out.println("       You must either use ReInit() or set the JavaCC option STATIC to false");
      System.out.println("       during parser generation.");
      throw new Error();
    }
    jj_initialized_once = true;
    try { jj_input_stream = new JavaCharStream(stream, encoding, 1, 1); } catch(java.io.UnsupportedEncodingException e) { throw new RuntimeException(e); }
    token_source = new PigletParserTokenManager(jj_input_stream);
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 7; i++) jj_la1[i] = -1;
  }

  /** Reinitialise. */
  static public void ReInit(java.io.InputStream stream) {
     ReInit(stream, null);
  }
  /** Reinitialise. */
  static public void ReInit(java.io.InputStream stream, String encoding) {
    try { jj_input_stream.ReInit(stream, encoding, 1, 1); } catch(java.io.UnsupportedEncodingException e) { throw new RuntimeException(e); }
    token_source.ReInit(jj_input_stream);
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 7; i++) jj_la1[i] = -1;
  }

  /** Constructor. */
  public PigletParser(java.io.Reader stream) {
    if (jj_initialized_once) {
      System.out.println("ERROR: Second call to constructor of static parser. ");
      System.out.println("       You must either use ReInit() or set the JavaCC option STATIC to false");
      System.out.println("       during parser generation.");
      throw new Error();
    }
    jj_initialized_once = true;
    jj_input_stream = new JavaCharStream(stream, 1, 1);
    token_source = new PigletParserTokenManager(jj_input_stream);
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 7; i++) jj_la1[i] = -1;
  }

  /** Reinitialise. */
  static public void ReInit(java.io.Reader stream) {
    jj_input_stream.ReInit(stream, 1, 1);
    token_source.ReInit(jj_input_stream);
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 7; i++) jj_la1[i] = -1;
  }

  /** Constructor with generated minijava.spiglet.Token Manager. */
  public PigletParser(PigletParserTokenManager tm) {
    if (jj_initialized_once) {
      System.out.println("ERROR: Second call to constructor of static parser. ");
      System.out.println("       You must either use ReInit() or set the JavaCC option STATIC to false");
      System.out.println("       during parser generation.");
      throw new Error();
    }
    jj_initialized_once = true;
    token_source = tm;
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 7; i++) jj_la1[i] = -1;
  }

  /** Reinitialise. */
  public void ReInit(PigletParserTokenManager tm) {
    token_source = tm;
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 7; i++) jj_la1[i] = -1;
  }

  static private Token jj_consume_token(int kind) throws ParseException {
    Token oldToken;
    if ((oldToken = token).next != null) token = token.next;
    else token = token.next = token_source.getNextToken();
    jj_ntk = -1;
    if (token.kind == kind) {
      jj_gen++;
      return token;
    }
    token = oldToken;
    jj_kind = kind;
    throw generateParseException();
  }


/** Get the next minijava.spiglet.Token. */
  static final public Token getNextToken() {
    if (token.next != null) token = token.next;
    else token = token.next = token_source.getNextToken();
    jj_ntk = -1;
    jj_gen++;
    return token;
  }

/** Get the specific minijava.spiglet.Token. */
  static final public Token getToken(int index) {
    Token t = token;
    for (int i = 0; i < index; i++) {
      if (t.next != null) t = t.next;
      else t = t.next = token_source.getNextToken();
    }
    return t;
  }

  static private int jj_ntk() {
    if ((jj_nt=token.next) == null)
      return (jj_ntk = (token.next=token_source.getNextToken()).kind);
    else
      return (jj_ntk = jj_nt.kind);
  }

  static private java.util.List jj_expentries = new java.util.ArrayList();
  static private int[] jj_expentry;
  static private int jj_kind = -1;

  /** Generate minijava.spiglet.ParseException. */
  static public ParseException generateParseException() {
    jj_expentries.clear();
    boolean[] la1tokens = new boolean[50];
    if (jj_kind >= 0) {
      la1tokens[jj_kind] = true;
      jj_kind = -1;
    }
    for (int i = 0; i < 7; i++) {
      if (jj_la1[i] == jj_gen) {
        for (int j = 0; j < 32; j++) {
          if ((jj_la1_0[i] & (1<<j)) != 0) {
            la1tokens[j] = true;
          }
          if ((jj_la1_1[i] & (1<<j)) != 0) {
            la1tokens[32+j] = true;
          }
        }
      }
    }
    for (int i = 0; i < 50; i++) {
      if (la1tokens[i]) {
        jj_expentry = new int[1];
        jj_expentry[0] = i;
        jj_expentries.add(jj_expentry);
      }
    }
    int[][] exptokseq = new int[jj_expentries.size()][];
    for (int i = 0; i < jj_expentries.size(); i++) {
      exptokseq[i] = (int[])jj_expentries.get(i);
    }
    return new ParseException(token, exptokseq, tokenImage);
  }

  /** Enable tracing. */
  static final public void enable_tracing() {
  }

  /** Disable tracing. */
  static final public void disable_tracing() {
  }

}

class JTBToolkit {
   static NodeToken makeNodeToken(Token t) {
      return new NodeToken(t.image.intern(), t.kind, t.beginLine, t.beginColumn, t.endLine, t.endColumn);
   }
}
