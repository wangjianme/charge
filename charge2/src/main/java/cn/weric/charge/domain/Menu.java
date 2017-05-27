package cn.weric.charge.domain;

public class Menu {
	private String id;
	private String text;
	private String leaf;
	private String parent;
	private String url;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getLeaf() {
		return leaf;
	}
	public void setLeaf(String leaf) {
		this.leaf = leaf;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "Menu [id=" + id + ", text=" + text + ", leaf=" + leaf + ", parent=" + parent + ", url=" + url + "]";
	}
	
	
	
}
