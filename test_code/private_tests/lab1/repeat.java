class Main {
    public static void main(String[] a){
        System.out.println(1);
    }
}


class N
{
    int x;
    public int doit()
    {
        int a;
        N m;
        a = this.doit();
        m = new N();
        if(true) {
            int s;
            int a; // javac会报重复定义错，然而这种情况似乎在minijava词法分析阶段就不允许
            s = 1;
        }
        return 1;
    }
}

class M extends N
{
    public int doitt(int x)
    {
        M m;
        N n;
        // n = new M();
        return 0;
    }
}