package com.shopping.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.eshop.database.utility.MyConnection;

public class CommonMethodImpl {
	
	public static final String EMAIL_ID = "email";
	public static final String USERNAME = "username";
	
	
	
	@SuppressWarnings("unchecked")
	public static JSONObject getCustDetailsByProperty(String property,Object value, JSONObject parentjson, String DBData)
	{
		Connection conn = null;
		PreparedStatement stmt, stmt1, stmt2 = null;
		try
		{
			conn = MyConnection.getConnection(DBData);
			String sql = "select * from user where "+property+" = '"+value+"'";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			if (rs.next())
			{
				long key = rs.getLong("customer_key");
				parentjson.put("key", rs.getLong("customer_key"));
				parentjson.put("firstName", rs.getString("first_name"));
				parentjson.put("lastName", rs.getString("last_name"));
				parentjson.put("address1", rs.getString("address1"));
				parentjson.put("city", rs.getString("city"));
				parentjson.put("state", rs.getString("state"));
				parentjson.put("street", rs.getString("street"));
				parentjson.put("pinCode", rs.getString("postal_code"));
				parentjson.put("country", rs.getString("country"));
				parentjson.put("phone", rs.getString("phone"));
				parentjson.put("emailId", rs.getString("email"));
				parentjson.put("password", rs.getString("password"));
				parentjson.put("active", rs.getInt("active"));
				parentjson.put("otp", rs.getString("otp"));
				parentjson.put("profileImg", rs.getString("profile_img"));
				parentjson.put("rechargeAmmount", rs.getFloat("recharge_ammount"));
//				parentjson.put("videocount", rs.getLong("video_count"));
				/*long videocount = rs.getLong("video_count");
				int authentication = rs.getInt("authentication");
				Date previousDate = rs.getDate("date");
				
				System.out.println("Previous Date : "+previousDate);
				
				if(authentication == 0)
				{
					int comparison = dateDifference(DBData, previousDate);
					System.out.println("authentication == 0 :: comparison :: "+comparison);
					   if(comparison == 0)
					   {
						   parentjson.put("videocount", rs.getLong("video_count"));
						   parentjson.put("authentication", rs.getInt("authentication"));
					   }
					   else if(comparison == 1)
					   {
						   String setAuthentication = "update user set authentication = ?, date = now(), video_count = ?  where customer_key = ?";
						   stmt1 = conn.prepareStatement(setAuthentication);
						   stmt1.setLong(1, 1);
						   stmt1.setLong(2, 0);
						   stmt1.setLong(3, key);
							int result = stmt1.executeUpdate();
							if(result > 0)
							{
								parentjson.put("videocount", 0);
								parentjson.put("authentication", 1);
							}
					   }

					   System.out.println("Comparison Result:" + comparison);
				}
				else if(authentication == 1)
				{
					int comparison = dateDifference(DBData, previousDate);
					System.out.println("authentication == 1 :: comparison :: "+comparison);
					
					if(comparison == 0)
					{
						if(videocount >= 5)
						{
							String setAuthentication = "update user set authentication = ?, date = now(), video_count = ?  where customer_key = ?";
							stmt2 = conn.prepareStatement(setAuthentication);
							stmt2.setLong(1, 0);
							stmt2.setLong(2, 5);
							stmt2.setLong(3, key);
							int result = stmt2.executeUpdate();
							if(result > 0)
							{
								
							}
							parentjson.put("videocount", rs.getLong("video_count"));
							parentjson.put("authentication", 0);
						}
						else
						{
							parentjson.put("videocount", rs.getLong("video_count"));
							parentjson.put("authentication", rs.getInt("authentication"));
						}
					}
					else if(comparison == 1)
					{
						String setAuthentication = "update user set authentication = ?, date = now(), video_count = ?  where customer_key = ?";
						   stmt1 = conn.prepareStatement(setAuthentication);
						   stmt1.setLong(1, 1);
						   stmt1.setLong(2, 0);
						   stmt1.setLong(3, key);
							int result = stmt1.executeUpdate();
							if(result > 0)
							{
								parentjson.put("videocount", 0);
								parentjson.put("authentication", 1);
							}
					}
				}*/
			}
			
			closeConnectionUpdate(stmt, conn);
			
			if(parentjson != null)
				return parentjson;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return null;
	}
	
	/*public static int dateDifference( String DBData, Date previousDate)
	{
		Connection conn = null;
		PreparedStatement stmt2 = null;
		try
		{
			Date todaysDate = null ;
			conn = MyConnection.getConnection(DBData);
			String getdate = "select date(now()) as todaydate";
			stmt2 = conn.prepareStatement(getdate);
			ResultSet rs2 = stmt2.executeQuery();
			if (rs2.next())
			{
				todaysDate = rs2.getDate("todaydate");
			}
			
			System.out.println("Today's Date : "+todaysDate);
			  
			   int comparison = todaysDate.compareTo(previousDate);
			   return comparison ;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}*/
	
	public static JSONArray getZoneDetails( int intervalCount, 
																				PreparedStatement ps, 
																				Connection conn, 
																				ResultSet rs, 
																				String action, 
																				long zoneid, 
																				long cityid)
	{
		JSONObject jsonObj = new JSONObject();
		JSONArray  jsonArray = new JSONArray();
		String getZoneDetailsOfPreviousMonth = "";
		try
		{
			
			if(action.equalsIgnoreCase(""))
			{
				
				getZoneDetailsOfPreviousMonth = "SELECT * FROM sales_promotion_expenses"+
						  " WHERE zone_id = "+zoneid+" AND YEAR(import_date) = YEAR(CURRENT_DATE - INTERVAL "+intervalCount+" MONTH)"+
						  " AND MONTH(import_date) = MONTH(CURRENT_DATE - INTERVAL "+intervalCount+" MONTH)";
			}
			else if(!action.equalsIgnoreCase(""))
			{
				getZoneDetailsOfPreviousMonth = "SELECT "+action+" FROM sales_promotion_expenses"+
						  " WHERE YEAR(import_date) = YEAR(CURRENT_DATE - INTERVAL "+intervalCount+" MONTH)"+
						  " AND MONTH(import_date) = MONTH(CURRENT_DATE - INTERVAL "+intervalCount+" MONTH) and zone_id = "+zoneid+"";
			}
					System.out.println("getZoneDetailsOfPreviousMonth : "+getZoneDetailsOfPreviousMonth);
					ps = conn.prepareStatement(getZoneDetailsOfPreviousMonth);
					rs = ps.executeQuery();
					if (rs != null)
					{
						while (rs.next())
						{
							JSONObject childjson1 = new JSONObject();
							childjson1.put("key", rs.getLong("sales_promotion_expenses_key"));
							childjson1.put("zoneid", rs.getString("zone_id"));
							childjson1.put("reportid", rs.getString("report_id"));
							childjson1.put("state", rs.getString("state_ref"));
							childjson1.put("city", rs.getString("city_ref"));
							childjson1.put("tvcable", rs.getString("tv_cable"));
							childjson1.put("radiofm", rs.getString("radio_fm"));
							childjson1.put("newspapers", rs.getString("newspapers"));
							childjson1.put("wallpaintings", rs.getString("wall_paintings"));
							childjson1.put("dealerboards", rs.getString("dealer_boards"));
							childjson1.put("pop", rs.getString("pop"));
							childjson1.put("ctp", rs.getString("ctp"));
							childjson1.put("dealermeets", rs.getString("dealer_meets"));
							childjson1.put("vancampaign", rs.getString("van_campaign"));
							childjson1.put("mandimelas", rs.getInt("mandi_melas"));
							childjson1.put("stocklist", rs.getInt("stocklist"));
							childjson1.put("subdealers", rs.getInt("subdealers"));
							childjson1.put("giveaways", rs.getInt("give_aways"));
							childjson1.put("misc", rs.getInt("misc"));
							childjson1.put("importtime", rs.getString("import_time"));
							childjson1.put("importdate", rs.getString("import_date"));
							childjson1.put("total", rs.getFloat("total"));
							
							jsonArray.add(childjson1);
						}
					
//						jsonObj.put("zoneDetails"+zoneid+"", jsonArray);
					return jsonArray;
					}
					else
					{
						if(action.equalsIgnoreCase(""))
						{
							intervalCount++;
							if(intervalCount != 6)
							{
								getZoneDetails(intervalCount, ps, conn, rs, action, zoneid, cityid);
							}
							else
							{
								return null;
							}
						}
						else
						{
							return null;
						}
					}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			System.out.println("getZoneDetailsOfPreviousMonth : "+getZoneDetailsOfPreviousMonth);
			rs = null;
			ps = null;
			jsonObj = null;
			getZoneDetailsOfPreviousMonth = null;
		}
		return null;
}
	
	 // -- close all for Insert/Update
	  public static void closeConnectionUpdate(PreparedStatement stmt,Connection conn)
	  {
	    try
	    {
	    	stmt.close();
			conn.close();
	    }
	    catch (SQLException e)
	    {
	       e.printStackTrace();
	    } 
	    finally
		{
		   try 
		   {
		    if(stmt!=null)
		    	stmt.close();
		    	
		    if(conn!=null)
		         conn.close();
			} 
		    catch (SQLException e)
		    {
		    	e.printStackTrace();
		    }
		}
	  }
	  
	  // -- close all for ResultSet
	  public static void closeConnectionSelect(PreparedStatement stmt,Connection conn,ResultSet rs)
	  {
	    try
	    {
	    	stmt.close();
			conn.close();
			rs.close();
	    }
	    catch (SQLException e)
	    {
	       e.printStackTrace();
	    } 
	    finally
		{
		   try 
		   {
		    if(stmt!=null)
		    	stmt.close();
		    	
		    if(conn!=null)
		         conn.close();
		    
		    if(rs!=null)
		    	rs.close();
			} 
		    catch (SQLException e)
		    {
		    	e.printStackTrace();
		    }
		}
	  }
	  
	  public static JSONObject putSuccessJson(JSONObject parentjson,int command)
	  {
		  parentjson.put("command",command);
		  parentjson.put("status",3);
		  
		  return parentjson;
	  }
	  
	  public static JSONObject putFailedJson(JSONObject parentjson,int command)
	  {
		  parentjson.put("command",command);
		  parentjson.put("status",2);
		  
		  return parentjson;
	  }
	
	
}
