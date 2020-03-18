class Main {
    public static void main(String[] a){
        System.out.println(1);
    }
}


class N
{
    public int doit(int x)
    {
        N m;
        m = new N();
        return 1;
    }
}

class M extends N
{
    public int doitt(int x)
    {
        M m;
        N n;
        n = new M();
        return 0;
    }
}