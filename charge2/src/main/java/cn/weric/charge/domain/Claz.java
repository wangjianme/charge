package cn.weric.charge.domain;

public class Claz {
	private String id;
	private String name;
	private String desc;
	private Integer row;
	public Integer getRow() {
		return row;
	}
	public void setRow(Integer row) {
		this.row = row;
	}
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
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	@Override
	public String toString() {
		return "Claz [id=" + id + ", name=" + name + ", desc=" + desc + ", row=" + row + "]";
	}
    
}
