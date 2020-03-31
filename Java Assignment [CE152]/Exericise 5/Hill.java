
public class Hill implements Comparable<Hill>{

	private double longitude;
	private int id;
	private String name;
	private String countryName;
	private double height;
	private double latitude;

	public Hill(int id, String name, String countryName, double height, double latitude, double longitude) {
		this.id = id;
		this.name = name;
		this.countryName = countryName;
		this.height = height;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	
	@Override
	public String toString() {
		return id + ", " + getName() + ", " + countryName + ", " + height + ", "+ latitude + ", " + longitude;
	}

	public String getName() {
		return name;
	}
	
	public double getHeight() {
		return height;
	}

	public String getCountryName() {
		return countryName;
	}

	@Override
	public int compareTo(Hill arg0) {
		return name.compareTo(arg0.getName());
	}
}
