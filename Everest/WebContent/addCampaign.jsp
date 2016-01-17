<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Everest Impact-West Zone</title>
</head>

<body>
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
        	
        	<tr><td> Zone: </td><td>
        	<select class="form-control textbox"  placeholder="Filter By Zone">
										<option value="0">Select Zone</option>
										<option value="1">Central</option>
										<option value="2">East</option>
										<option value="3">West</option>
										<option value="4">North</option>
										<option value="5">South</option>
														
			</select>
			</td></tr>
        	<tr><td> City: </td><td>
        	<select class="form-control textbox"  placeholder="Select City">
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
			</td></tr>
           <tr><td> Event Date: </td><td><input class="form-control " type="text" ></td></tr>
           <tr>
           <td> Event Time: </td>
           <td>
           <div class="input-group clockpicker" data-placement="left" data-align="top" data-autoclose="true">
				<input type="text" class="form-control" value="13:14">
				<span class="input-group-addon">
					<span class="glyphicon glyphicon-time"></span>
				</span>
			</div>
			
			</td>
			</tr>
            <tr><td>Total People Attended:</td><td> <input class="form-control " type="text"></td></tr>
            <tr><td>Total People Enquiry:</td><td> <input class="form-control " type="text"></td></tr>
            <tr><td>Total Budget:</td><td> <input class="form-control " type="text"></td></tr>
            </table>
         </div>
            
        </div><!--/col-md-6--> 
        </div>
        <div class="row well">
             <strong>Report about Meet:</strong><br>
             <!-- <textarea class="form-control" rows="8" id="comment" style="width:100%;"></textarea> -->
          
    <textarea id="editor"></textarea>
        
    </textarea>
         </div><!--/row--> 
         <div class="row well">
         <div class="col-md-2">
             <strong>Upload images:</strong>
         </div><!--/col-md-3-->
          <div class="col-md-3">
             <span class="btn btn-default btn-file">Browse <input type="file"></span>
         </div><!--/col-md-3-->
         <div class="col-md-1">
             
         </div><!--/col-md-1-->

          <div class="col-md-2">
             <strong>Upload excel data:</strong>
         </div><!--/col-md-3--> 
         <div class="col-md-3">
             <span class="btn btn-default btn-file">Browse <input type="file"></span>
         </div><!--/col-md-3-->
             
             
             
         </div><!--/row--> 
        *On submitting the Branch Manage will get notified via email and sms.<input type="button" name="Submit" value="Submit Report">
        
        
</div>
               <script type="text/javascript">
        $(document).ready(function () {
            $('#editor').jqxEditor({
                height: "400px",
                width: '100%'
            });
            
			$('.clockpicker').clockpicker();
            
        });
    </script>
</body>

</html>
