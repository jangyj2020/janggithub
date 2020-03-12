<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Spring Web Project</title>

  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- MetisMenu CSS -->
  <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    
  <!-- DataTables CSS -->
  <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

  <!-- DataTables Responsive CSS -->
  <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
  
  <!-- Custom CSS -->
  <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/dist/css/one-page-wonder.min.css" rel="stylesheet">

</head>

<body>

  

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="http://localhost:8008">Main</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
            
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                    	<sec:authorize access="isAuthenticated()">
                        <li><a href="/member/get"><i class="fa fa-user fa-fw"></i>내정보</a></li>
                        </sec:authorize>
                         
                        <!-- <li class="divider"></li> -->
                        <sec:authorize access="isAuthenticated()">
                        
                        <li><a href="/customLogout"><i class="fa fa-sign-out fa-fw"></i>로그아웃</a></li>
                        </sec:authorize>
                        
                        <sec:authorize access="isAnonymous()">
                        
                        <li><a href="/customLogin"><i class="fa fa-sign-out fa-fw"></i>로그인</a></li>
                        </sec:authorize>
                        
                        <li><a href="/member/register"><i class="fa fa-user fa-fw"></i>회원가입</a></li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

 
        </nav>

		<div></div>
        

  <header class="masthead text-center text-white">
    <div class="masthead-content">
      <div class="container">
        <h1 class="masthead-heading mb-0">Spring Web Project</h1>
        <h2 class="masthead-subheading mb-0">CRUD BOARD 소개</h2>
        <a href="/board/list" class="btn btn-primary btn-xl rounded-pill mt-5" style="font-size:1.5em;">게시판 바로가기</a>
      </div>
    </div>
    <div class="bg-circle-1 bg-circle"></div>
    <div class="bg-circle-2 bg-circle"></div>
    <div class="bg-circle-3 bg-circle"></div>
    <div class="bg-circle-4 bg-circle"></div>
  </header>
  
 <section>
    <div class="container">
      <div class="row align-items-center">
          	<h2>Spring Web Security를 이용한 로그인 처리</h2><br>
            <h3 class="display-4">&emsp;1.&emsp;회원가입시 BCryptPasswordEncoder 클래스를 이용한 패스워드 보호</h3>
        <div class="col-lg-6 order-lg-1">
          <div class="p-5">
          </div>
        </div>
      </div>
      <br>
       <div class="row align-items-center">
        <div class="col-lg-6 order-lg-2">
          <div class="p-5">
            <img class="img-fluid rounded-circle" src="/resources/img/join.png" alt="">
          </div>
        </div>
      </div>
     </div>
    
  </section>
  <br>
  <section>
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 order-lg-1">
          <div class="p-5">
            <h3 class="display-4">1.2&emsp;인코딩된 패스워드를 가지는 사용자 추가</h3>
          </div>
        </div>
      </div>
      <br>
       <div class="row align-items-center">
        <div class="col-lg-6 order-lg-2">
          <div class="p-5">
            <img class="img-fluid rounded-circle" src="/resources/img/join2.png" alt="">
          </div>
        </div>
      </div>
     </div>
    
  </section>
  <br>
  <section>
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 order-lg-1">
          <div class="p-5">
            <h3 class="display-4">2.&emsp;데이터베이스를 이용하는 자동 로그인</h3>
          </div>
        </div>
      </div>
      <br>
       <div class="row align-items-center">
        <div class="col-lg-6 order-lg-2">
          <div class="p-5">
            <img class="img-fluid rounded-circle" src="/resources/img/login-remember-me.png" alt="">
          </div>
        </div>
      </div>
     </div>
    
  </section>
<br>
  <section>
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 order-lg-1">
          <div class="p-5">
            <h3 class="display-4">2.2&emsp;로그인 화면에 자동 로그인 설정</h3>
          </div>
        </div>
      </div>
      <br>
       <div class="row align-items-center">
        <div class="col-lg-6 order-lg-2">
          <div class="p-5">
            <img class="img-fluid rounded-circle" src="/resources/img/login-remember-me2.png" alt="">
          </div>
        </div>
      </div>
     </div>
  </section>
  <br>
  <section>
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 order-lg-1">
          <div class="p-5">
            <h3 class="display-4">2.3&emsp;로그아웃시 쿠키 삭제</h3>
          </div>
        </div>
      </div>
      <br>
       <div class="row align-items-center">
        <div class="col-lg-6 order-lg-2">
          <div class="p-5">
            <img class="img-fluid rounded-circle" src="/resources/img/logout2.png" alt="">
          </div>
        </div>
      </div>
     </div>
  </section>


  <!-- Footer -->
  <footer class="py-5 bg-black">
    <div class="container">
      <p class="m-0 text-center text-white small">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>

</html>
