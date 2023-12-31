<%@page import="java.util.Calendar"%>
<%@page import="com.groupware.dto.SignDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SignDTO dto = (SignDTO)request.getAttribute("user");

	Calendar cal = Calendar.getInstance();
	
	int year = cal.get(Calendar.YEAR);
	int mon = cal.get(Calendar.MONTH)+1;
	int day = cal.get(Calendar.DAY_OF_MONTH);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
  <link rel="shortcut icon" href="img/favicon.png">

  <title>기안</title>

	<!-- 부트스트랩 기본 템플릿 -->
  <!-- Bootstrap CSS -->
  <link href="resources/origin/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="resources/origin/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="resources/origin/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="resources/origin/css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles -->
  <link href="resources/origin/css/style.css" rel="stylesheet">
  <link href="resources/origin/css/style-responsive.css" rel="stylesheet" />
	
  <!-- container section end -->
  	<!-- 부트스트랩 기본 템플릿 end -->
  	
  	<!-- 템플릿 custom -->
  <!-- ajax -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
  <!-- custom -->
  <link href="resources/css_modify/PaymentA4_basic.css" rel="stylesheet" />
  <script src="resources/custom/js/sign.js" type="text/javascript"></script>
  	<!-- 템플릿 custom end -->

  	<script>
		$(document).ready(function(){
			
			$.ajax({
				type : "GET",
				url : "signPopup",
				dataType : "text",
				success : function(data) {

					var deptname = $('input#deptname').val();

				}
			})
		})
	</script>
</head>

<body>
  <!-- container section start -->
  <section id="container" class="">
    <!--header start-->
    <jsp:include page = "common/header.jsp"/>
    <!--header end-->
    <!--sidebar start-->
    <jsp:include page = "common/sidebar.jsp"/>
    <!--sidebar end-->

    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-files-o"></i> 기안문서 작성</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="">메인</a></li>
              <li><i class="icon_document_alt"></i>결재</li>
              <li><i class="fa fa-files-o"></i>기안문서 작성</li>
            </ol>
          </div>
        </div>
        <!-- Form validations -->
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                기본 결재 양식
              </header>
              <div class="panel-body">
                <div class="form">
                  <form class="form-validate form-horizontal" id="feedback_form" action = "insertSign" method="post">
                    <div class = "main-form">
                    	<div class = "form-title">
                    		<h1 style = "text-align : center;">TEST 결재 양식</h1>
                    		<button class = "path-button" type = "button" onclick="click_signPath();">결재 경로</button>
                    		<button class = "keep-button" type = "button" onclick="click_signPath();">임시 저장</button>
                    		<input class = "add-button" type = "submit" value = "결재 상신">
                    	</div>
                    	<div class = "form-head">
                    		<table class = "gian">
                    			<tr>
                    				<td class = "gian-left">부서</td>
                    				<td class = "gian-right"><%= session.getAttribute("dept_name") %></td>
                    			</tr>
                    			<tr>
                    				<td class = "gian-left">기안자</td>
                    				<td class = "gian-right"><%= session.getAttribute("name") %></td>
                    			</tr>
                    			<tr>
                    				<td class = "gian-left">기안 날짜</td>
                    				<td class = "gian-right"><%=year %>-<%=mon %>-<%=day %></td>
                    			</tr>
                    		</table>
                    		<div class = "sign-zone">        
                    			
                    			<ul id = "sign-add">

								</ul>	
                    			
                    		</div>
                    	</div>
                    	<div class = "form-body">
                    		<table class = "sign-table">
                    			<tr>
                    				<td class= "sign-table-left">문서제목</td>
                    				<td><input class= "sign-table-input1" type = "text" name = "title"></td>
                    			</tr>
                    		</table>
                    		<textarea class= "sign-table-textarea1" name = "content" rows = "35"></textarea>
                    	</div>
                    	<div class = "form-foot">
                    	</div>
                    </div>
                    <div class="form-group">
                      <div class="col-lg-offset-2 col-lg-10">
   
                      </div>
                    </div>
                    
                    		<!-- hidden -->
              		<div id="hidden-sign">
              		</div>
                  
                  </form>
                </div>

              </div>
            </section>
          </div>
        </div>
       
        <!-- page end-->
      </section>
    </section>
    <!--main content end-->
    <div class="text-right">
      <div class="credits">
          <!--
            All the links in the footer should remain intact.
            You can delete the links only if you purchased the pro version.
            Licensing information: https://bootstrapmade.com/license/
            Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
          -->
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
    </div>
  </section>
  <!-- 부트스트랩 기본 템플릿 -->
  <!-- container section end -->

  <!-- javascripts -->
  <script src="resources/origin/js/jquery.js"></script>
  <script src="resources/origin/js/bootstrap.min.js"></script>
  <!-- nice scroll -->
  <script src="resources/origin/js/jquery.scrollTo.min.js"></script>
  <script src="resources/origin/js/jquery.nicescroll.js" type="text/javascript"></script>
  <!-- jquery validate js -->
  <script type="text/javascript" src="resources/origin/js/jquery.validate.min.js"></script>

  <!-- custom form validation script for this page-->
  <script src="resources/origin/js/form-validation-script.js"></script>
  <!--custome script for all page-->
  <script src="resources/origin/js/scripts.js"></script>
	<!--ckeditor-->
  <script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
  <!-- 부트스트랩 기본 템플릿 end -->
</body>

</html>
