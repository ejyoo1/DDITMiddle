import java.security.MessageDigest;

public class sha256 {
	public static String testSHA256(String pwd) {
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(pwd.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();
			
			for(int i = 0 ; i < hash.length ; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length() == 1) hexString.append('0');
				hexString.append(hex);
			}
			return hexString.toString();
		}catch(Exception ex) {
			throw new RuntimeException(ex);
		}
	}
	
	public static void main(String[] args) {
		/* 암호화할 텍스트 */
		String text = "Hello, Java";
		
		/* SHA256 암호화 */
		String encryptSHA256 = sha256.testSHA256(text);
		
		/* SHA256 암호화 결과 */
		System.out.println("SAH256 암호화 요청 텍스트 : " + text);
		System.out.println("SAH256 암호화 완료 텍스트 : " + encryptSHA256);
	}
}
