<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">
                    Add New Activity
                </h3>
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
        <div class="col-md-6 ">
        <div class="row form-group">
        <table>
        	
        	<tr><td> Zone: </td><td>
        	<select class="form-control textbox"  placeholder="Filter By Zone" id="selectZone">
										<option value="0">Select Zone</option>
										<option value="1">Central</option>
										<option value="2">East</option>
										<option value="3">West</option>
										<option value="4">North</option>
										<option value="5">South</option>
			</select>
			</td></tr>
        	<!--<tr ><td> City: </td><td>
        	<select class="form-control textbox"  placeholder="Select City" id="selectCity">
                    <option value="43">w1-Mumbai</option>
                    <option value="44">w2-Thane/Palghar</option>
                    <option value="45">w3-Raigad</option>
                    <option value="46">w4-Nasik/Ahmednagar</option>
                    <option value="47">w5-Pune/Solapur</option>
                    <option value="48">w6-kolapur/Satara</option>
                    <option value="49">w7-Aurangabad</option>
                    <option value="50">w8-Ratnagiri/Sindhudurg</option>
                    <option value="51">w9-Dhule/Jalgaon/Nandurbar</option>
                    <option value="52">w10-Valsad</option>
                    <option value="53">w11-Ahmedabad</option>
                    <option value="54">w12-Saurashtra</option>
                    <option value="55">w13-Surat</option>
                    <option value="56">w14-Baroda</option>
                    <option value="57">w15-Goa</option>
                    <option value="58">w16-Vidarbha</option>
                 </select>
			</td></tr> -->
			 <tr><td> Event Date: </td><td><input class="form-control " type="text" id="eventDate"></td></tr>
<!--            <tr><td> Event Time: </td><td><input class="form-control" id="eventTime" ></td></tr> -->
            <tr><td>Total People Attended:</td><td> <input class="form-control " id="peopleAtt" type="text"></td></tr>
            <tr><td>Total People Enquiry:</td><td> <input class="form-control " id="peopEnq" type="text"></td></tr>
            <tr><td>Total Budget:</td><td> <input class="form-control " id="totBud" type="text"></td></tr>
           <tr>
           <td> Event Time: </td>
           <td>
           <div class="input-group clockpicker" data-placement="left" data-align="top" data-autoclose="true" >
				<input type="text" class="form-control" value="13:14" id="eventTime">
				<span class="input-group-addon">
					<span class="glyphicon glyphicon-time"></span>
				</span>
			</div>
			
			</td>
			</tr>
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
            Select file to upload for Image: <input type="file" name="fileName"  id="fileName"/>
            <br/><br/>
            <input type="submit" value="Upload" id="upldBtn" style="display:none"/>
            
            
            <script type="text/javascript" src="js/jquery.form.js"></script>
			<script type="text/javascript">
						$(document).ready(function(){
							try
							{
							$("#fileName").change(function()
							{
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
         <form method="post" action="UploadServlet" id="uploadFileExcel" enctype="multipart/form-data">
            Select file to upload for Excel: <input type="file" name="fileNameExcel"  id="fileNameExcel"/>
            <br/><br/>
            <input type="submit" value="Upload" id="upldBtnExcel" style="display:none"/>
            
            
            <script type="text/javascript" src="js/jquery.form.js"></script>
			<script type="text/javascript">
						$(document).ready(function(){
							try
							{
							$("#fileNameExcel").change(function()
							{
								$(".indexoverlay").show();
								$("#upldBtnExcel").trigger("click");
							});
							
							$('#uploadFileExcel').ajaxForm({
							success : function (msg)
							{
								console.log("Successs ");
							}
						});
							}
							catch (e) 
							{
								console.log("Exception in uploading file on jsp for Excel: "+e);
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
            
			$('.clockpicker').clockpicker();
            
        });
    </script>
