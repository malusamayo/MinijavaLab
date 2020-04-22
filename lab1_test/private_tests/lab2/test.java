class test {
    public static void main(String[] args) {
        B b;
        b = new C();
        Test(b);
        System.out.println(b.x);
        Test2(b);
        System.out.println(b.x);
    }

    public static void Test(A a) {
        a.x = 10;
    }

    public static void Test2(B a) {
        a.x = 10;
    }
}

class A {
    int x;
}

class B extends A {
    int x;
}

class C extends B {
    int x;
}