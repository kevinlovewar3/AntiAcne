package com.acne.test;

import java.io.File;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		File file = new File("C:\\Users\\Public\\workspace2\\AntiAcne\\src\\main\\resources\\jdbc.properties");
		if (file.exists()) {
			System.out.println("file exists");
		}
	}

}
