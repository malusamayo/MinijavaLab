class Main {
    public static void main(String[] a){
        int p;
        int q;
        System.out.println(1);
    }
}

class A extends B {

}

class B extends C {

}

class C extends A {

}

class D {
    public int test() {
        C c;
        int x;
        c = new C();
        x = c.f();
        return 0;
    }
}