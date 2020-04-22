class Circular {
    public static void main(String[] a){
        System.out.println(1);
    }
}

class C {
    public int test() {
        A a;
        B b;
        a = new A();
        b = a.f();
        return 0;
    }
}

class A extends B {
}

class B extends A {
}




