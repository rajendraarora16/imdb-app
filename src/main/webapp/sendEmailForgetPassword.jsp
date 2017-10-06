<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%

String email = request.getParameter("email");
String passCode = request.getParameter("passCode");

String to = email;  
//Get the session object  
Properties props = new Properties();  
props.put("mail.smtp.host", "smtp.gmail.com");  
props.put("mail.smtp.socketFactory.port", "465");  
props.put("mail.smtp.socketFactory.class",  
    	"javax.net.ssl.SSLSocketFactory");  
props.put("mail.smtp.auth", "true");  
props.put("mail.smtp.port", "465");  

Session sess = Session.getInstance(props,  
	new javax.mail.Authenticator() {  
	protected PasswordAuthentication getPasswordAuthentication() {  
	return new PasswordAuthentication("","");  
		}  
});  

//compose message  
try {  
	 MimeMessage message = new MimeMessage(sess);  
	 message.setFrom(new InternetAddress(""));//change accordingly  
	 message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	 message.setSubject("Your Password link");  
	 message.setText("Hi,"
      		+ "\n\nPlease click below the link to generate new password:"
      		+ "\n\nhttps://imdbnews.herokuapp.com/changePassword?email="+email+"&passCode="+passCode
      		+ "\n\nHave a nice day!"
      		+ "\nIMDB");  

	//send message  
	Transport.send(message);
}catch(Exception e){e.printStackTrace();}

//Redirect to a page
response.sendRedirect("passwordSent");
%>