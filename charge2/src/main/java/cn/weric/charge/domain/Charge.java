package cn.weric.charge.domain;

public class Charge {
	private String charge_id;
	private String charge_sid;   //stud_uuid
	private String charge_ssid;  //stud_id
	private String charge_name;
	private double charge_money;
	private String charge_type;
	private String charge_date;
	public String getCharge_id() {
		return charge_id;
	}

	public void setCharge_id(String charge_id) {
		this.charge_id = charge_id;
	}

	public String getCharge_sid() {
		return charge_sid;
	}

	public void setCharge_sid(String charge_sid) {
		this.charge_sid = charge_sid;
	}

	public String getCharge_ssid() {
		return charge_ssid;
	}

	public void setCharge_ssid(String charge_ssid) {
		this.charge_ssid = charge_ssid;
	}

	public String getCharge_name() {
		return charge_name;
	}

	public void setCharge_name(String charge_name) {
		this.charge_name = charge_name;
	}

	public double getCharge_money() {
		return charge_money;
	}

	public void setCharge_money(double charge_money) {
		this.charge_money = charge_money;
	}

	public String getCharge_type() {
		return charge_type;
	}

	public void setCharge_type(String charge_type) {
		this.charge_type = charge_type;
	}

	public String getCharge_date() {
		return charge_date;
	}

	public void setCharge_date(String charge_date) {
		this.charge_date = charge_date;
	}

	@Override
	public String toString() {
		return "Charge [charge_id=" + charge_id + ", charge_sid=" + charge_sid + ", charge_ssid=" + charge_ssid
				+ ", charge_name=" + charge_name + ", charge_money=" + charge_money + ", charge_type=" + charge_type
				+ ", charge_date=" + charge_date + "]";
	}
	
}
