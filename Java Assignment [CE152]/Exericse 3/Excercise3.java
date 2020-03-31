
import java.util.Scanner;


public class Excercise3 {
	
	private static final Scanner input = new Scanner(System.in);

	public static long catalan(int n){
		
		if(n < 0 || n > 30)
			throw new IllegalArgumentException();
		
		if(n == 0)
			return 1;
		
		return (2*(2*n - 1)*catalan(n - 1))/(n+1);
	}
	
	public static void excercise3a(){
		
		System.out.println("Please type an integer between 0 and 30 to get catalan number or quit to exit");
		
		while(true){
		
			System.out.print("User input: ");
			String userInput = input.nextLine();
			
			if(userInput.equals("quit")){
				System.out.println("Exiting");
				break;
			}
			
			System.out.println("Catalan number: " + catalan(Integer.parseInt(userInput)));
			System.out.println();	
		}
	}
	
	public static void excercise3b(){
		
		System.out.println("Please type an integer between 0 and 30 to get catalan number or quit to exit");
		
		while(true){
		
			try{
				System.out.print("User input: ");
				String userInput = input.nextLine();
				
				if(userInput.equals("quit")){
					System.out.println("Exiting");
					break;
				}
				
				System.out.println("Catalan number: " + catalan(Integer.parseInt(userInput)));
				System.out.println();	
			}catch(IllegalArgumentException e){
				System.out.println("Please enter a value between 0 and 30");
			}
		}
	}
	
	public static void main(String[] args) {
		
		excercise3a();
		//excercise3b();
	}
}