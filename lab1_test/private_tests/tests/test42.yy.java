class test42{
    public static void main(String[] a){
        System.out.println(new Test().start());
    }
}

class Test{

    Test test;

    public int start(){

        if (test.next()) System.out.println(1); else System.out.println(0);

        return 0;
    }

    public boolean next(){

        if (true) System.out.println(1); else System.out.println(0); // TE

        return true;

    }
}
