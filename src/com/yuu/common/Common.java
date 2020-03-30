package com.yuu.common;

import java.util.UUID;

import javax.servlet.http.Part;

public class Common {
	public static final String url="http://localhost:8080/YuuBook";
	
	public static boolean checkEmpty(String name, String username, String password) {
		if("".equals(name.trim()) || "".equals(username.trim()) || "".equals(password.trim())) {
			return true;
		}
		return false;
	}
	public static boolean validUserName(String username) {
		return username.trim().indexOf(" ") != -1 ? true : false;
	}
	
	public static String extractFile(Part part) {
		String str = part.getHeader("content-disposition");
		String[] items = str.split(";");
		for (String item : items) {
			if (item.trim().startsWith("filename")) {
				return item.substring(item.indexOf("=") + 2, item.length() - 1);
			}
		}
		return "";
	}
	public static String getRandomUUID() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}
}
