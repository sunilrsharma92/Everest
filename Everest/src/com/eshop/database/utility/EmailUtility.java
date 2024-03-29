package com.eshop.database.utility;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.eshop.dao.ProductInterfaceImpl;

public class EmailUtility
{

	public static boolean sendEmail(String email, String password, String propertyValue, String tempOtp) throws AddressException, MessagingException
	{
		final String user = "support@makemyshopy.com";// change accordingly
		final String pass = "madakatti@2015";

		Properties props = new Properties();
		Session session = null;
		MimeMessage message = null;
		String link = null;
		String msg = null;

		link = "http://localhost:8080/shopping1/indexTemplate.jsp?otp";  //changed accordingly
		  
		try
		{
			props.put("mail.smtp.host", "mail.makemyshopy.com");// change
																// accordingly
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.port", "8025");

			session = Session.getDefaultInstance(props, new javax.mail.Authenticator()
			{
				protected PasswordAuthentication getPasswordAuthentication()
				{
					return new PasswordAuthentication(user, pass);
				}
			});
			// 2nd step)compose message
			try
			{

				message = new MimeMessage(session);
				message.setFrom(new InternetAddress(user));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

				if (propertyValue != null && propertyValue.equalsIgnoreCase(ProductInterfaceImpl.OTP_REGISTER))
				{
					msg = "Thank you for becomming a part of our organisation. Please note down this OTP :  " + tempOtp + "  during Registration";
					message.setSubject("Registration Link with OTP");
					message.setContent(msg, "text/html; charset=utf-8");
				}
				if (propertyValue != null && propertyValue.equalsIgnoreCase(ProductInterfaceImpl.FORGOT_PASSWORD))
				{
					message.setSubject("Confidential");
					message.setText("Your new password is : " + tempOtp + " \nPlease Reset your Password as soon as you Login");
				}
				
				if (propertyValue != null && propertyValue.equalsIgnoreCase(ProductInterfaceImpl.CHANGE_PASSWORD))
				{
					message.setSubject("Information Alert");
					message.setText("Your password has been reset...\nIf it wasn't you,Make Forgot Password from our website to get your updated password");
				}
				// 3rd step)send message
				Transport.send(message);

//				System.out.println("Done");

			}
			catch (MessagingException e)
			{
				throw new RuntimeException(e);
			}

			return true;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			props = null;
			session = null;
			message = null;
			link = null;
			msg = null;
			tempOtp = null;
		}
		return false;
	}
}
