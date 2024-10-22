package model.entity;

import java.io.Serializable;

public class StockBean implements Serializable {
	//フィールド設定
	private int stock;
	private int price;
	private int ranking;
	
	private StockBean() {
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
	
	
}
