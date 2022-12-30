package com.entity;

public class ClubDtls {
private int id;	
private String logo;
private String name;
private String w;
private String d;
private String l;
private String score;
private String conceded;
private String matches;
private int p;
private String nuof;

public ClubDtls() {
	super();
	// TODO Auto-generated constructor stub
}
public ClubDtls(String logo, String name, String w, String d, String l, String score, String conceded) {
	super();
	this.logo = logo;
	this.name = name;
	this.w = w;
	this.d = d;
	this.l = l;
	this.score = score;
	this.conceded = conceded;
}



public int getId() {
	return id;
}



public void setId(int id) {
	this.id = id;
}



public String getLogo() {
	return logo;
}



public void setLogo(String logo) {
	this.logo = logo;
}



public String getName() {
	return name;
}



public void setName(String name) {
	this.name = name;
}



public String getW() {
	return w;
}



public void setW(String w) {
	this.w = w;
}



public String getD() {
	return d;
}



public void setD(String d) {
	this.d = d;
}



public String getL() {
	return l;
}



public void setL(String l) {
	this.l = l;
}



public String getScore() {
	return score;
}



public void setScore(String score) {
	this.score = score;
}



public String getConceded() {
	return conceded;
}



public void setConceded(String conceded) {
	this.conceded = conceded;
}



public String getMatches() {
	return matches;
}
public void setMatches(String matches) {
	this.matches = matches;
}
public int getP() {
	return p;
}
public void setP(int p) {
	this.p = p;
}

public String getNuof() {
	return nuof;
}
public void setNuof(String nuof) {
	this.nuof = nuof;
}
@Override
public String toString() {
	return "ClubDtls [id=" + id + ", logo=" + logo + ", name=" + name + ", w=" + w + ", d=" + d + ", l=" + l
			+ ", score=" + score + ", conceded=" + conceded + ", matches=" + matches + ", p=" + p + ", nuof=" + nuof
			+ "]";
}
	








}
