class testand2 {
    public static void main(String[] a) {
		int i;
		if(false && (new Animal().fun()))
			i = 1;
		else
			i = 2;	
		System.out.println(i); // correct answer is 2
    }
}
class Animal {
    public boolean fun()
	{
		System.out.println(99);	// correct answer is no output here
		return true;
	}
}