//import java.io.IOException;
//import java.io.PrintWriter;
package library;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CookieHandler")
public class CookieHandler extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try{
			String redirectURL = "receiver.jsp";
			
			//System.out.println();
			//System.out.println("START:");
			
			String a = request.getParameter("user_name");
			//System.out.println(a);
			
			//System.out.println("- - - - - -");
			
			Cookie cookie1 = new Cookie("user_name", a);
			//System.out.println(cookie1.getName() + " " + cookie1.getValue());
			
			
			//Seta vida máxima em segundos
			cookie1.setMaxAge(60*5);
			
			response.addCookie(cookie1);
			
			response.sendRedirect(redirectURL);
			
		} catch (Exception e ) {
			e.printStackTrace();
		}
	}
	
	public Cookie ReadCookie(Cookie[] cookie, String name) {
		//System.out.println();
		//System.out.println("COMPARING:");
		for(int L = 0; L < cookie.length; L++) {
			//System.out.println(cookie[L].getName() + " TO " + name);
			
			if(cookie[L].getName().equals(name)) {
				//System.out.println("PASS!");
				//System.out.println();
				return cookie[L];
			}
			
		} 
		//System.out.println( name + " NOT IN ARRAY!");
		//System.out.println();
		return null;
	}
	
	
	
}
