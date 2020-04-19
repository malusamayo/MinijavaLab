class polyMore {
    public static void main(String[] args) {
        int x;
        A_B_C k;
        k = new A_B_C();
        System.out.println(k.D());
    }
}

class A {
    public int B_C_D() {
        return 0;
    }
}

class A_B extends A {
    public int C_D() {
        return 1;
    }
}

class A_B_C extends A_B {
    public int D() {
        return 2;
    }
}