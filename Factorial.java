class Factorial{
    public static void main(String[] a){
        System.out.println(new Fac().ComputeFac(10));
    }
}

class Father extends Fac {
    int a;
    public int ComputeFac(int num, int b){
        return num;
    }
}

class Fac extends Father {
    public int ComputeFac(int num){
        int num_aux ;
        if (num < 1)
            num_aux = a;
        else
            num_aux = num * (this.ComputeFac(num-1)) ;
        return num_aux ;
    }
}
