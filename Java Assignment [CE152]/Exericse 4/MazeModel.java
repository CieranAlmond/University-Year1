import java.util.LinkedList;

/**
 * 
 * This class hold the array representation of the Maze
 *
 */
public class MazeModel {

	private boolean[][] mazeArray;

	public MazeModel(boolean[][] mazeArray) {
		this.mazeArray = mazeArray;
	}
	
	@Override
	public String toString() {
		
		StringBuilder builder = new StringBuilder();
		
		for(boolean[] row : mazeArray){
			for(boolean b : row)
				builder.append(b ? "#" : " " );
			
			builder.append("\r\n");
		}
		
		return builder.toString();
	}

	/**
	 * this method act as a factory method to create an object of this class type.
	 * @param inputFile 
	 * @return
	 */
	public static MazeModel createMaze(String inputFile){
		
		LinkedList<String> list = Util.readFile(inputFile);
		boolean[][] mazeArray = new boolean[list.size()][list.getFirst().length()];
		int rowIndex = 0;
		
		for(String str : list){
			
			int coulmnIndex = 0;
			
			for(char c : str.toCharArray())
				mazeArray[rowIndex][coulmnIndex++] = c == '#' ? true : false;
			
			rowIndex++;
		}
		
		return new MazeModel(mazeArray);
	}

	public boolean[][] getMaze() {
		return mazeArray;
	}
	
	public int getColumnCount(){
		return mazeArray[0].length;
	}
	
	public int getRowCount(){
		return mazeArray.length;
	}
}
