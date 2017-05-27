package cn.weric.charge.domain;

public class Role {
	private String id;
	private String name;
	private String candel;
	private String desc;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCandel() {
		return candel;
	}
	public void setCandel(String candel) {
		this.candel = candel;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + ", candel=" + candel + ", desc=" + desc + "]";
	}
	
}
