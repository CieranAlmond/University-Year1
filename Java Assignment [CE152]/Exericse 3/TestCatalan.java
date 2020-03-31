
import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class TestCatalan{
	
	@Test
	public void testCatalan0() throws Exception {
		
		assertEquals(Excercise3.catalan(0), 1);
	}
	
	@Test
	public void testCatalan5() throws Exception {
		
		assertEquals(Excercise3.catalan(5), 42);
	}
	
	@Test
	public void testCatalan10() throws Exception {
		
		assertEquals(Excercise3.catalan(10), 16796);
	}
	
	@Test
	public void testCatalan15() throws Exception {
		
		assertEquals(Excercise3.catalan(15), 9694845);
	}
	
	@Test
	public void testCatalan29() throws Exception {
		
		assertEquals(Excercise3.catalan(29), 1002242216651368l);
	}
}