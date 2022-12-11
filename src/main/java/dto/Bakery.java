package dto;

import java.io.Serializable;

public class Bakery implements Serializable {

	private static final long serialVersionUID = 5357527736655432736L;

	private String bakeryId; // 가게 아이디
	private String bakeryName; // 가게 이름
	private String address; // 주소
	private String bakeryNumber; // 전화번호
	private String open; // 영업 시작 시간
	private String close; // 영업 종료 시간
	private String filename1;
	private String filename2;
	private String filename3;
	
	public Bakery() {
		super();
	}
	
	public Bakery(String bakeryId, String bakeryName, String address) {
		this.bakeryId = bakeryId;
		this.bakeryName = bakeryName;
		this.address = address;
	}

	public String getBakeryId() {
		return bakeryId;
	}

	public void setBakeryId(String bakeryId) {
		this.bakeryId = bakeryId;
	}

	public String getBakeryName() {
		return bakeryName;
	}

	public void setBakeryName(String bakeryName) {
		this.bakeryName = bakeryName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBakeryNumber() {
		return bakeryNumber;
	}

	public void setBakeryNumber(String bakeryNumber) {
		this.bakeryNumber = bakeryNumber;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getClose() {
		return close;
	}

	public void setClose(String close) {
		this.close = close;
	}

	public String getFilename1() {
		return filename1;
	}

	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}

	public String getFilename2() {
		return filename2;
	}

	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}

	public String getFilename3() {
		return filename3;
	}

	public void setFilename3(String filename3) {
		this.filename3 = filename3;
	}
	
	
}
