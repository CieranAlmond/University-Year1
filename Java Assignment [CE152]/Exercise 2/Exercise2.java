
public class Exercise2{
public static void testClosestToMean() {
  double[][] array = new double[][] {new double[] {1, 3, 5, 8}, new double[] {1, 2}};
  int[] indices = closestToMean(array);
  System.out.println("Closest element index = " + indices[0] + ", " + indices[1]);
  System.out.println("Closest array element = " + array[indices[0]][indices[1]]);
}

public static int[] closestToMean(double[][] array) {
  if (array.length == 0) {
    throw new IllegalArgumentException("Input is empty");
  }

  // Calculate the mean
  double sum = 0;
  double eCount = 0;
  for (int i=0; i < array.length; i++)
  {
   for (int j=0; j < array.length; j++)
  {
   sum += array[i][j];
      eCount++;
  }
  }
  double mean = sum / eCount;
  System.out.println("Mean = " + mean);

  // Find closest index
  int[] indices = new int[] {-1, -1};

  double distance = Math.abs(mean - array[0][0]);
  for (int i = 0; i < array.length; i++) {
    for (int j = 0; j < array[i].length; j++) {
      double currentDistance = Math.abs(mean - array[i][j]);
      if (currentDistance < distance) {
        distance = currentDistance;
        indices[0] = i;
        indices[1] = j;
      }
    }
  }

  return indices;
}
public static void main(String[] args) {
  
    //testClosestToMean();
    //closestToMean();
    
  }
}


  