package packageB;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.json.JSONObject;


public class SendEmail {
	
	
	
	 void sendEmail(String to,String EmailMessage){
		final String username = "mksinghal8@gmail.com";
        final String password = "delhi92107214298";
       

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
          });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(to));
            message.setSubject("Your Order has been Successfully placed.");
            message.setContent(EmailMessage,"text/html");
            

            Transport.send(message);

            System.out.println("Message has been Sent to: "+to);

        } catch (MessagingException e) {
        
            throw new RuntimeException(e);
        }
 
	}
	



    public static void main(String[] args) {
    	//sendEmail();

           }
}
