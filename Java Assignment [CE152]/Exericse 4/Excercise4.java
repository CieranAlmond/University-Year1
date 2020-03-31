import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;


public class Excercise4 {

	private static final String mazeFile = "D:\\maze21.txt";
	
	public static void main(String[] args) {
		
		
		MazeModel mazeModel = MazeModel.createMaze(mazeFile);
		System.out.println(mazeModel);
		
		
		final MazeView mazeView = new MazeView(mazeModel);
		
		JButton resetButon = new JButton("Reset");
		
		JFrame frame = new JFrame();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.add(mazeView, BorderLayout.CENTER);
		frame.add(resetButon, BorderLayout.SOUTH);
		resetButon.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				mazeView.reset();
			}
		});
		
		frame.setResizable(false);
		frame.setSize(mazeView.getWidth(), 500);
		frame.setTitle("Maze");
		frame.setVisible(true);
	}
}
