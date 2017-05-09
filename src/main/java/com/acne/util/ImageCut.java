package com.acne.util;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.io.File;

import javax.imageio.ImageIO;

public class ImageCut {

	public static void cutImage(String suffix, File sourceImgFile, String targetPath, int x1, int y1, int x2, int y2) {
		try {
			Image img;
			ImageFilter cropFilter;
			BufferedImage bi = ImageIO.read(sourceImgFile);
			int srcWidth = bi.getWidth();
			int srcHeight = bi.getHeight();
			int destWidth = x2 - x1;
			int destHeight = y2 - y1;
			if (srcWidth >= destWidth && srcHeight >= destHeight) {
				Image image = bi.getScaledInstance(srcWidth, srcHeight, Image.SCALE_DEFAULT);
				cropFilter = new CropImageFilter(x1, y1, destWidth, destHeight);
				img = Toolkit.getDefaultToolkit().createImage(new FilteredImageSource(image.getSource(), cropFilter));
				BufferedImage tag = new BufferedImage(destWidth, destHeight, BufferedImage.TYPE_INT_RGB);
				Graphics g = tag.getGraphics();
				g.drawImage(img, 0, 0, null);
				g.dispose();
				ImageIO.write(tag, suffix, new File(targetPath));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
