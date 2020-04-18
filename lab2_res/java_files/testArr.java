class testArr{
    public static void main(String[] s){
        int[] x;
        A a;
        x = new int[3];
        x[2] = 10;
        System.out.println(x[2]);
        System.out.println(x.length);
        a = new A();
        System.out.println((a.getArray())[0]);
        System.out.println((a.getArray()).length);
        x = a.getArray();
        x[(a.getidx())] = 8;
        System.out.println((a.getArray())[(a.getidx())]);
    }
}

class A {
    public int[] getArray() {
        int[] arr;
        arr = new int[10];
        arr[0] = 1;
        arr[2] = 7;
        return arr;
    }
    public int getidx() {
        return 2;
    }
}
