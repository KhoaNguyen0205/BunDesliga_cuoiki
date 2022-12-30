package com.entity;

public class PlayerDtls {

private int id;
private String image;
private String name;
private String ns;
private String club;
private String positon;


public PlayerDtls() {
	super();
	// TODO Auto-generated constructor stub
}


public PlayerDtls(String image, String name, String ns, String club, String position) {
	super();
	
	this.image = image;
	this.name = name;
	this.ns = ns;
	this.club = club;
	this.positon =position;
}


public int getId() {
	return id;
}


public void setId(int id) {
	this.id = id;
}


public String getImage() {
	return image;
}


public void setImage(String image) {
	this.image = image;
}


public String getName() {
	return name;
}


public void setName(String name) {
	this.name = name;
}


public String getNs() {
	return ns;
}


public void setNs(String ns) {
	this.ns = ns;
}


public String getClub() {
	return club;
}


public void setClub(String club) {
	this.club = club;
}


public String getPositon() {
	return positon;
}


public void setPositon(String positon) {
	this.positon = positon;
}


@Override
public String toString() {
	return "PlayerDtls [id=" + id + ", image=" + image + ", name=" + name + ", ns=" + ns + ", club=" + club
			+ ", positon=" + positon + "]";
}








	
}
