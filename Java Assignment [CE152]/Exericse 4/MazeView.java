import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.geom.Ellipse2D;

import javax.swing.JOptionPane;
import javax.swing.JPanel;

/**
 * This class represent GUI for the implementation of MazeModel
 *
 */
public class MazeView extends JPanel{

	private MazeModel model;
	private final int cellSize = 20;
	private boolean[][] maze;
	
	private int blueCircleRow = 1;
	private int blueCircleColumn = 1;
	
	private final int redCircleRow;
	private final int redCircleColumn;

	public MazeView(MazeModel model) {
		this.model = model;
		maze = model.getMaze();
		addKeyListener(new DotPositionMover());
		
		redCircleRow = model.getRowCount() - 2;
		redCircleColumn = model.getColumnCount() - 2;
		
		setFocusable(true);
		requestFocusInWindow();
		setSize((model.getRowCount() + 1)*cellSize, (model.getColumnCount() + 1)*cellSize);
	}
	
	@Override
	protected void paintComponent(Graphics g) {
		
		super.paintComponent(g);
		setBackground(Color.WHITE);
		
		Graphics2D g2d = (Graphics2D)g;
		
		int currentRow = 0;
		g2d.setColor(Color.BLACK);
		
		for(boolean[] row : maze){
			
			int currentColumn = 0;
			
			for(boolean cell : row){
				if(cell)
					g2d.fillRect(currentColumn*cellSize, currentRow*cellSize, cellSize, cellSize);
				
				currentColumn++;
			}
			
			currentRow++;
		}
			
		g2d.setPaint(Color.RED);
		g2d.fill(new Ellipse2D.Double(redCircleColumn*cellSize + 2, redCircleRow*cellSize  + 2, 16 , 16));
		
		g2d.setPaint(Color.BLUE);
		g2d.fill(new Ellipse2D.Double( blueCircleColumn*cellSize + 2, blueCircleRow*cellSize + 2 , 16 , 16));
	}
	
	//To reset back to the top
	public void reset(){
		
		requestFocusInWindow();
		blueCircleRow = 1;
		blueCircleColumn = 1;
		repaint();
	}
	
	private class DotPositionMover extends KeyAdapter {

		@Override
		public void keyPressed(KeyEvent event) {
			
			int keyCode = event.getKeyCode();
			
			switch(keyCode){
				
				case KeyEvent.VK_UP:
				case KeyEvent.VK_KP_UP:
					if(!maze[blueCircleRow - 1][blueCircleColumn])
						blueCircleRow--;
						
					repaint();
					break;
					
				case KeyEvent.VK_LEFT:	
				case KeyEvent.VK_KP_LEFT:
					if(!maze[blueCircleRow][blueCircleColumn - 1])
						blueCircleColumn--;
					
					repaint();
					break;
					
				case KeyEvent.VK_RIGHT:		
				case KeyEvent.VK_KP_RIGHT:
					
					if(!maze[blueCircleRow][blueCircleColumn + 1])
						blueCircleColumn++;
					
					repaint();
					break;
					
				case KeyEvent.VK_DOWN:	
				case KeyEvent.VK_KP_DOWN:
					
					if(!maze[blueCircleRow + 1][blueCircleColumn])
						blueCircleRow++;
					
					repaint();
					break;
			}
			
			try {
				Thread.sleep(1);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
			//User won, show congratulation message
			if(blueCircleColumn == redCircleColumn && blueCircleRow == redCircleRow){
				JOptionPane.showMessageDialog(null, "Congratulation, you won!");
				reset();
			}
		}
	}
}
