import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;


public class Excercise5 {
	
	private static String csvFile = "D://hills.csv";

	public static void main(String[] args) {
		
		System.out.println("Excercise A");
		Hill hill = new Hill(255, "Benn Nevis", "Highland", 1344.5, 56.796849, -5.003525);
		System.out.println(hill);
		
		System.out.println("\nExcercise B");
		excercise5b();
		
		System.out.println("\nExcercise C");
		excercise5c();
		
		System.out.println("\nExcercise D");
		excercise5d();
		
		System.out.println("\nxcercise E");
		excercise5e();
	}
	
	public static void excercise5b(){
		
		List<Hill> hills = readHills();
		int i = 0;
		
		for(Hill hill : hills){
			
			if(i++ == 20)
				break;
			
			System.out.println(hill);
		}
	}
	
	public static void excercise5c(){
		
		List<Hill> hills = readHills();
		Scanner scanner = new Scanner(System.in);
		
		while(true){
			
			System.out.println("Please enter a hill name or quit to exit: ");
			String inputStr = scanner.next();
			
			if(inputStr.equals("quit")){
				System.out.println("Good Bye");
				break;
			}
			
			for(Hill hill : hills){
				if(hill.getName().startsWith(inputStr))
					System.out.println(hill);
			}
		}
		
		scanner.close();
	}
	
	public static void excercise5d(){
		
		List<Hill> hills = readHills();
		
		System.out.println("Sorted By Name");
		Collections.sort(hills);
		
		int i = 0;
		for(Hill hill : hills){
			
			if(i++ == 20)
				break;
			
			System.out.println(hill);
		}
		
		System.out.println("\nSorted By Height");
		
		/*Use a comparator to sort by height*/
		Collections.sort(hills, Collections.reverseOrder(new Comparator<Hill>() {
			
			@Override
			public int compare(Hill h1, Hill h2) {
				return h1.getHeight() == h2.getHeight() ? 0 :  h1.getHeight() < h2.getHeight() ? -1 : 1;
			}
		}));
		
		i = 0;
		for(Hill hill : hills){
			
			if(i++ == 20)
				break;
			
			System.out.println(hill);
		}
	}
	
	public static void excercise5e(){
		
		Map<String, Set<Hill>> map = HillsByCountry(readHills());
		int i = 0;
		
		for(String s : map.keySet()){
			
			if(i++ == 3)
				break;
			
			System.out.println("Country: " + s);
			Set<Hill> set = map.get(s);
			int j = 0;
			
			for(Hill h : set){
				
				if(j++ == 3)
					break;
				
				System.out.println(h.getName() + " " + h.getHeight());
			}
		}
	}
	
	public static Map<String, Set<Hill>> HillsByCountry(List<Hill> hills){
	
		Map<String, Set<Hill>> map = new TreeMap<>();
		
		for(Hill hill : hills){
			
			if(!map.containsKey(hill.getCountryName()))
				map.put(hill.getCountryName(), new TreeSet<Hill>());
			
			map.get(hill.getCountryName()).add(hill);
		}
		
		return map;
	}
	
	public static List<Hill> readHills(){
		
		LinkedList<Hill> list = new LinkedList<>();
		
		try (FileReader fr = new FileReader(csvFile);
			     BufferedReader br = new BufferedReader(fr)){

			 br.readLine();
			
			 String line = null;
		 		
	 		 while ((line = br.readLine()) != null) {
	 			if(!line.trim().isEmpty()){
	 				
	 				String[] splitArray = line.split(",");
	 				
	 				list.add(new Hill(Integer.parseInt(splitArray[0]), splitArray[1], splitArray[2],
						 Double.parseDouble(splitArray[3]), Double.parseDouble(splitArray[4]), 
						 Double.parseDouble(splitArray[5])));
	 			}
	 		 }
			 
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	    
		return list;
	}
}
