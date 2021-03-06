package com.jsu.commons.utils;

import java.security.MessageDigest;
import java.util.Random;

import sun.misc.BASE64Encoder;

public class PasswdEncryption {

	private static final MessageDigest md;
	private static final BASE64Encoder b64Encoder;

	static {
		try {
			md = MessageDigest.getInstance("MD5", "SUN");
			b64Encoder = new BASE64Encoder();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	
	/**
	 * 加盐校验 密码
	 * @param inputPasswd
	 * @param salt
	 * @param storePasswd
	 * @return
	 */
	synchronized public static boolean checkPasswd(String inputPasswd, String salt, 
			String storePasswd) {
		String password = toPasswd(inputPasswd, salt.getBytes());
		
		if(StringUtil.nullToString(password).equals(storePasswd)){
			return true;
		}
		
		return false;
	}
	
	/**
	 * 检查密码
	 * 
	 * @param inputPasswd
	 *            用户输入的密码
	 * @param storePasswd
	 *            已存储的密码
	 * @return true:通过检查,false:未通过
	 */
	synchronized public static boolean checkPasswd(String inputPasswd,
			String storePasswd) {
		boolean ok = false;

		try {
			byte[] saltBys = storePasswd.substring(0, 2).getBytes("UTF-8");
			String inPwd = toPasswd(inputPasswd, saltBys);
			ok = inPwd.equals(storePasswd);
		} catch (Exception ex) {
			ex.printStackTrace();
			ok = false;
		}

		return ok;
	}

	/**
	 * 将客户输入的密码加密
	 * 
	 * @param inputPasswd
	 * @return
	 */
	synchronized public static String toPasswd(String inputPasswd) {
		byte[] salt = getSaltOfASCII(2);
		return toPasswd(inputPasswd, salt);
	}

	/**
	 * 将客户输入的密码加密
	 * 
	 * @param inputPasswd
	 *            客户输入的密码
	 * @param salt
	 *            盐
	 * @return 加密后的字符串
	 */
	synchronized public static String toPasswd(String inputPasswd, byte[] salt) {
		String pwd = "";

		try {
			md.reset();
			md.update(salt);
			md.update(inputPasswd.getBytes("UTF-8"));
			byte[] bys = md.digest();

			pwd += (char) salt[0];
			pwd += (char) salt[1];
			pwd += b64Encoder.encode(bys);
		} catch (Exception ex) {
			ex.printStackTrace();
			pwd = "";
		}

		return pwd;
	}

	/**
	 * 返回指定长度的盐(ASCII码)
	 * 
	 * @param len
	 *            长度
	 * @return
	 */
	private static byte[] getSaltOfASCII(int len) {
		byte[] salt = new byte[len];
		Random rand = new Random();

		for (int i = 0; i < len; i++) {
			// salt[i] = 'A';
			salt[i] = (byte) ((rand.nextInt('~' - '!') + '!') & 0x007f);
		}

		return salt;
	}
	
	public static void main(String[] args){
		String password = "system1";
		String salt="46aNz2yXqTceulVt";
		
		System.out.println(checkPasswd(password, salt, "46mQqhbPwrQemicSNP4VNm3w=="));
	}
}
