<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Add New Activity
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.jsp">Home</a>
                    </li>
                    <li class="active">Activity</li>
                </ol>
            </div>
            </div>
        <!-- /.row -->
        <h4><input type="text" class="form-control " style="width: 100%; height:50px ;font-size:25px; text-align:center;" placeholder="Title:: Dealer meet at Mumbai"></h4>
        <div class="row well" style="border:none;">
        
        <div class="col-md-6 ">

            <img src="https://placehold.it/350x150image">
            <span class="btn btn-default btn-file" style="width: 350px; border-radius: 0;">Browse <input type="file"></span>
        </div><!--/col-md-6-->  
        <div class="col-md-4 ">
        <div class="row form-group">
        <table>
        	<tr><td> Category: </td><td><select class="form-control textbox"  placeholder="select category" id="selectCat">
										<option value="0">Select category</option>
										<option value="1">Mass Media</option>
										<option value="2">Shop Display</option>
										<option value="3">Direct Central Pgm</option>
										<option value="4">Schemes</option>
										<option value="5">Others</option>
														
								</select></td></tr>
           <tr><td> Event Date: </td><td><input class="form-control " type="text" id="eventDate"></td></tr>
           <tr><td> Event Time: </td><td><input class="form-control" id="eventTime" placeholder="Now"></td></tr>
            <tr><td>Total People Attended:</td><td> <input class="form-control " id="peopleAtt" type="text"></td></tr>
            <tr><td>Total People Enquiry:</td><td> <input class="form-control " id="peopEnq" type="text"></td></tr>
            <tr><td>Total Budget:</td><td> <input class="form-control " id="totBud" type="text"></td></tr>
            </table>
         </div>
            
        </div><!--/col-md-6--> 
        </div>
        <div class="row well">
             <strong>Report about Meet:</strong><br>
             <!-- <textarea class="form-control" rows="8" id="comment" style="width:100%;"></textarea> -->
          
    <textarea id="editor"></textarea>
        
         </div><!--/row--> 
         
         <form method="post" action="UploadServlet" id="uploadFile" enctype="multipart/form-data">
            Select file to upload: <input type="file" name="fileName"  id="fileName"/>
            <br/><br/>
            <input type="submit" value="Upload" id="upldBtn"/>
            
            
            <script type="text/javascript" src="js/jquery.form.js"></script>
			<script type="text/javascript">
						$(document).ready(function(){
							try
							{
							$("#fileName").change(function()
							{
								alert("fileNameChanges");
								$(".indexoverlay").show();
								$("#upldBtn").trigger("click");
							});
							
							$('#uploadFile').ajaxForm({
							success : function (msg)
							{
								console.log("Successs ");
							}
						});
							}
							catch (e) 
							{
								console.log("Exception in uploading file on jsp : "+e);
							}
							
						});
						
			</script>
            
        </form>
         
        *On submitting the Branch Manage will get notified via email and sms.<input type="button" onclick="submitReportDetails();" id="submitReport" name="Submit" value="Submit Report">
        </div><!--/row--> 
        
     <script type="text/javascript">
        $(document).ready(function () {
            $('#editor').jqxEditor({
                height: "400px",
                width: '100%'
            });
            
//             $('#reporttime').clockpicker({
//                 autoclose: true
//             });
            
        });
    </script>
