// Filter에서 들어온 데이터를 가공하고 싶을 때 사용하는 것 : Wrapper
package common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper{

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getParameter(String name) {
		String value = null;
		
		if(name != null && (name.equals("userPwd") || name.equals("newPwd"))) {
			// 암호화 진행 : SHA-512
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-512");
				String pwd = super.getParameter(name);
				byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
				md.update(bytes);
				
				value = Base64.getEncoder().encodeToString(md.digest());
			
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			value = super.getParameter(name);
		}
		return value;
	}
}
