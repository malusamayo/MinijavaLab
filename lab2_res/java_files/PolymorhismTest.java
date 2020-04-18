class PolymorhismTest {
    public static void main(String[] args) {
        int x;
        A_B k;
        k = new A_B();
        System.out.println(k.b());
    }
}

class A {
    public int B_b() {
        return 0;
    }
}

class A_B extends A {
    public int b() {
        return 1;
    }
}