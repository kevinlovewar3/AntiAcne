package com.acne.util;

public class StringUtil {

	public static Integer StringToInteger(String value) {
		if (value == null || value.length() == 0) {
			return Integer.MIN_VALUE;
		}
		return Integer.parseInt(value);
	}
	
	public static Long StringToLong(String value){
		if (value == null || value.length() == 0) {
			return Long.MIN_VALUE;
		}
		return Long.parseLong(value);
	}
}
