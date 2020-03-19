class Main {
    public static void main(String[] a){
        int p;
        int q;
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
        int[] arr;
        a = this.doit();
        arr = new int[5];
        System.out.println(arr.length);
        System.out.println(arr[6]);
        m = new N();
//        if(true) {
//            int s;
//            int a; // javac会报重复定义错，然而这种情况似乎在minijava词法分析阶段就不允许
//            s = 1;
//        }
        return 1;
    }
}

class M extends N
{
    public int doitt(int x)
    {
        M m;
        N n;
        int N;
        n = new N();
        n = new M();
        System.out.println(N);
        return 0;
    }
}

class P extends M
{
    public int doittt(int x)
    {
        M m;
        N n;
        int N;
        n = new P(); // 子类的子类也可以赋值给父类
        return 0;
    }
}