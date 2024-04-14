package pojo;

import java.io.Serializable;

public class Account implements Serializable{
	
	private int acc_id;
	private String acc_name;
	private String acc_password;
	
	private String bkid;
	private int acc_balance;
	
	public Account() {
		
	}
	

	

	public Account(int acc_id, String acc_name, String acc_password, String bkid, int acc_balance) {
		super();
		this.acc_id = acc_id;
		this.acc_name = acc_name;
		this.acc_password = acc_password;
		
		this.bkid = bkid;
		this.acc_balance = acc_balance;
	}




	public int getAcc_id() {
		return acc_id;
	}

	public void setAcc_id(int acc_id) {
		this.acc_id = acc_id;
	}

	public String getAcc_name() {
		return acc_name;
	}

	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}

	public String getAcc_password() {
		return acc_password;
	}

	public void setAcc_password(String acc_password) {
		this.acc_password = acc_password;
	}

	public int getAcc_balance() {
		return acc_balance;
	}

	public void setAcc_balance(int acc_balance) {
		this.acc_balance = acc_balance;
	}
	

	



	public String getBkid() {
		return bkid;
	}




	public void setBkid(String bkid) {
		this.bkid = bkid;
	}




	@Override
	public String toString() {
		return "Account [acc_id=" + acc_id + ", acc_name=" + acc_name + ", acc_password=" + acc_password +
				  ", bkid=" + bkid + ", acc_balance=" + acc_balance + "]";
	}
	

	
}
