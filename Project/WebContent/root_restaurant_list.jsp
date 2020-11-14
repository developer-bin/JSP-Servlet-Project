<%@page import="dto.MenuDto"%>
<%@page import="dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>    
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList"%>

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
<body>

<div class="pages">
    <div data-page="detail-restaurant" class="page navbar-fixed">
						<div class="list-block media-list margin-top-15">
							<ul>
							 <%
											String path = request.getRealPath("menuFolder");	//패스바꾸기
											File file=new File(path);
											String[] fileList= file.list();	
											MenuDao dao=MenuDao.getInstance();
											ArrayList<MenuDto> dtos=dao.lists();
											String sessionbusinessNumber=(String)session.getAttribute("businessNumber");
											
											if(sessionbusinessNumber==null){
												%>
												<script language="javascript">
													document.location.href="index.html";
												</script>
												
												<%
											}
											
											for(int i=0;i<dtos.size();i++){
												String imgPath="img\\photos\\food.jpg";
												MenuDto dto=dtos.get(i);
												if(!dto.getbusinessNumber().equals(sessionbusinessNumber))
													continue;
							 %>
								<li>
									<a href="#" class="item-link item-content">
									<%
										for(int j=0; j<fileList.length;j++){
											int idx=fileList[j].indexOf("_");
											String resName=fileList[j].substring(0,idx);
											String name2=fileList[j].substring(idx+1);
											int idx2=name2.indexOf("_");
											String category=name2.substring(0,idx2);
											String name3=name2.substring(idx2+1);
											int idx3=name3.indexOf(".");
											String busNum=name3.substring(0,idx3);
											//out.println(busNum);
											if(busNum.equals(dto.getbusinessNumber())){
												if(resName.equals(dto.getmenuName())){
													imgPath=path+"\\"+fileList[j];
												}
											}
										}
									%>
										<div class="item-media"><img src="<%=imgPath %>" width="80"></div>
										<div class="item-inner">
											<div class="item-title-row">
												<div class="item-title"><%=dto.getmenuName() %></div>
												<div class="item-after link-deeporange"><%=dto.getmenuPrice() %></div>
											</div>
											<div class="item-text"><%=dto.getmenuText() %></div>
										</div>
									</a>
								</li>
								<%
								}
								%>
								
							</ul>
						</div>
               <div class="text-center margin-bottom-15">
					<a href="menu_write.jsp" class="button button-fill color-facebook text-thiny">식당 추가</a>
				</div>
               
               <div class="text-center margin-bottom-15">
					<a href="index.jsp" class="button button-fill color-facebook text-thiny">메인 화면으로</a>
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