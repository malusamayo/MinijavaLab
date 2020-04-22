class test {
    public static void main(String[] args) {
        System.out.println(1);
    }
}

class A {
    int x;
}

class B extends A {
    boolean x;

    public int func() {
        boolean y;
        y = x;
        if (y) {
            System.out.println(1);
        }
        else {

        }
        return 0;
    }
}