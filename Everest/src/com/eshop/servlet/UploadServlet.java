package com.eshop.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.eshop.dao.ConstantValues;
import com.eshop.dao.ProductInterface;
import com.eshop.dao.ProductInterfaceImpl;
import com.eshop.logger.MakemyshopyLogger;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ServletFileUpload uploader = null;
    
//    private String relativePath = ConstantValues.relativePathHC;
    private String relativePath = ConstantValues.relativePath;
    
//    private String foldername;
    private String PathofFile;
    private String foldernamejsp = "";
    private int Categoryid;
    MakemyshopyLogger log = new MakemyshopyLogger();
    
    @Override
    public void init() throws ServletException
    {
    	File file = new File(relativePath);
//    	System.out.println(relativePath.length());
//        foldername = "Images\\ProfileImg";
        foldernamejsp = "uploads/";
//        System.out.println("FolderName "+foldername);
        DiskFileItemFactory fileFactory = new DiskFileItemFactory();
        File filesDir = (File) file;
        fileFactory.setRepository(filesDir);
        this.uploader = new ServletFileUpload(fileFactory);
    }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        
    	String fileName = request.getParameter("fileName");
        if(fileName == null || fileName.equals(""))
        {
            throw new ServletException("File Name can't be null or empty");
        }
        
        File file = new File(relativePath+File.separator+fileName);
        if(!file.exists())
        {
            throw new ServletException("File doesn't exists on server.");
        }
        
        ServletContext ctx = getServletContext();
        InputStream fis = new FileInputStream(file);
        String mimeType = ctx.getMimeType(file.getAbsolutePath());
        response.setContentType(mimeType != null? mimeType:"application/octet-stream");
        response.setContentLength((int) file.length());
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
         
        
        ServletOutputStream os = response.getOutputStream();
        byte[] bufferData = new byte[1024];
        int read=0;
        
        
        while((read = fis.read(bufferData))!= -1)
        {
            os.write(bufferData, 0, read);
        }
        
        
        os.flush();
        os.close();
        fis.close();
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	HttpSession session = request.getSession();
    	PrintWriter out = response.getWriter();
//    	String key = String.valueOf( session.getAttribute("key"));
    	
    	if(!ServletFileUpload.isMultipartContent(request))
        {
            throw new ServletException("Content type is not multipart/form-data");
        }
        
//        response.setContentType("text/html");
//        out.write("<html><head></head><body>");
        try {
        	
//        	String ajaxUpdateResult = "";
            List fileItemsList = uploader.parseRequest(request);
            Iterator fileItemsIterator = fileItemsList.iterator();
            
            while(fileItemsIterator.hasNext())
            //for(int i=0;i<fileItemsList.size();i++)
            {
            	
                FileItem fileItem = (FileItem) fileItemsIterator.next();
                
                if (fileItem.isFormField()) {

                   /* ajaxUpdateResult += "Field " + fileItem.getFieldName() + " with value: " + fileItem.getString() + " is successfully read\n\r";
                    log.writeLogs(ajaxUpdateResult, 1);
                    
                    if(fileItem.getFieldName() != null && fileItem.getFieldName().equalsIgnoreCase("key"))
                    key = "# " + fileItem.getString();*/
                   
                }
                else 
                {
	                String filename = (fileItem.getName().substring(fileItem.getName().lastIndexOf("\\")+1,fileItem.getName().length()));
	                
	                File file = null;
	                String img = "";
	                String strjsonMsgResponse = "";
	                		
	                String ext = FilenameUtils.getExtension(filename);
	                
	                
	                ProductInterface dao = new ProductInterfaceImpl();
                	
                	//Getting DB Connection from web.xml
        			ServletContext ss = this.getServletContext();
        	        String connection = ss.getInitParameter("connection");
        	        String drivername = ss.getInitParameter("drivername");
        	        String username = ss.getInitParameter("username");
        	        String password = ss.getInitParameter("password");
        	        
        	        log.writeLogs("UploadServlet --> DOPost ------> "+connection+" ** "+drivername+" ** "+username+ "**" +password, 1);
        	        String DBData = connection+"#"+drivername+"#"+username+"#"+password;
	                
	                
	                if(ext.equalsIgnoreCase("csv") || ext.equalsIgnoreCase("xls"))
	                {
	                	FilenameUtils.removeExtension(filename);
	                	String defaultName = "csvFile";
	                	
	                	String path = relativePath+File.separator+defaultName+"."+ext;
	                	
	                	file = new File(path);
	                	fileItem.write(file);
	                	strjsonMsgResponse = dao.handleRequestResponse(path, 9003, DBData, null);
	                }
	                else if(ext.equalsIgnoreCase("png") || ext.equalsIgnoreCase("jpeg") || ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("gif"))
	                {
	                	file = new File(relativePath+File.separator+filename);
	                	img = foldernamejsp+filename;
		                out.write(img.toString());
		                
		                fileItem.write(file);
		                session.removeAttribute("imageUploadPath");
		                session.setAttribute("imageUploadPath", img);
//		                strjsonMsgResponse = dao.handleRequestResponse(img, 9002, DBData, null);
	                }
	                out.println(strjsonMsgResponse);
	        	        
//	                }
                
                }
            }
            
        } 
        
        catch (Exception e) 
        {
//            out.write("Exception in uploading file.");
        	e.printStackTrace();
        	log.writeLogs("Exception in uploading file : "+e.getMessage(),0);
        } 
        
//        out.write("</body></html>");
    }

}