class testMethodCall {
    public static void main(String[] a) {
        Test t;
        int x;
        int[] arr;
        A obja;
        arr = new int[10];
        arr[1] = 7 + (arr.length);
        x = (new int[arr[1]])[1];
        t = new Test();
        x = t.run_test(t.run_test(100, 200, 300), 2, t.run_test(10, 20, 30));
        x = t.run_test(t.run_test(100, 200, t.run_test(1000, 2000, 3000)), 2, t.run_test(10, 20, 30));
        if (((new A()).call(1,2,3,(arr[1])<(arr.length))) < 2)
            System.out.println((new Test()).run_test((new A()).call(4,3,2,true),
                    arr[1], arr.length));
        else {

        }
    }
}

class Test {
    public int run_test(int a1, int a2, int a3) {
        System.out.println(a1);
        System.out.println(a1);
        System.out.println(a1);
        return 0;
    }
}

class A {
    int x;
    int y;
    public int call(int m, int a1, int a2, boolean b) {
        x = m;
        return x;
    }
}
