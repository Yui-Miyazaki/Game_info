package model.utirity;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class HashSolt {
	public String getSalt() {
		byte[] byteSalt = new byte[16];
        SecureRandom random = new SecureRandom();
        random.nextBytes(byteSalt);
        String salt = Base64.getEncoder().encodeToString(byteSalt);
		return salt;
	}
	
	
	public String getHashPass(String salt,String password) {

	String hashPass = null;
	
	try {
        
		
		
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(salt.getBytes());
        md.update(password.getBytes());
        //md.digestでハッシュ値（byte配列）を生成して変数に格納
        byte[] hashBytes = md.digest();
        //byte型のハッシュ値をString型に変換
         hashPass = Base64.getEncoder().encodeToString(hashBytes);
        
 

    } catch (NoSuchAlgorithmException e) {
        e.printStackTrace();
    }
	return hashPass;
	
}
}
