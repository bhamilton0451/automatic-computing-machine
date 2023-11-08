<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="
    	library.CookieHandler,
		java.io.IOException,
		java.io.PrintWriter,
		java.util.Date,
		
		javax.servlet.annotation.WebServlet,
		javax.servlet.http.Cookie,
		javax.servlet.http.HttpServlet,
		javax.servlet.http.HttpServletRequest,
		javax.servlet.http.HttpServletResponse,
		javax.servlet.http.HttpSession
    "%>
<!DOCTYPE html>

<html>

<head>
	<meta charset="UTF-8">
	<title>Receiver</title>
	
	<script>
		function getElementByID(a){
			return document.getElementById(a);
		}
		
		function getText(a){
			var text = document.getElementById(a).value;
			return String(text);
		}
		
		function setNonNull(a, b){
			if (getElementByID(a) != null){
				getElementByID(a).innerHTML = getText(b);
			}
		}
		
		function setElementColor(element, hex_code){
			el = getElementByID(element)
			
			el.style.color = hex_code
		}
		
		
	</script>
	
</head>

<body>
	<%
		CookieHandler handler = new CookieHandler();
		Cookie[] cookie = request.getCookies();
		
		HttpSession sess = request.getSession(true);
		int acc;
		
		/*
		System.out.println();
		System.out.println("START:");
		for(int L = 0; L < cookie.length; L++){
			System.out.println(cookie[L].getName() + " " + cookie[L].getValue());
		}
		*/
			
		PrintWriter writer = response.getWriter();
		
		String user_name = handler.ReadCookie(cookie, "user_name").getValue();
		
		String[] valor = {
				user_name,
				String.valueOf(session.getId()),
				String.valueOf(session.getCreationTime()),
				String.valueOf(session.getLastAccessedTime()),
		};
		
		Date cria = new Date(Long.valueOf(valor[2]));
		Date recente = new Date(Long.valueOf(valor[3]));
		
		try {
			//System.out.println();
			acc = (Integer)sess.getAttribute("num_acc");
			//System.out.println(acc);
		} catch(NullPointerException exp) {
			acc = 0;
		}
		acc = acc + 1;
		
		sess.setAttribute("num_acc", acc);
		
		//Checa se num_acc é maior que 4
		String num_acc = String.valueOf(sess.getAttribute("num_acc")); 
			
		
	%>
	
	
	
	<input id='sessao_nome' type='hidden' value='<%=valor[0]%>'/>
	<input id='sessao_id' type='hidden' value='<%=valor[1]%>'/>
	<input id='sessao_cria' type='hidden' value='<%=cria%>'/>
	<input id='sessao_recente' type='hidden' value='<%=recente%>'/>
	<input id='num_acc' type='hidden' value='<%=num_acc%>'/>

	
	<h2 id="s_nome">N/A</h2><br>
		
	<h2 id="s_id">N/A</h2><br>
		
	<h2 id="s_cria">N/A</h2><br>
		
	<h2 id="s_recente">N/A</h2><br>
	
	<h2 id="5maior"></h2><br>
	
	<script>
	
		setNonNull("s_nome", "sessao_nome")
		setNonNull("s_id", "sessao_id")
		setNonNull("s_cria", "sessao_cria")
		setNonNull("s_recente", "sessao_recente")
		
		if(parseInt(getText("num_acc")) >= 5){
			getElementByID("5maior").innerHTML = "Você acessou mais de 5 vezes!"
		}
	
	</script>
</body>

</html>