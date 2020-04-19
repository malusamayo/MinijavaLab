class Inheritance {
    public static void main(String[] args) {
        int x;
        int y;
        A a;
        B b;
        C c;
        D d;
        x = (new A()).print();
        a = new D();
        y = a.change(10);
        x = a.print();
        b = new D();
        c = new C();
        x = b.change(c.change(100));
        y = b.print();
        System.out.println(x);
    }
}

class A {
    int x;

    public int change(int val) {
        x = val;
        return 0;
    }

    public int print() {
        int y;
        y = x;
        System.out.println(y);
        return 0;
    }
}

class B extends A {
    int x;
    int y;

    public int change(int val) {
        x = val + 1;
        y = val;
        return 0;
    }

}

class C extends B {
    int y;
    int z;
    public int change(int val) {
        y = val;
        z = y + val;
        return 0;
    }
}

class D extends B {
    public int change(int val) {
        y = val;
        return 0;
    }
}