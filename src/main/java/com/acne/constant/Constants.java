package com.acne.constant;

public class Constants {

	static {
		String platform = System.getProperty("os.name");
		
		System.out.println("----------------------------------------------------------------------------");
		System.out.println(platform);
		System.out.println("----------------------------------------------------------------------------");
		
		if (platform.indexOf("Linux") != -1) {
			IMAGE_PATH = "/home/cisco/images/";
			AVATAR_PATH = "/home/cisco/avatars/";
			VALIDATOR_PATH = "/home/cisco/validators/";
			GOODS_PATH = "/home/cisco/goods/";
		} else if (platform.indexOf("Windows") != -1) {
			IMAGE_PATH = "C:\\images\\";
			AVATAR_PATH = "C:\\avatars\\";
			VALIDATOR_PATH = "C:\\validators\\";
			GOODS_PATH = "C:\\goods\\";
		} else if(platform.indexOf("Mac")!= -1){
			IMAGE_PATH = "/Users/yaan/Documents/temp/images/";
			AVATAR_PATH = "/Users/yaan/Documents/temp/avatars/";
			VALIDATOR_PATH = "/Users/yaan/Documents/temp/validators/";
			GOODS_PATH = "/Users/yaan/Documents/temp/goods/";
		}
	}

	public static final String TYPE_ACNE = "acne_user";
	public static final String TYPE_ANTI = "anti_user";
	public static String IMAGE_PATH = "/Users/yaan/Documents/temp/images/";
	public static String AVATAR_PATH = "/Users/yaan/Documents/temp/avatars/";
	public static String VALIDATOR_PATH = "/Users/yaan/Documents/temp/validators/";
	public static String GOODS_PATH = "/Users/yaan/Documents/temp/goods/";
}
