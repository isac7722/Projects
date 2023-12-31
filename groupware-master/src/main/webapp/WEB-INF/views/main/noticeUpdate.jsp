<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.groupware.dto.NoticeDTO" %>
<%
	Calendar cal = Calendar.getInstance();
	
	int year = cal.get(Calendar.YEAR);
	int mon = cal.get(Calendar.MONTH)+1;
	int day = cal.get(Calendar.DAY_OF_MONTH);
	
	NoticeDTO dto = (NoticeDTO)request.getAttribute("noticeDoc");
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

  <title>Form Validation | Creative - Bootstrap 3 Responsive Admin Template</title>

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
  
  <script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	
	<style type="text/css">
	#member_info{
		line-height: 31px;
		text-align: center;
	}
	label {
		font-weight: 900;
	}
	</style>
	<script>
		function formSubmit() {
			oEditors.getById["Seditor"].exec("UPDATE_CONTENTS_FIELD", []);	
			$("#feedback_form").submit();
		};
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
            <h3 class="page-header"><i class="fa fa-files-o"></i>공지사항 작성</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="index.html">메인</a></li>
              <li><i class="icon_document_alt"></i>공지사항</li>
              <li><i class="fa fa-files-o"></i>글쓰기</li>
            </ol>
          </div>
        </div>
        <!-- Form validations -->
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                	<%=dto.getNum() %>
              </header>
              <div class="panel-body">
                <div class="form">
                  <form class="form-validate form-horizontal" id="feedback_form" method="post" action="noticeUpdateAction">
                    <div class="form-group ">
                      <label for="cname" class="control-label col-lg-1">제목</label>
                      <div class="col-lg-10">
                        <input class="form-control" id="cname" name="title" type="text" value="<%=dto.getTitle()%>"required />
                      	<input type="hidden" name="num" value="<%=dto.getNum()%>">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="cname" class="control-label col-lg-1">이름</label>
                      <div class="col-lg-2" id="member_info">
                         <%=dto.getMemberDto().get(0).getName()%>
                      </div>
                      <label for="cname" class="control-label col-lg-1">부서</label>
                      <div class="col-lg-2" id="member_info">
                         <%=dto.getDeptDto().get(0).getDept_name() %>	
                      </div>
                      <label for="cname" class="control-label col-lg-1">직급</label>
                      <div class="col-lg-2" id="member_info">
                         <%=dto.getRankDto().get(0).getRank_name() %>	
                      </div>
                    </div>
                    <div class="form-group ">
                      <label for="cname" class="control-label col-lg-1">수정일</label>
                      <div class="col-lg-2" id="member_info">
                         <%=year%>-<%=mon%>-<%=day%>
                      </div>
                    </div>
                    <div class="form-group ">
                      <label for="cname" class="control-label col-lg-1">첨부파일</label>
                      <div class="col-lg-10">
                        <input class="form-control" id="cname" name="file" type="text" required />
                      </div>
                    </div>
                    <div class="form-group ">
                      <label for="ccomment" class="control-label col-lg-1">내용</label>
                      <div class="col-lg-10">
                        <textarea class="form-control" id = "Seditor" name="content" 
                        style = "height:500px; resize:none; display:none;" required><%=dto.getContent()%></textarea>
	                        <script>
		                        var oEditors = [];
		                        
		                        nhn.husky.EZCreator.createInIFrame({
		                        	oAppRef: oEditors,
		                        	elPlaceHolder: "Seditor",
		                        	sSkinURI: "resources/smarteditor/SmartEditor2Skin.html",	
		                        	htParams : {
		                        		bUseToolbar : true,		
		                        		bUseVerticalResizer : true,	
		                        		bUseModeChanger : true,	
		                        		},
		                        		fCreator: "createSEditor2"
		                        	});
		                        
		                        function setDefaultFont() {
		                        	var sDefaultFont = '궁서';
		                        	var nFontSize = 24;
		                        	oEditors.getById["Seditor"].setDefaultFont(sDefaultFont, nFontSize);
		                     	   }
								</script>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-lg-offset-2 col-lg-10">
                        <button class="btn btn-primary" type="button"
                        	style = "margin-left:33%; width :100px;" onclick="formSubmit();">수정</button>
                      </div>
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
  <!-- container section end -->

  <!-- javascripts -->
  <script src="resources/origin/js/jquery.js"></script>
  <script src="resources/origin/js/bootstrap.min.js"></script>
  <!-- nice scroll -->
  <script src="resources/origin/js/jquery.scrollTo.min.js"></script>
  <script src="resources/origin/js/jquery.nicescroll.js" type="text/javascript"></script>
  <!-- jquery validate js -->
  <script type="text/javascript" src="resources/origin/js/jquery.validate.min.js"></script>

  <!--custome script for all page-->
  <script src="resources/origin/js/scripts.js"></script>


</body>

</html>
