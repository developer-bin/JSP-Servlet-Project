<%@page import="java.sql.Timestamp"%>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
 
<%if(session.getAttribute("ValidMem") == null) { %>
<<jsp:forward page="index.html" />
  
<%
}
 
   String name = (String)session.getAttribute("name");
   String id = (String)session.getAttribute("id");
   String businessNumber = (String)session.getAttribute("businessNumber");
   MemberDao dao = MemberDao.getInstance();
   

%>
 
 
<head>
    <!-- Required meta tags-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
   <meta name="apple-mobile-web-app-status-bar-style" content="black">
   <link rel="apple-touch-icon" href="img/photos/apple-touch-icon.png" />
   <link rel="apple-touch-startup-image" href="img/photos/apple-touch-startup-image-320x460.png" />
   <meta name="mobile-web-app-capable" content="yes">
   <link rel="shortcut icon" sizes="196x196" href="img/photos/196x196.png">
   <link rel="shortcut icon" sizes="128x128" href="img/photos/128x128.png">
    <!-- Color theme for statusbar -->
    <meta name="theme-color" content="#000000">
    <!-- Your app title -->
    <title>예약의민족</title>
   
   <!-- FONTS -->
   <link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet"> 
   <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
   <link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,700' rel='stylesheet' type='text/css'>
    <!-- Path to Framework7 Library CSS, Material Theme -->
    <link rel="stylesheet" href="css/framework7.material.min.css">
    <!-- Path to Framework7 color related styles, Material Theme -->
    <link rel="stylesheet" href="css/framework7.material.colors.min.css">
   <!-- Slick Carousel -->
   <link rel="stylesheet" type="text/css" href="css/slick.css"/>
   <link rel="stylesheet" type="text/css" href="css/slick-theme.css"/>
    <!-- Path to your custom app styles-->
    <link rel="stylesheet" href="fonts/flaticon.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/my-app.css">
</head>
 
<body class="theme-black">
    <!-- Status bar overlay for fullscreen mode-->
    <div class="statusbar-overlay"></div>
    <!-- Panels overlay-->
    <div class="panel-overlay"></div>
    <!-- Left panel with reveal effect-->
    <div id="left-menu" class="panel panel-left panel-reveal">
      <div class="content-block">
         <div class="left-menu-profile text-center">
         
      
         </div>
        </div>
      <!-- Menu items -->
      <div class="list-block list-menu">
         <ul>
         <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-house-outline"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="index.jsp">Home</a>
                     </div>
                  </div>
               </div>
            </li>
         
         
<%      //루트계정일때는
      if(id.equals("root")){
         
%>
         
         
            <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-house-outline"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="register_restaurant.jsp">Add restaurant</a>
                     </div>
                  </div>
               </div>
            </li>
             <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-house-outline"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="restaurants.jsp">all restaurant list</a>
                     </div>
                  </div>
               </div>
            </li>
         
<%
      }
%>
         
         
<%
      if(MemberDao.MEMBER_OWNER_IS_SUCCESS==dao.businessNumberCheck(id)){      //점주만
         
         
%>
 
         <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-house-outline"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="fileForm.html">Restaurant image upload</a>
                     </div>
                  </div>
               </div>
            </li>
 
 
 
 
            <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-house-outline"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="my_restaurant.jsp?businessNumber=<%=businessNumber%>">View my restaurant</a>
                     </div>
                  </div>
               </div>
            </li>
            
            <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-house-outline"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="menufileForm.html">Menu image upload</a>
                     </div>
                  </div>
               </div>
            </li>
         
            <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-house-outline"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="mymenu.jsp">View menu</a>
                     </div>
                  </div>
               </div>
            </li>
            
            
            <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-house-outline"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="restaurant_map.jsp">Restaurant map upload</a>
                     </div>
                  </div>
               </div>
            </li>
            
            <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-house-outline"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="reservation_view.jsp">Reservation check</a>
                     </div>
                  </div>
               </div>
            </li>
<%
      }
         
%>
            
            <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-how"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="walkthrough.html" class="close-panel no-animation">Notice</a>
                     </div>
                  </div>
               </div>
            </li>
            
            
            <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-list"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="food_categories.jsp" class="close-panel no-animation">Categories</a>
                     </div>
                  </div>
               </div>
            </li>
            
            <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-search"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="restaurant-search.html" class="close-panel no-animation">Restaurant search</a>
                     </div>
                  </div>
               </div>
            </li>
            
         
            
            <%if(MemberDao.MEMBER_USER_IS_SUCCESS==dao.businessNumberCheck(id)){    %>
            
            <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-cooker"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="reservation_user.jsp" class="close-panel no-animation">my reservation</a>
                     </div>
                  </div>
               </div>
            </li>
            
            <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-cooker"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="cart_view.jsp" class="close-panel no-animation">my cart</a>
                     </div>
                  </div>
               </div>
            </li>
            
            <%} %>
            <li>
               <div class="item-content">
                  <div class="item-media">
                     <i class="flaticon-power-button"></i>
                  </div>
                  <div class="item-inner no-margin">
                     <div class="item-title text-small">
                        <a href="logout.jsp">Logout</a>
                     </div>
                  </div>
               </div>
            </li>
            
            
            
            
            
            
            
            
            
            
         </ul>
      </div>
      <!-- Menu items -->
    </div>
   
 
    <!-- Views -->
    <div class="views">
        <!-- Your main view, should have "view-main" class -->
        <div class="view view-main">
            <!-- Pages container, because we use fixed navbar and toolbar, it has additional appropriate classes-->
            <div class="pages">
                <!-- Page, "data-page" contains page name -->
                <div data-page="index" class="page">
 
                    <!-- Scrollable page content -->
                    <div class="page-content" id="app-cover">
                  <div class="pull-right">
                     <a href="#" class="link icon-only open-panel"><i class="icon icon-bars"></i></a>
                  </div>
                  <div class="clearfix"></div>
                        <div class="app-cover-content">
                            <div class="margin-bottom-60"><img src="img/photos/loog.png" alt="Carlitos"/></div>
                     <div class="text-medium margin-bottom-15">
                        예약의 민족
                     </div>
                     <div class="row">
                        <div class="col-100">
                           <a href="logout.jsp" class="button button-fill color-white black-text text-thiny">로그아웃</a>
                        </div>
                     </div>
                     <div class="row offset-top-10 margin-bottom-10">
                        <div class="col-100">
                           <a href="walkthrough.html" class="button button-fill color-deeporange white-text text-thiny">
                              
                           </a>
                        </div>
                     </div>
                     
                        </div>
                    </div>
 
                </div>
            </div>
        </div>
    </div>
   <!-- Jquery-->
   <script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
   <!-- Slick Carousel -->
   <script type="text/javascript" src="js/slick.min.js"></script>
    <!-- Path to Framework7 Library JS-->
    <script type="text/javascript" src="js/framework7.min.js"></script>
    <!-- Path to your app js-->
    <script type="text/javascript" src="js/my-app.js"></script>
</body>
 
</html>