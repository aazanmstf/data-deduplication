package Algorithm;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.security.Key;
import java.security.SecureRandom;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.SecretKeySpec;
import java.sql.*;

public class TagElement {
  public static void main(String[] args) {
    String filename = "example.txt";
    String tag = "file123";
    
    // Generate encryption key
    Key key = generateKey();
    
    // Encrypt file
    byte[] cipherText = encryptFile(filename, key);
    
    // Encode cipher text as base64 string
    String encodedCipherText = Base64.getEncoder().encodeToString(cipherText);
    
    // Upload encrypted file and tag to database
    uploadToDatabase(tag, encodedCipherText);
  }
  
  private static Key generateKey() {
    try {
      KeyGenerator keyGen = KeyGenerator.getInstance("AES");
      SecureRandom random = new SecureRandom();
      keyGen.init(random);
      return keyGen.generateKey();
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }
  
  private static byte[] encryptFile(String filename, Key key) {
    try {
      Cipher cipher = Cipher.getInstance("AES");
      cipher.init(Cipher.ENCRYPT_MODE, key);
      InputStream input = new FileInputStream(filename);
      int inputBytes = input.read();
      byte[] cipherText = cipher.doFinal();
      input.close();
      return cipherText;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }
  
  private static void uploadToDatabase(String tag, String encodedCipherText) {
	 
		
    try {
    	 Connection con=null;
    	Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vtjns-2023","root", "root");
      PreparedStatement statement = conn.prepareStatement("INSERT INTO files (tag, cipherText) VALUES (?, ?)");
      statement.setString(1, tag);
      statement.setString(2, encodedCipherText);
      statement.executeUpdate();
      statement.close();
      conn.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}


