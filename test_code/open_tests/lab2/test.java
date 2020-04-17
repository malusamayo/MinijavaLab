class test {
    public static void main(String[] args) {
        T t;
        int x;
        t = new T();
        x = t.run_test();
    }
}

class A {
    int x;

    public int change() {
        x = 10;
        return 0;
    }

    public int set() {
        x = 0;
        return 0;
    }

    public int print() {
        System.out.println(x);
        return 0;
    }
}

class B extends A {
    int x;

    public int change() {
        x = 100;
        return 0;
    }

}

class C extends B {
    int x;

    public int change() {
        x = 1000;
        return 0;
    }
}

class T {
    public int run_test() {
        B b;
        int x;
        b = new C();
        // x = b.set();
        x = this.Test_B(b);
        x = this.Test_A(b);
        return 0;
    }

    public int Test_B(B b) {
        int x;
        x = b.change();
        x = b.print();
        return 0;
    }

    public int Test_A(A b) {
        int x;
        x = b.change();
        x = b.print();
        return 0;
    }
}