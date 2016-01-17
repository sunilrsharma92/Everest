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
    <script type="text/javascript">
        $(document).ready(function () {
            
        	var data = [{'Category' : 'Dealer',	'Date' :'1/12/2016',	'Name' : 'Ram',	'Email' :'ram@gmail.com',	'Mobile' :'1234567890',	'Zone' :'west',	'State' :'maharashtra',	'City' :'mumbai'},
        	            {'Category' : 'Dealer',	'Date' :'1/12/2016',	'Name' : 'Sham',	'Email' :'ram@gmail.com',	'Mobile' :'1234567890',	'Zone' :'west',	'State' :'maharashtra',	'City' :'mumbai'},
        	            {'Category' : 'Dealer',	'Date' :'1/12/2016',	'Name' : 'Rahul',	'Email' :'ram@gmail.com',	'Mobile' :'1234567890',	'Zone' :'west',	'State' :'maharashtra',	'City' :'mumbai'},
        	            {'Category' : 'Dealer',	'Date' :'1/12/2016',	'Name' : 'Sunil',	'Email' :'ram@gmail.com',	'Mobile' :'1234567890',	'Zone' :'west',	'State' :'maharashtra',	'City' :'mumbai'},
        	            {'Category' : 'Dealer',	'Date' :'1/12/2016',	'Name' : 'Deva',	'Email' :'ram@gmail.com',	'Mobile' :'1234567890',	'Zone' :'west',	'State' :'maharashtra',	'City' :'mumbai'}
        	            ];

        	var source =
            {
            		localdata : data,
                dataType: "json",
                dataFields: [
                     { name: 'Name', type: 'string' },
                     { name: 'Mobile No', type: 'number' },
                     { name: 'Date', type: 'date' },
                     { name: 'Email', type: 'string' },
                     { name: 'City', type: 'string' },
                     { name: 'State', type: 'sting' },
                     { name: 'Zone', type: 'string' },
                     { name: 'Category', type: 'string' },
                     { name: 'Address', type: 'string' }
                ], 
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            $("#dataTable").jqxGrid(
            {
                source: dataAdapter,
                pageable: true,
                altRows: true,
                filterable: true,
                filterMode: 'advanced',
                showfilterrow:true,
                selectionmode: 'multiplecellsextended',
                width: '100%',
                columns: [
                  { text: 'Name', cellsAlign: 'center', align: 'center', dataField: 'Name', width: '20%' },
                  { text: 'Date', cellsAlign: 'center', align: 'center', dataField: 'Date', width: '20%' },
                  { text: 'Zone', cellsAlign: 'center', align: 'center', dataField: 'Zone', width: '10%' },
                  { text: 'Category', cellsAlign: 'center', align: 'center', dataField: 'Category', width: '20%' },
                  { text: 'State', cellsAlign: 'center', align: 'center', dataField: 'State', width: '15%' },
                  { text: 'Email', cellsAlign: 'center', align: 'center', dataField: 'Email', width: '15%', hidden:true },
                  { text: 'Contact Num', cellsAlign: 'center', align: 'center', dataField: 'Mobile', width: '15%' , hidden:true},
                  { text: 'City', cellsAlign: 'center', align: 'center', dataField: 'City',width: '15%' }
                ]
            });
            
            $("#excelExport").jqxButton();
            $("#xmlExport").jqxButton();
            $("#csvExport").jqxButton();
            $("#tsvExport").jqxButton();
            $("#htmlExport").jqxButton();
            $("#jsonExport").jqxButton();
            $("#pdfExport").jqxButton();

            $("#excelExport").click(function () {
                $("#dataTable").jqxGrid('exportdata', 'xls', 'jqxGrid');           
            });
            $("#xmlExport").click(function () {
                $("#dataTable").jqxGrid('exportdata', 'xml', 'jqxGrid');
            });
            $("#csvExport").click(function () {
                $("#dataTable").jqxGrid('exportdata', 'csv', 'jqxGrid');
            });
            $("#tsvExport").click(function () {
                $("#dataTable").jqxGrid('exportdata', 'tsv', 'jqxGrid');
            });
            $("#htmlExport").click(function () {
                $("#dataTable").jqxGrid('exportdata', 'html', 'jqxGrid');
            });
            $("#jsonExport").click(function () {
                $("#dataTable").jqxGrid('exportdata', 'json', 'jqxGrid');
            });
            $("#pdfExport").click(function () {
                $("#dataTable").jqxGrid('exportdata', 'pdf', 'jqxGrid');
            });
            
            
//             $("#print").jqxButton({ width: 80 });
            
//             $("#print").click(function () {
//                  var gridContent = $("#dataTable").jqxDataTable('exportData', 'html');
//                  var newWindow = window.open('', '', 'width=800, height=500'),
//                  document = newWindow.document.open(),
//                  pageContent =
//                      '<!DOCTYPE html>' +
//                      '<html>' +
//                      '<head>' +
//                      '<meta charset="utf-8" />' +
//                      '<title>jQWidgets DataTable</title>' +
//                      '</head>' +
//                      '<body>' + gridContent + '</body></html>';
//                  document.write(pageContent);
//                  document.close();
//                  newWindow.print();
//              });
            
            
        });
    </script>	
    
</head>

<body class='default'>
 <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">
                   Data Table
                </h3>
                <ol class="breadcrumb">
                    <li><a href="index.jsp">Home</a>
                    </li>
                    <li class="active">Datatable</li>
                </ol>
            </div>
            </div>
        <!-- /.row -->
<div class="row well" style="width:98%; margin-top:20px; margin-left:1%;">
        
          <div class="col-md-2">
             <strong>Upload Excel Sheet:</strong>
         </div><!--/col-md-3--> 
         <div class="col-md-3">
             <span class="btn btn-default btn-file">Browse <input type="file"></span>
         </div><!--/col-md-3-->
<!--          <div class="col-md-1"></div> -->
         <div class="col-md-2">
            <button type="button" class="btn btn-default"  style="margin-left: 30px; margin-top: 10px;"><span class="glyphicon glyphicon-cloud-upload"> </span> Upload</button>
             </div>
             
         </div><!--/row--> 
<div class="container">
<h3>Clients Data Table </h3>
<div id="dataTable"></div>
<div style='margin-top: 20px;'>
            <div style='float: left;'>
                <input type="button" value="Export to Excel" id='excelExport' />
            </div>
            <div style='margin-left: 10px; float: left;'>
                <input type="button" value="Export to XML" id='xmlExport' />
            </div>
            <div style='margin-left: 10px; float: left;'>
                <input type="button" value="Export to CSV" id='csvExport' />
            </div>
            <div style='margin-left: 10px; float: left;'>
                <input type="button" value="Export to TSV" id='tsvExport' />
            </div>
            <div style='margin-left: 10px; float: left;'>
                <input type="button" value="Export to HTML" id='htmlExport' />
            </div>
            <div style='margin-left: 10px; float: left;'>
                <input type="button" value="Export to JSON" id='jsonExport' />
            </div>
            <div style='margin-left: 10px; float: left;'>
                <input type="button" value="Export to PDF" id='pdfExport' />
            </div>
<!--             <div style='margin-left: 10px; float: left;'> -->
<!--                 <input type="button" value="Print" id='print' /> -->
<!--             </div> -->
</div>
</body>

</html>
