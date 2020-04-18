class testWhile {
    public static void main(String[] a) {
        int x;
        int y;
        int t;
        x = 1;
        y = 0;
        while (x < 10) {
            x = x + 1;
            y = y - 1;
        }
        if (x < y) {
            t = y;
            y = x;
            x = t;
        } else {

        }
        if (x < y) {

        } else {

        }
        while (x < y) {

        }
        System.out.println(x);
        System.out.println(y);
    }
}