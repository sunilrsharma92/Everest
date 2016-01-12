<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <!-- Header Carousel -->
    <div class="container" style="margin-top:15px;">
   <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="images/rsz_slide2 (1).jpg" >
        <h4 align="center">This is header</h4>
        <p align="center">This is paragraph with description</p>
      </div>

      <div class="item">
        <img src="images/rsz_slide4.jpg">
        <h4 align="center">Kolhapur</h4>
        <p align="center">Subdealer Conference</p>
      </div>
    
      <div class="item">
        <img src="images/rsz_slide3.jpg">
        <h4 align="center">This is header</h4>
        <p align="center">This is paragraph with description</p>
      </div>

      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
    <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Welcome to Everest Impact
                </h1>
            </div>
            <div class="row">
              
            
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-arrows"></i> Central Zone</h4>
                    </div>
                    <div class="panel-body">
                        
                        <img src="images/barchart.jpg" style="width:100%; height:100% ">
                        <a href="centralzone.jsp" class="btn btn-default">Know More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-arrow-right"></i> East Zone</h4>
                    </div>
                    <div class="panel-body">
                    <img src="images/barchart.jpg" style="width:100%; height:100% ">
                       
                        <a href="eastzone.jsp" class="btn btn-default">Know More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-arrow-left"></i> West Zone</h4>
                    </div>
                    <div class="panel-body">
                       <img src="images/bar1.jpg" style="width:100%; height:100% ">
                        <a href="westzone.jsp" class="btn btn-default">Know More</a>
                    </div>
                </div>
            </div>
            </div><!--/row-->

            <div class="col-md-2"></div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-arrow-up"></i> North Zone</h4>
                    </div>
                    <div class="panel-body">
                       <img src="images/barchart.jpg" style="width:100%; height:100% ">
                        <a href="northzone.jsp" class="btn btn-default">Know More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-arrow-down"></i> South Zone</h4>
                    </div>
                    <div class="panel-body">
                       <img src="images/barchart.jpg" style="width:100%; height:100% ">
                        <a href="southzone.jsp" class="btn btn-default">Know More</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Section -->
        <hr>
 </div>

</body>
</html>