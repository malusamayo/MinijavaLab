class testassignpara {
    public static void main(String[] a) {
		Animal b;
		int i;
		b = new Animal();
		i = b.fun(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21);
    }
}
class Animal {
    public int fun(int p1, int p2, int p3, int p4, int p5, int p6, int p7, int p8, int p9, int p10, int p11, int p12, int p13, int p14, int p15, int p16, int p17, int p18, int p19, int p20, int p21)
	{
		if(false)
			p21 = 99;
		else
			p1 = 1;
		System.out.println(p21);	// correct answer is 21
		return 1;
	}
}