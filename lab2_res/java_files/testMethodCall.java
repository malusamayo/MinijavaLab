class testMethodCall {
    public static void main(String[] a) {
        Test t;
        int x;
        t = new Test();
        x = t.run_test(t.run_test(100, 200, 300), 2, t.run_test(10, 20, 30));
        x = t.run_test(t.run_test(100, 200, t.run_test(1000, 2000, 3000)), 2, t.run_test(10, 20, 30));
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
