class testAnd{
    public static void main(String[] a){
        boolean x;
        x = true;
        if (x && (new T().test())) {
            System.out.println(1);
        }
        else {
            System.out.println(2);
        }
    }
}

class T {
    public boolean test() {
        System.out.println(10);
        return true;
    }
}
