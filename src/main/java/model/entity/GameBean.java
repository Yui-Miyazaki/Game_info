package model.entity;

import java.sql.Date;

public class GameBean {
private int gameId;
private String gameName;
private String maker;
private Date releseDate;
private int stock;
private int price;
private int ranking;
private String itemCode;



public GameBean() {
	
}
public int getGameId() {
	return gameId;
}
public void setGameId(int gameId) {
	this.gameId = gameId;
}
public String getGameName() {
	return gameName;
}
public void setGameName(String gameName) {
	this.gameName = gameName;
}
public String getMaker() {
	return maker;
}
public void setMaker(String maker) {
	this.maker = maker;
}
public Date getReleseDate() {
	return releseDate;
}
public void setReleseDate(Date releseDate) {
	this.releseDate = releseDate;
}
public int getStock() {
	return stock;
}
public void setStock(int stock) {
	this.stock = stock;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getRanking() {
	return ranking;
}
public void setRanking(int ranking) {
	this.ranking = ranking;
}
public String getItemCode() {
	return itemCode;
}
public void setItemCode(String itemCode) {
	this.itemCode = itemCode;
}
}







