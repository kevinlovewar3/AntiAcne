package com.acne.util;

public class ObjectUtil {

	public static Long ObjectToLong(Object value){
		if (value == null) {
			return Long.MIN_VALUE;
		}
		return StringUtil.StringToLong(value.toString());
	}
	
	public static String ObjectToString(Object value){
		if (value == null) {
			return "";
		}
		return value.toString();
	}
}
