package com.acne.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HtmlRegexpUtil {
	private static final String regEx_script = "<script[^>]*?>[\\s\\S]*?<\\/script>"; // ����script��������ʽ
	private static final String regEx_style = "<style[^>]*?>[\\s\\S]*?<\\/style>"; // ����style��������ʽ
	private static final String regEx_html = "<[^>]+>"; // ����HTML��ǩ��������ʽ
	private static final String regEx_space = "\\s*|\t|\r|\n";// ����ո�س����з�
	private static final String regEx_w = "<w[^>]*?>[\\s\\S]*?<\\/w[^>]*?>";// ��������w��ǩ

	/**
	 * @param htmlStr
	 * @return ɾ��Html��ǩ
	 * @author LongJin
	 */
	public static String delHTMLTag(String htmlStr) {
		Pattern p_w = Pattern.compile(regEx_w, Pattern.CASE_INSENSITIVE);
		Matcher m_w = p_w.matcher(htmlStr);
		htmlStr = m_w.replaceAll(""); // ����script��ǩ

		Pattern p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
		Matcher m_script = p_script.matcher(htmlStr);
		htmlStr = m_script.replaceAll(""); // ����script��ǩ

		Pattern p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
		Matcher m_style = p_style.matcher(htmlStr);
		htmlStr = m_style.replaceAll(""); // ����style��ǩ

		Pattern p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
		Matcher m_html = p_html.matcher(htmlStr);
		htmlStr = m_html.replaceAll(""); // ����html��ǩ

		Pattern p_space = Pattern.compile(regEx_space, Pattern.CASE_INSENSITIVE);
		Matcher m_space = p_space.matcher(htmlStr);
		htmlStr = m_space.replaceAll(""); // ���˿ո�س���ǩ

		htmlStr = htmlStr.replaceAll(" ", ""); // ����
		return htmlStr.trim(); // �����ı��ַ���
	}
}
