package com.dao;

public class AliceDetails {
	String emailid;
	int logins;
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public int getLogins() {
		return logins;
	}
	public void setLogins(int logins) {
		this.logins = logins;
	}
	@Override
	public String toString() {
		return "AliceDetails [emailid=" + emailid + ", logins=" + logins + "]";
	}

}
