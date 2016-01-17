package com.eshop.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLClientInfoException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.eshop.database.utility.EmailUtility;
import com.eshop.database.utility.EncryptionUtility;
import com.eshop.database.utility.MyConnection;
import com.eshop.database.utility.RandomStringUtilsTrial;
import com.eshop.database.utility.SendMessage;
import com.eshop.logger.MakemyshopyLogger;
import com.eshop.servlet.WriteLogServlet;
import com.shopping.common.CommonMethodImpl;

public class ProductInterfaceImpl implements ProductInterface
{

	JSONObject parentjson = new JSONObject();
	JSONArray jsonarray = new JSONArray();
	JSONArray jsonarray1 = new JSONArray();
	MakemyshopyLogger mms = null;
	SendMessage sm = null;
	PreparedStatement ps, ps1, ps2, ps3, ps4 = null;
	Connection conn = null;
	ResultSet rs, rs1, rs2, rs3, rs4 = null;
	int result, result1, result2, resultTemp = 0;
	String output = null;
	BufferedReader fileReader = null;

	public static final String OTP_REGISTER = "otpRegister";
	public static final String FORGOT_PASSWORD = "ForgotPassword";
	public static final String CHANGE_PASSWORD = "changPassword";
	public static final String COMMA_DELIMITER = ",";
	// public static final String PURCHASE_DETAILS = "purchaseDetails";

	@Override
	public String handleRequestResponse(String jsonMsg, int command, String DBData, String regsmsTemplet)
	{
		mms = new MakemyshopyLogger();
		try
		{
			conn = MyConnection.getConnection(DBData);

			switch (command)
			{

				case 1051: // -- Customer/Shopkeeper Login //
					try
					{
						JSONObject object = (JSONObject) JSONValue.parse(jsonMsg);

						String email = (String) object.get("emailLogin");
						String normalPwd = (String) object.get("passLogin");
						String userType = (String) object.get("userType");
						String otpLogin = (String) object.get("otpLogin");
						String ipaddress = (String) object.get("ipaddress");
						String sql = "";
						String usertypecolumnname = "";

						if (userType != null && userType.trim().equalsIgnoreCase("customer"))
						{
							parentjson = CommonMethodImpl.getCustDetailsByProperty(CommonMethodImpl.EMAIL_ID, email, parentjson, DBData);
							sql = "update user set active = 1 where email = ?";
							usertypecolumnname = "customer_key";
						}

						// -- Unregistered user
						if (otpLogin != null && !otpLogin.trim().isEmpty())
						{
							if (parentjson.get("active") != null && parentjson.get("active").toString().equalsIgnoreCase("0"))
							{
								if (otpLogin != null && otpLogin.trim().equals((String) parentjson.get("otp")))
								{
									String encryptedPwd = EncryptionUtility.encryptUsingMD5(normalPwd);
									if (encryptedPwd != null)
									{
										boolean validPwd = EncryptionUtility.validatePassword((String) parentjson.get("password"), encryptedPwd);

										if (validPwd)
										{
											ps = conn.prepareStatement(sql);
											ps.setString(1, email);
											result = ps.executeUpdate();
											if (result > 0)
											{
												parentjson = CommonMethodImpl.putSuccessJson(parentjson, 2051);
												parentjson.put("userType", userType);
											}
											else
											{
												parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
											}
										}
										else // -- Incorrect password
										{
											parentjson = new JSONObject();
											parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
											parentjson.put("statusdesc", "Login Failed, Incorrect username or password.");
											//// System.out.println("Login
											//// Failed, Incorrect username or
											//// password.");
										}
									}
									else // -- Encryption of password failed
									{
										parentjson.put("status", 10);// --
																		// Encryption
																		// of
																		// password
																		// failed
										parentjson.put("statusdesc", "Login Failed,Please try again");
										parentjson.put("command", command);
										//// System.out.println("Encryption of
										//// password failed,Unregistered
										//// user");
									}
								}
								else
								// -- otp
								{
									// parentjson =
									// CommonMethodImpl.putFailedJson(parentjson,
									// command);
									parentjson.put("status", 10);// email
																	// already
																	// exist
									parentjson.put("statusdesc", "Invalid OTP. Please check your mail or mobile for the valid OTP");
									parentjson.put("command", command);
								}

							}
							else
							// -- inactive
							{
								parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
							}
						} // -- Registered user
						else if (parentjson.get("active") != null && parentjson.get("active").toString().equalsIgnoreCase("0"))
						{
							parentjson.put("status", 10);// email already exist
							parentjson.put("statusdesc", "Your account is not yet verified. Please enter your verification code(OTP)");
							parentjson.put("command", command);
						}
						else
						{
							String encryptedPwd = EncryptionUtility.encryptUsingMD5(normalPwd);
							// //System.out.println("encryptedPwd :
							// "+encryptedPwd);
							if (encryptedPwd != null)
							{
								boolean validPwd = EncryptionUtility.validatePassword((String) parentjson.get("password"), encryptedPwd);

								if (validPwd)
								{
									try
									{
										ps2 = conn.prepareStatement("insert into login_log(" + usertypecolumnname + ",ipaddress,login_datetime) values(?,?,now())");
										ps2.setLong(1, (Long) parentjson.get("key"));
										ps2.setString(2, ipaddress);
										result1 = ps2.executeUpdate();
										if (result1 > 0)
										{
											parentjson.put("loginlog", "Login log successfull");
										}
									}
									catch (Exception e)
									{
										e.printStackTrace();
										mms.writeLogs("ProductInterfaceImpl handleRequestResponse() " + command + " Exception : " + e, 0);
									}
									parentjson = CommonMethodImpl.putSuccessJson(parentjson, 2051);
									parentjson.put("userType", userType);
								}
								else
								{
									parentjson = new JSONObject();
									parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
									parentjson.put("statusdesc", "Login Failed, Incorrect username or password.");
								}
							}
							else
							{
								parentjson.put("status", 10);// Encryption of
																// password
																// failed
								parentjson.put("statusdesc", "Login Failed,Please try again");
								parentjson.put("command", command);
								// System.out.println("Encryption of password
								// failed,Registered user");
							}
						}

						output = parentjson.toString();
						// //System.out.println("output ::::::::: "+output);
						return output;
					}

					catch (Exception e)
					{
						e.printStackTrace();
						mms.writeLogs("ProductInterfaceImpl handleRequestResponse() " + command + " Exception : " + e, 0);
					}
					break;

				case 1052: // -- Customer/Shopkeeper Registration and Email
							// Verification //
					try
					{
						sm = new SendMessage();
						JSONObject object = (JSONObject) JSONValue.parse(jsonMsg);
						String userType = (String) object.get("userType");
						String emailSignUp = (String) object.get("emailKey");
						String mobileNum = (String) object.get("mobileKey");

						String sqlInsert = "";
						String emailExist = "";
						String tempOtp = "";
						String user = "";
						int checkEmailExist = 0;
						String createTable = "";
						String tableName = "";

						if (userType != null && userType.trim().equalsIgnoreCase("customer"))
						{
							emailExist = "select email from user";
							sqlInsert = "insert into user(email,phone,password,profile_img, video_count) values(?,?,?,?,?)";
							user = "user";
						}

						ps = conn.prepareStatement(emailExist);
						rs = ps.executeQuery();
						while (rs.next())
						{
							String dbEmail = rs.getString("email");
							if (emailSignUp.equals(dbEmail))
							{
								checkEmailExist++;
							}
						}

						if (checkEmailExist == 0)
						{
							String normalPwd = (String) object.get("passSignUp");

							String encryptedPwd = EncryptionUtility.encryptUsingMD5(normalPwd);

							if (encryptedPwd != null)
							{
								ps = conn.prepareStatement(sqlInsert);

								ps.setString(1, emailSignUp);
								ps.setString(2, (String) object.get("mobileKey"));
								ps.setString(3, encryptedPwd);
								ps.setString(4, "Images/CPImg/350x260.png");
								ps.setLong(5, 0);

								try
								{
									result = ps.executeUpdate();
								}
								catch (Exception e)
								{
									e.printStackTrace();
									mms.writeLogs("ProductInterfaceImpl handleRequestResponse() " + command + " Exception : " + e, 0);
								}

								if (result > 0)
								{
									String sql1 = "";

									tempOtp = RandomStringUtilsTrial.orderNumber();

									if (tempOtp != null && !tempOtp.trim().isEmpty())
									{
										boolean verification = EmailUtility.sendEmail(emailSignUp, null, OTP_REGISTER, tempOtp);

										if (verification)
										{
											sql1 = "update " + user + " set otp = ? where email = ?";
											ps1 = conn.prepareStatement(sql1);
											ps1.setString(1, tempOtp);
											ps1.setString(2, emailSignUp);
											resultTemp = ps1.executeUpdate();
											if (resultTemp > 0)
											{
												boolean result = sm.sendMessage("+91" + mobileNum, tempOtp, regsmsTemplet, "registration", null, (float) 0, "");
												parentjson = new JSONObject();

												parentjson = CommonMethodImpl.putSuccessJson(parentjson, 2052);// succcess
												parentjson.put("email", emailSignUp);
												parentjson.put("statusdesc", "Success");
											}
											else
											{
												parentjson.put("status", 11);// OTP
																				// Updation
																				// Failed
												parentjson.put("statusdesc", "OTP Updation Failed");
												parentjson.put("command", command);
											}
										}
										else
										{
											parentjson.put("status", 12);// //Email
																			// sending
																			// Failed
											parentjson.put("email", emailSignUp);
											parentjson.put("statusdesc", "Email sending Failed");
											parentjson.put("command", command);
										}
									}
									else
									{
										// OTP generation Failed
										parentjson.put("status", 12);// //Email
																		// sending
																		// Failed
										parentjson.put("email", emailSignUp);
										parentjson.put("statusdesc", "Email sending Failed");
										parentjson.put("command", command);
									}

								}
								else
								{
									parentjson = CommonMethodImpl.putFailedJson(parentjson, command);// Registeration
																										// failed
									parentjson.put("statusdesc", "Registration failed");// Registeration
																						// failed
									parentjson.put("command", command);
								}
							}
							else
							{
								parentjson = CommonMethodImpl.putFailedJson(parentjson, command);// Encryption
																									// password
																									// failed
								parentjson.put("statusdesc", "Registration failed");// Registeration
																					// failed
								mms.writeLogs("Reason for Registration failed ----> Encrypting password failed", 1);
								parentjson.put("command", command);
							}

						}
						else
						{
							parentjson.put("status", 10);// email already exist
							parentjson.put("statusdesc", "Email Id Already exist, please try registering  with other Email-id");
							parentjson.put("command", command);

							checkEmailExist = 0;
						}
						output = parentjson.toString();
						// ////System.out.println("output ::::::::: "+output);
						return output;
					}
					catch (Exception e)
					{
						e.printStackTrace();
						mms.writeLogs("ProductInterfaceImpl handleRequestResponse() " + command + " Exception : " + e, 0);
					}
					break;

				case 1054: // -- Forgot/Shopkeeper Password Customer//
					try
					{
						String tempOtp = "";
						String sql1 = "";
						String user = "";
						JSONObject object = (JSONObject) JSONValue.parse(jsonMsg);

						String email = (String) object.get("emailForgotPwd");
						String userType = (String) object.get("userType");

						// -- for customer
						if (userType != null && userType.trim().equalsIgnoreCase("customer"))
						{
							if (email != null && !email.trim().isEmpty())
								parentjson = CommonMethodImpl.getCustDetailsByProperty(CommonMethodImpl.EMAIL_ID, email, parentjson, DBData);

							user = "user";
						}

						if (parentjson != null && !parentjson.isEmpty())
						{
							tempOtp = RandomStringUtilsTrial.orderNumber();

							if (tempOtp != null && !tempOtp.trim().isEmpty())
							{
								boolean verification = EmailUtility.sendEmail((String) parentjson.get("emailId"), (String) parentjson.get("password"), FORGOT_PASSWORD, tempOtp);
								if (verification)
								{
									String encryptedPwd = EncryptionUtility.encryptUsingMD5(tempOtp); // --
																										// otp
																										// set
																										// as
																										// pwd

									if (encryptedPwd != null)
									{
										sql1 = "update " + user + " set password = ? where email = ?";
										ps1 = conn.prepareStatement(sql1);
										ps1.setString(1, encryptedPwd); // --
																		// set
																		// otp
																		// as
																		// password
										ps1.setString(2, email);
										resultTemp = ps1.executeUpdate();

										if (resultTemp > 0)
										{
											parentjson = new JSONObject();
											parentjson = CommonMethodImpl.putSuccessJson(parentjson, 2054);// succcess
											parentjson.put("email", email);
											parentjson.put("statusdesc", "Success");
											mms.writeLogs("OTP as password updation succeeded", 1);
										}
										else
										{
											parentjson.put("status", 11);// OTP
																			// Updation
																			// Failed
											parentjson.put("statusdesc", "OTP as password updation failed");
											parentjson.put("command", command);
											mms.writeLogs("OTP as password updation failed", 0);
										}
									}
									else
									{
										parentjson.put("status", 10);// Encryption
																		// of
																		// password
																		// failed
										parentjson.put("statusdesc", "Forgot Password Failed,Please try again");
										parentjson.put("command", command);
										mms.writeLogs("Encryption of password failed,Forgot password", 0);
									}
								}
								else
								{
									parentjson.put("status", 12); // Email
																	// sending
																	// Failed
									parentjson.put("email", email);
									parentjson.put("statusdesc", "Email sending Failed");
									parentjson.put("command", command);
									mms.writeLogs("Email sending failed", 0);
								}
							}
							else
							{
								// OTP generation Failed
								parentjson.put("status", 12);// OTP generation
																// failed
								parentjson.put("email", email);
								parentjson.put("statusdesc", "Email sending Failed");
								parentjson.put("command", command);
								mms.writeLogs("OTP generation failed", 0);
							}
						}
						else
						{
							parentjson = new JSONObject();
							parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
							parentjson.put("statusdesc", "Email-Id " + email + " does not exist");
						}
						output = parentjson.toString();
						// ////System.out.println("output ::::::::: "+output);
						return output;

					}
					catch (Exception e)
					{
						e.printStackTrace();
						mms.writeLogs("ProductInterfaceImpl handleRequestResponse() " + command + " Exception : " + e, 0);
					}

					break;

				case 1056: // -- Reset Password Cust/Shopkeeper Details //
					try
					{
						JSONObject object = (JSONObject) JSONValue.parse(jsonMsg);

						String sqlUpdate = "";
						String normalPwd = (String) object.get("pwd");
						String email = (String) object.get("email");
						String userType = (String) object.get("userType");

						if (normalPwd != null && !normalPwd.trim().isEmpty())
						{
							if (userType.trim().equalsIgnoreCase("customer"))
							{
								sqlUpdate = "update user set password = ? where email = ?";
							}

							String encryptedPwd = EncryptionUtility.encryptUsingMD5(normalPwd);
							if (encryptedPwd != null)
							{
								ps = conn.prepareStatement(sqlUpdate);
								ps.setString(1, encryptedPwd);
								ps.setString(2, email);
								result = ps.executeUpdate();
								if (result > 0)
								{
									boolean verification = EmailUtility.sendEmail(email, null, CHANGE_PASSWORD, null);
									if (verification)
									{
										parentjson = CommonMethodImpl.putSuccessJson(parentjson, 2056);
										mms.writeLogs("Email sending success", 1);
									}
									else
									{
										parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
										parentjson.put("statusdesc", "Error occurred during sending email,Please try again");
										mms.writeLogs("Email sending failed", 0);
									}
								}
								else
								{
									parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
									parentjson.put("statusdesc", "Error occurred during reset,Please try again");
									mms.writeLogs("Error occurred during update query of reset", 0);
								}
							}
							else
							{
								parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
								parentjson.put("statusdesc", "Error occurred,Please try again");
								mms.writeLogs("Error occurred during encryption", 0);
							}

						}
						else
						{
							parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
						}

						output = parentjson.toString();
						// ////System.out.println("output ::::::::: "+output);
						return output;

					}
					catch (Exception e)
					{
						e.printStackTrace();
						mms.writeLogs("ProductInterfaceImpl handleRequestResponse() " + command + " Exception : " + e, 0);
					}
					break;

				case 1057: // -- Zone Details //
					try
					{
						JSONObject object = (JSONObject) JSONValue.parse(jsonMsg);

						long zoneid = (long) object.get("zoneid");
						long cityid = (long) object.get("cityid");
						String action = (String) object.get("action");
						int intervalCount = 0;
						/*getZoneDetailsOfCurrentMonth  = "select * from sales_promotion_expenses"+
																					  "where import_date >= LAST_DAY(CURRENT_DATE) + INTERVAL 1 DAY - INTERVAL 1 MONTH"+ 
																					  "AND import_date < LAST_DAY(CURRENT_DATE) + INTERVAL 1 DAY";*/
						parentjson = CommonMethodImpl.getZoneDetails(intervalCount, ps, conn, rs, jsonarray1, parentjson,action, zoneid, cityid);
						
						if(parentjson != null)
						{
							parentjson = CommonMethodImpl.putSuccessJson(parentjson, 2057);
						}
						else
						{
							parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
							parentjson.put("statusdesc", "No reports for last 6 month found in our record.");
						}

						output = parentjson.toString();
						System.out.println("output ::::::::: "+output);
						return output;

					}
					catch (Exception e)
					{
						e.printStackTrace();
						mms.writeLogs("ProductInterfaceImpl handleRequestResponse() " + command + " Exception : " + e, 0);
					}
					break;

				case 1058: // -- Zone Details to filter //
					try
					{
						JSONObject object = (JSONObject) JSONValue.parse(jsonMsg);

						String getZoneDetails = "", from = "", to = "";
						String state_ref = "state_ref,", city_ref = "city_ref,", tv_cable = "tv_cable,",
								radio_fm = "radio_fm,", newspapers = "newspapers,", wall_paintings = "wall_paintings,",
								dealer_boards = "dealer_boards,", pop = "pop,", ctp = "ctp,",
								dealer_meets = "dealer_meets", van_campaign = "van_campaign",
								mandi_melas = "mandi_melas", stocklist = "stocklist", subdealers = "subdealers",
								give_aways = "give_aways", misc = "misc";

						String zoneid = (String) object.get("zoneid");
						String userType = (String) object.get("userType");
						getZoneDetails = "select sales_promotion_expenses_key,  total, import_date, import_time, " + state_ref + city_ref + tv_cable + radio_fm + newspapers + wall_paintings + dealer_boards + pop + ctp + dealer_meets + van_campaign + mandi_melas + stocklist + subdealers + give_aways + misc + "from sales_promotion_expenses where import_date between " + from + " and " + to;

						/*
						 * if(verification) { parentjson =
						 * CommonMethodImpl.putSuccessJson(parentjson + 2056);
						 * mms.writeLogs("Email sending success",1); } else {
						 * parentjson =
						 * CommonMethodImpl.putFailedJson(parentjson, command);
						 * parentjson.put("statusdesc",
						 * "Error occurred during sending email,Please try again"
						 * ); mms.writeLogs("Email sending failed",0); }
						 */
						output = parentjson.toString();
						// ////System.out.println("output ::::::::: "+output);
						return output;

					}
					catch (Exception e)
					{
						e.printStackTrace();
						mms.writeLogs("ProductInterfaceImpl handleRequestResponse() " + command + " Exception : " + e, 0);
					}
					break;
					
					
				case 9001: // -- Report Details //
					try
					{
						JSONObject object = (JSONObject) JSONValue.parse(jsonMsg);
						
						String selectZone = (String) object.get("selectZone");
						String peopleAtt = (String) object.get("peopleAtt");
						String peopEnq = (String) object.get("peopEnq");
						String totBud = (String) object.get("totBud");
						String eventDate = (String) object.get("eventDate");
						String eventTime = (String) object.get("eventTime");
						String editor = (String) object.get("editor");

						
						int selectZoneInt = selectZone != null && !selectZone.trim().isEmpty() ? Integer.parseInt(selectZone) : 0;
						int peopleAttInt = peopleAtt != null && !peopleAtt.trim().isEmpty() ? Integer.parseInt(peopleAtt) : 0;
						int peopEnqInt = peopEnq != null && !peopEnq.trim().isEmpty() ? Integer.parseInt(peopEnq) : 0;
						int totBudInt = totBud != null && !totBud.trim().isEmpty() ? Integer.parseInt(totBud) : 0;
						String eventDateStr = eventDate != null && !eventDate.trim().isEmpty() ? eventDate : "";
						String eventTimeStr = eventTime != null && !eventTime.trim().isEmpty() ? eventTime : "";
						String editorStr = editor != null && !editor.trim().isEmpty() ? editor : "";
						
						String sql = "insert into report(zone_id, total_people_attented,  total_people_enquiry, total_budget, event_date, event_time, body, report_date, report_time, event_img)"
								+ " values(?,?,?,?,?,?,?,now(),now(),?)";
						
						ps = conn.prepareStatement(sql);
						ps.setLong(1, selectZoneInt);
						ps.setLong(2, peopleAttInt);
						ps.setLong(3, peopEnqInt);
						ps.setLong(4, totBudInt);
						ps.setString(5, eventDateStr);
						ps.setString(6, eventTimeStr);
						ps.setString(7, editorStr);
						ps.setString(8, regsmsTemplet);
						
						int x = ps.executeUpdate();
						
						parentjson = new JSONObject();
						if(x > 0)
						{
							parentjson = CommonMethodImpl.putSuccessJson(parentjson, 5001);
							mms.writeLogs("Report Details inserted successfully",1);
						}
						else
						{
							parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
							parentjson.put("statusdesc", "Error occurred during saving report Detais");
							mms.writeLogs("Report Details saving failed",0);
						}
						output = parentjson.toString();
						// ////System.out.println("output ::::::::: "+output);
						return output;
						
					}
					catch (Exception e)
					{
						e.printStackTrace();
						mms.writeLogs("ProductInterfaceImpl handleRequestResponse() "+command+" Exception : "+e,0);
					}
					break;
					
					// - no use currently
				 case 9002: // -- Update image in db // 
						try
						{
						 mms.writeLogs("json Msg : "+jsonMsg+" command : "+command+" Exception : ",1);
							 
						  String profileImg = "";
						 
						  String sql = "update report set event_img = ? where report_id = ?";
						  
						  ps = conn.prepareStatement(sql);
						  ps.setString(1, profileImg);
						  ps.setInt(2, 2);// --  Sunil
						  
						result = ps.executeUpdate();
						
						if (result > 0)
						{
							 parentjson =  CommonMethodImpl.putSuccessJson(parentjson, 2000);
							 parentjson.put("command", 2058); 
						} else
						{ 
							parentjson =  CommonMethodImpl.putFailedJson(parentjson, command);
						}
					  
					  output = parentjson.toString();
					  ////System.out.println("output ::::::::: "+output); 
					  return output;
					  }
					  
					 catch (Exception e) 
					  { 
					  		e.printStackTrace();
					  		mms.writeLogs("ProductInterfaceImpl handleRequestResponse() "+command+" Exception : "+e,0); 
					  } break;
					
					  
					  
				 case 9003: // -- Validate excel // 
					 
					 try
					 {
						 mms.writeLogs("json Msg : "+jsonMsg+" command : "+command+" Exception : ",1);
						 
						 int columnLength = 17;
				    		
				    		String lineHeader = "";
				    		String line = "";
				    		int currentRow = 4, startFromRow = 4;
				    		
				    		//Create the file reader
				    		fileReader = new BufferedReader(new FileReader(jsonMsg));
				    		
				    		
				    		//Read the CSV file header to skip it
				    		lineHeader = fileReader.readLine();
				    		lineHeader = fileReader.readLine();
				    		
				    		lineHeader = fileReader.readLine();  // -- start reading the 3rd Line Header
				    		if(lineHeader != null)
				    		{
				    			String[] tokensHeader = lineHeader.split(COMMA_DELIMITER);	
				    			
				    			if(tokensHeader == null || tokensHeader.length < columnLength)
				    			{
				    				System.out.println("Insufficient Head columns : "+Arrays.toString(tokensHeader));
				    				mms.writeLogs("command : "+command+" Insufficient Head columns : "+Arrays.toString(tokensHeader), 0);
				    				parentjson.put("statusdesc", "Insufficient Head columns : "+Arrays.toString(tokensHeader));
				    				parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
				    			}
				    			else
				    			{
				    				List<Integer> errorRowsList = new ArrayList<Integer>();
				    				//Read the file line by line starting from the 4th line
				    				while ((line = fileReader.readLine()) != null) {
				    					
				    					//Get all tokens available in line
				    					String[] tokensRow = line.split(COMMA_DELIMITER);
				    					
				    					if(tokensRow == null || tokensRow.length < columnLength)
				    					{
				    						errorRowsList.add(currentRow - startFromRow); // -- actual 1st row = (current row )5 - 4 (start from row) 
				    					}
				    					
				    					++currentRow;
				    				}
				    				
				    				if(errorRowsList != null && errorRowsList.size() > 0)
				    				{
				    					System.out.println("Insufficient Value for rows : "+Arrays.toString(errorRowsList.toArray()));
				    					mms.writeLogs("command : "+command+" Insufficient Value for rows : "+Arrays.toString(errorRowsList.toArray()), 0);
					    				parentjson.put("statusdesc", "Insufficient Head columns : "+Arrays.toString(tokensHeader));
					    				parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
				    				}
				    				else
				    				{
				    					System.out.println("CSV file is authenticated, you can upload now...");
				    					mms.writeLogs("CSV file is authenticated, you can upload now...", 1);
					    				parentjson.put("statusdesc", "CSV file is authenticated, you can upload now...");
					    				parentjson = CommonMethodImpl.putSuccessJson(parentjson, 5003);

				    				}
				    			}
				    		}
						 
				    		fileReader.close();
						 output = parentjson.toString();
						 ////System.out.println("output ::::::::: "+output); 
						 return output;
					 }
					 
					 catch (Exception e) 
					 { 
						 e.printStackTrace();
						 mms.writeLogs("ProductInterfaceImpl handleRequestResponse() "+command+" Exception : "+e,0); 
						 fileReader.close();
					 } break;
					 
					 
					 
				 case 9004: // -- Read and Import excel // 
					 List<String> errorRowsList = new ArrayList<String>();
				     int currentRow = 4, startFrom = 4;
					 try
					 {
				            String line = "";
				            String filePath = ConstantValues.relativePath+File.separator+"csvFile.csv";
				            
				            //Create the file reader
				            fileReader = new BufferedReader(new FileReader(filePath));


				            //Read the CSV file header to skip it
				            fileReader.readLine();
				            fileReader.readLine();
				            
				            fileReader.readLine();
				            
				             Map<String, Integer> mapState = new HashMap<String, Integer>();
					       	 Map<String, Integer> mapCity = new HashMap<String, Integer>();
					       	 int stateRef = 0, cityRef = 0;
					       	 
				    		 //Read the file line by line starting from the 4th line
				             while ((line = fileReader.readLine()) != null) {

				                 //Get all tokens available in line
				                 String[] tokensRow = line.split(COMMA_DELIMITER);
				                 
				                 if(tokensRow != null && tokensRow.length > 0)
				                 {
				                	 if(mapCity.size() == 0 && mapState.size() == 0) // -- shud iterate only once to fill the mapCity and mapState.
				                	 {
				                		 String sqlState = "select * from state";
				                    	 
				                    	 PreparedStatement stState = conn.prepareStatement(sqlState);
				                    	 ResultSet rsState = stState.executeQuery();
				                    	 while(rsState.next())
				                    	 {
				                    		 int key = rsState.getInt(1);
				                    		 String stateName = rsState.getString(2);
				                    		 
				                    		 mapState.put(stateName.toUpperCase(), key);
				                    	 }
				                    	 
				                    	 String sqlCity = "select city_key, name from city";
				                    	 
				                    	 PreparedStatement stCity = conn.prepareStatement(sqlCity);
				                    	 ResultSet rsCity = stCity.executeQuery();
				                    	 while(rsCity.next())
				                    	 {
				                    		 int key = rsCity.getInt(1);
				                    		 String cityName = rsCity.getString(2);
				                    		 
				                    		 mapCity.put(cityName.toUpperCase(), key);
				                    	 }
				                	 }
				                	 
				                	 String stateNameToken = tokensRow[0];
				                	 String cityNameToken = tokensRow[1];
				                	 
				                	 if(mapState != null && mapState.size() > 0)
				                	 {
				                		// --  done containsKey() check, since, when there is no val for key, it gives NPE
				                		 stateRef = mapState.containsKey(stateNameToken.toUpperCase()) ? mapState.get(stateNameToken.toUpperCase()) : 0; 
				                	 }
				                	 if(mapCity != null && mapCity.size() > 0)
				                	 {
				                		// -- done containsKey() check, since, when there is no val for key, it gives NPE
				                		 cityRef = mapCity.containsKey(cityNameToken.toUpperCase()) ? mapCity.get(cityNameToken.toUpperCase()) : 0;
				                	 }
				                	 
				                	 if(cityRef == 0 || stateRef == 0)
				                	 {
				                		 if(stateNameToken.equalsIgnoreCase("Total -Rs."))
				                		 {
				                			 line = fileReader.readLine(); 
				                		 }
				                		 else
				                		 {
				                			 System.out.println("State or City entered in incorrect for row : "+(currentRow-startFrom)); // -- actual 1st row = (current row )5 - 4 (start from row) 
					                		 errorRowsList.add("State or City entered in incorrect for row : "+(currentRow-startFrom));
					                		 mms.writeLogs("State or City entered in incorrect for row : "+(currentRow-startFrom),0);
				                		 }
				                	 }
				                	 else
				                	 {
				                	 String sql = "insert into sales_promotion_expenses"
				                	 		+ "(state_ref, city_ref, tv_cable, radio_fm, newspapers, wall_paintings, dealer_boards, pop, ctp, dealer_meets, van_campaign, mandi_melas, stocklist, subdealers, give_aways, misc, total) "
				                	 		+ "		values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				                	 
				                	 PreparedStatement st = conn.prepareStatement(sql);
				                	 
				                	 st.setInt(1, stateRef);
				                	 st.setInt(2, cityRef);
				                	 st.setInt(3, Integer.parseInt((tokensRow[2] != null && !tokensRow[2].trim().isEmpty()) ? tokensRow[2] : "0"));
				                	 st.setInt(4, Integer.parseInt((tokensRow[3] != null &&  !tokensRow[3].trim().isEmpty()) ? tokensRow[3] : "0"));
				                	 st.setInt(5, Integer.parseInt((tokensRow[4] != null &&  !tokensRow[4].trim().isEmpty()) ? tokensRow[4] : "0"));
				                	 st.setInt(6, Integer.parseInt((tokensRow[5] != null &&  !tokensRow[5].trim().isEmpty()) ? tokensRow[5] : "0"));
				                	 st.setInt(7, Integer.parseInt((tokensRow[6] != null &&  !tokensRow[6].trim().isEmpty()) ? tokensRow[6] : "0"));
				                	 st.setInt(8, Integer.parseInt((tokensRow[7] != null &&  !tokensRow[7].trim().isEmpty()) ? tokensRow[7] : "0"));
				                	 st.setInt(9, Integer.parseInt((tokensRow[8] != null &&  !tokensRow[8].trim().isEmpty()) ? tokensRow[8] : "0"));
				                	 st.setInt(10, Integer.parseInt((tokensRow[9] != null &&  !tokensRow[9].trim().isEmpty()) ? tokensRow[9] : "0"));
				                	 st.setInt(11, Integer.parseInt((tokensRow[10] != null &&  !tokensRow[10].trim().isEmpty()) ? tokensRow[10] : "0"));
				                	 st.setInt(12, Integer.parseInt((tokensRow[11] != null &&  !tokensRow[11].trim().isEmpty()) ? tokensRow[11] : "0"));
				                	 st.setInt(13, Integer.parseInt((tokensRow[12] != null &&  !tokensRow[12].trim().isEmpty()) ? tokensRow[12] : "0"));
				                	 st.setInt(14, Integer.parseInt((tokensRow[13] != null &&  !tokensRow[13].trim().isEmpty()) ? tokensRow[13] : "0"));
				                	 st.setInt(15, Integer.parseInt((tokensRow[14] != null &&  !tokensRow[14].trim().isEmpty()) ? tokensRow[14] : "0"));
				                	 st.setInt(16, Integer.parseInt((tokensRow[15] != null &&  !tokensRow[15].trim().isEmpty()) ? tokensRow[15] : "0"));
				                	 st.setInt(17, Integer.parseInt((tokensRow[16] != null &&  !tokensRow[16].trim().isEmpty()) ? tokensRow[16] : "0"));
				                	 
				                	 result = st.executeUpdate();
				                	 
				                	 if(result > 0)
				                	 {
				                		 System.out.println(Arrays.toString(tokensRow)+" successfully inserted");
				                		 mms.writeLogs(Arrays.toString(tokensRow)+" successfully inserted",1);
				                	 }
				                	 else
				                	 {
				                		 System.out.println("Error occurred in uploading row : "+(currentRow - startFrom)); // -- actual 1st row = (current row )5 - 4 (start from row) 
				                		 errorRowsList.add("Error occurred in uploading row : "+(currentRow - startFrom));
				                		 mms.writeLogs("Error occurred in uploading row : "+(currentRow - startFrom),0);
				                	 }
				                	 
				                	 }
				                 }
				                 else // -- if(tokensRow != null && tokensRow.length > 0)
				                 {
				                	 System.out.println("No data to import, Please check the file again !!!");
				                	 errorRowsList.add("No data to import, Please check the file again !!!");
				                	 mms.writeLogs("No data to import, Please check the file again !!!",0);
				                 }
				            	 
				            	 ++currentRow;
				            }

				             fileReader.close();
				             
				             if(errorRowsList != null && errorRowsList.size() > 0)
				             {
				            	 parentjson.put("statusdesc", errorRowsList);
		                		 parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
				             }
				             else
				             {
				            	 parentjson = CommonMethodImpl.putSuccessJson(parentjson, command);
				             }
				             output = parentjson.toString();
							 ////System.out.println("output ::::::::: "+output); 
							 return output;
					 }
					 
					 catch (Exception e) 
					 { 
						 e.printStackTrace();
						 mms.writeLogs("ProductInterfaceImpl handleRequestResponse() "+command+" Exception : "+e,0); 
						 fileReader.close();
					 } 
					 break;
					 
					
					

				default:
					parentjson = CommonMethodImpl.putFailedJson(parentjson, command);
					parentjson.put("statusdesc", "Command Not Found");
					mms.writeLogs("ProductInterfaceImpl handleRequestResponse() " + command + " Command Not Found", 0);
					output = parentjson.toString();
					break;
			}

			return output;

		}
		catch (Exception e)
		{
			e.printStackTrace();
			mms.writeLogs("ProductInterfaceImpl handleRequestResponse() " + command + " Exception : " + e, 0);
			return null;
		}
		finally
		{
			output = null;
			parentjson = null;
			jsonarray1 = null;
			jsonarray = null;
			ps = null;
			ps1 = null;
			conn = null;
			rs = null;
			mms = null;
			sm = null;
		}

	}

}
