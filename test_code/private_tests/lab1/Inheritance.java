class Inheritance {
    public static void main(String[] a){
        System.out.println(1);
    }
}

class A {

}

class B extends A {

}

class C {
    public int f(A a, B b) {
        return 1;
    }
    public A g(A k) {
        // M m;
        B b;
        return b;
    }
    public int test() {
        A a;
        B b;
        int k;
//        b = a;
        a = b;
        k = this.f(b, b);
        return this.f(a, b);
    }
}




