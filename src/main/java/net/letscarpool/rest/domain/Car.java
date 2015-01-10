package net.letscarpool.rest.domain;

public class Car {
	public static enum CarClass {SEDAN, SUV, MINIVAN, VAN, TRUCK};
	
	private Integer id;
	
	private CarClass carClass;
	private Integer seats;
	
	private String make;
	private String model;
	private Integer year;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public CarClass getCarClass() {
		return carClass;
	}
	public void setCarClass(CarClass carClass) {
		this.carClass = carClass;
	}
	public Integer getSeats() {
		return seats;
	}
	public void setSeats(Integer seats) {
		this.seats = seats;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	
	
}
