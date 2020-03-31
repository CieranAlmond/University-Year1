import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedList;


public class Util {
	
	public static LinkedList<String> readFile(String fileName){
		
		LinkedList<String> list = null;
		
 		try (FileReader fr = new FileReader(fileName);
 			     BufferedReader br = new BufferedReader(fr)) {
 		 
 			list = new LinkedList<>();
	 		String line = null;
	 		
	 		while ((line = br.readLine()) != null) {
	 			if(!line.trim().isEmpty())
	 				list.add(line.trim());
	 		}
	 		
 		} catch (FileNotFoundException e) {
 			System.out.println("File not found in: " + fileName);
		} catch (IOException e) {
			System.out.println("Failed to read the file: " + fileName);
		}
		
		return list;
	}
}
