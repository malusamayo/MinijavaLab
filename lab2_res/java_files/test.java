class test {
    public static void main(String[] args) {
        T t;
        int x;
        int y;
        t = new T();
        x = t.run_test();
        y = 0;
        if (!(x < y))
            System.out.println(0);
        else
            System.out.println(1);
    }
}

class A {
    int x;

    public int change() {
        x = 10;
        return 0;
    }

    public int print() {
        int y;
        System.out.println(x);
        y = this.change();
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