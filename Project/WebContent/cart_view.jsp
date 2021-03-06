 <%@page import="dao.*"%>
<%@page import="dto.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("UTF-8");%>    
 <%
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
	String businessNumber = (String)session.getAttribute("businessNumber");
	MemberDao dao = MemberDao.getInstance();
	
	if(id==null)
		id="-1";
%>
<!DOCTYPE html>
<html>

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
 <div class="statusbar-overlay"></div>
 <!-- Panels overlay-->
 <div class="panel-overlay"></div>
  <div id="left-menu" class="panel panel-left panel-reveal">
		<div class="content-block">
			<div class="left-menu-profile text-center">
				<div class="row">
					<div class="col-15">
						<a href="#"><i class="flaticon-how"></i></a>
					</div>
					<div class="col-70">
						<input type="text" class="text-thiny" placeholder="Find a restaurant">
					</div>
					<div class="col-15">
						<a href="#"><i class="flaticon-menu"></i></a>
					</div>
				</div>
				<div class="margin-top-30">
					<img src="img/photos/user.png" alt="user" width="80" height="80">
				</div>
				<div class="text-small text-capitalize">
					<%= name %>
				</div>
				<div class="text-extrat-thiny gray-text text-capitalize icon-location">
					<i class="flaticon-location-pin"></i> 한국
				</div>
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
<div data-page="restaurants" class="page navbar-fixed toolbar-fixed">
<div class="views"> 
<div class="view view-main">
 <div class="pages">
    <div data-page="detail-restaurant" class="page navbar-fixed">
       <div class="navbar">
            <div class="navbar-inner">
                <div class="left">  
                </div>
                <div class="center">나의 장바구니</div>
                <div class="right">
                    <!-- Right link contains only icon - additional "icon-only" class-->
                    <%if(id.equals("-1")){ %>
                    <a href="index.html" class="link icon-only open-panel"> <i class="icon icon-bars"></i></a>
                    <%}else{ %>
                    <a href="index.jsp" class="link icon-only open-panel"> <i class="icon icon-bars"></i></a>
                    <%} %>
                </div>
            </div>
        </div>
        
 <div class="tabs-animated-wrap">
  <div class="tabs">
  <div id="tab-1" class="page-content tab active">
            <!-- Tabs, tabs wrapper -->
      <div class="content-block">
      <div id="list-restaurants">
						<div class="list-block media-list margin-top-15">
							<ul>						
							<%
							CartDao cartDao=CartDao.getInstance();
							ArrayList<CartDto> cartDtos=cartDao.list(id);
							
							String path = request.getRealPath("menuFolder");	//패스바꾸기
							File file=new File(path);
							String[] fileList= file.list();	
							
							for(int i=0;i<cartDtos.size();i++){
								CartDto cartDto=cartDtos.get(i);
								String imgPath="img\\photos\\food.jpg";
								for(int j=0; j<fileList.length;j++){
									int idx=fileList[j].indexOf("_");
									String resName=fileList[j].substring(0,idx);
									String name2=fileList[j].substring(idx+1);
									int idx2=name2.indexOf(".");
									String menuName=name2.substring(0,idx2);
									if(resName.equals(cartDto.getRestaurantName())){
										if(menuName.equals(cartDto.getMenuName())){
											imgPath=path+"\\"+fileList[j];
										}
									}
								}
							%>
							
								<li>
									<a href="#" class="item-link item-content">
										<div class="item-media"><img src="<%=imgPath %>" width="80"></div>
										<div class="item-inner">
											<div class="item-title-row">
												<div class="item-title"><%=cartDto.getMenuName() %></div>
												<div class="item-after link-deeporange"><%=cartDto.getMenuPrice() %></div>
											</div>
											<div class="item-text"><%=cartDto.getMenuText() %></div>
										</div>
									</a>
								</li>

								<%} %>
								
							</ul>
						</div>
               
               <div class="text-center margin-bottom-15">
					<a href="index.jsp" class="button button-fill color-facebook text-thiny">메인 화면으로</a>
				</div>
				</div>
				</div>
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