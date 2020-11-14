<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="dto.*"%>
<%@page import="dao.*"%>
   
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("UTF-8");%>   
<%
   
		String businessNumber=request.getParameter("businessNumber");
		String businessNumbers=(String)session.getAttribute("businessNumber");
		String id=(String)session.getAttribute("id");
		RestaurantDao dao=new RestaurantDao();
		RestaurantDto dto=dao.getBusinessNumMember(businessNumber);
		MemberDao daos = MemberDao.getInstance();
		
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
    <!-- Status bar overlay for fullscreen mode-->
    <div class="statusbar-overlay"></div>
    <!-- Panels overlay-->
    <div class="panel-overlay"></div>
    
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
      if(MemberDao.MEMBER_OWNER_IS_SUCCESS==daos.businessNumberCheck(id)){      //점주만
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
                        <a href="my_restaurant.jsp?businessNumber=<%=businessNumbers%>">View my restaurant</a>
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
            <%if(MemberDao.MEMBER_USER_IS_SUCCESS==daos.businessNumberCheck(id)){    %>
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
    </div>
     <div class="views">
     <div class="view view-main">
    <div class="pages">
    <div data-page="detail-restaurant" class="page navbar-fixed">
        <div class="navbar">
            <div class="navbar-inner">
                <div class="left">
                    <a href="#" class="back link"> <i class="icon icon-back"></i></a>
                </div>
                <%
                if(dto!=null){
                %>
                <div class="center"><%=dto.getRestaurantName() %></div>
                <%
                } else{
                %>
                <script language="javascript">
									document.location.href="index.html";
				</script>
                <%
                }
                %>
                <div class="right">
                    <!-- Right link contains only icon - additional "icon-only" class-->
                    <a href="#" class="link icon-only open-panel"> <i class="icon icon-bars"></i></a>
                </div>
            </div>
        </div>
        <div class="page-content">
		
			<div class="row">
				<div class="col-100">
					<div class="restaurant-img">
					                        <%
											String path = request.getRealPath("restaurantFolder");	//패스바꾸기
											File file=new File(path);
											String[] fileList= file.list();
											RestaurantDao restaurantdao=new RestaurantDao();
											ArrayList<RestaurantDto> dtos=restaurantdao.lists();
											
											for(int i=0; i<dtos.size();i++){	
												String imgPath="img\\photos\\1.jpg";
												RestaurantDto restaurantdto=dtos.get(i);
												if(!restaurantdto.getBusinessNumber().equals(businessNumber))
													continue;

												for(int j=0;j<fileList.length;j++){
													int idx=fileList[j].indexOf(".");
													String resName=fileList[j].substring(0,idx);
													if(resName.equals(restaurantdto.getRestaurantName()))
														imgPath=path+"\\"+fileList[j];
												}
												
						 %>		
						<img src="<%=imgPath %>" alt="restaurant">
						<%
						}
						%>
					</div>
				</div>
			</div>
			<div class="content-block margin-top-15  margin-bottom-10">
				<a href="reservation-form.jsp?businessNum=<%=businessNumber %>" class="button button-fill color-deeporange text-extrat-thiny">예약</a>
			</div>
            <div class="content-block tabs-menu">
                <!-- Buttons row as tabs controller -->
                <div class="buttons-row">
                    <!-- Link to 1st tab, active -->
                    <a href="#tab1" class="tab-link active button text-extrat-thiny gray-text">식당메뉴</a>
                    <!-- Link to 2nd tab -->
                    <a href="#tab2" class="tab-link button text-extrat-thiny gray-text">식당위치</a>
                    <!-- Link to 3rd tab -->
                    <a href="#tab3" class="tab-link button text-extrat-thiny gray-text">식당리뷰</a>
                </div>
            </div>
            <div class="">
                <div class="tabs">
                    <!-- Tab 1, active by default -->
                    <div id="tab1" class="tab active">
						<div class="list-block media-list margin-top-15">
							<ul>
							<%
							String path2 = request.getRealPath("menuFolder");	//패스바꾸기
							File file2=new File(path2);
							String[] fileList2= file2.list();	
							MenuDao Mdao=MenuDao.getInstance();
							ArrayList<MenuDto> dtos2=Mdao.lists();

							for(int i=0;i<dtos2.size();i++){
								String imgPath="img\\photos\\food.jpg";
								MenuDto Mdto=dtos2.get(i);
								if(!Mdto.getbusinessNumber().equals(businessNumber))
									continue;
								
								for(int j=0; j<fileList2.length;j++){
									int idx=fileList2[j].indexOf("_");
									String resName=fileList2[j].substring(0,idx);
									String name2=fileList2[j].substring(idx+1);
									int idx2=name2.indexOf(".");
									String menuName=name2.substring(0,idx2);
									if(resName.equals(Mdto.getRestaurantName())){
										if(menuName.equals(Mdto.getmenuName())){
											imgPath=path2+"\\"+fileList2[j];
										}
									}
								}
							%>
								<li>
									<a href="detail_menu.jsp?menunu=<%=Mdto.getMenuNumber() %>&businessNum=<%=businessNumber %>" class="item-link item-content">
										<div class="item-media"><img src="<%=imgPath %>" width="80"></div>
										<div class="item-inner">
											<div class="item-title-row">
												<div class="item-title"><%=Mdto.getmenuName() %></div>
												<div class="item-after link-deeporange"><%=Mdto.getmenuPrice() %></div>
											</div>
											<div class="item-text"><%=Mdto.getmenuText() %></div>
										</div>
									</a>
								</li>
								<%
								} 
								%>
							</ul>
						</div>
					<%
					GoogleMapDao googleDao=GoogleMapDao.getInstance();
					GoogleMapDto googleDto=googleDao.getBusinessNumGoogle(businessNumber);
					String googleData=null;
					if(googleDto!=null){
						googleData=googleDto.getGoogledata();
					}
					%>		
                    </div>
                    <!-- Tab 2 -->
                    <div id="tab2" class="tab">
                        <div class="content-block margin-top-15">
                        <%if(googleDto!=null){ %>
                            <iframe src="<%=googleData %>" width="100%" height="200" frameborder="0" style="border:0"></iframe>
                            <p class="text-thiny">
								<%out.print(dto.getRestaurantName()+" 위치입니다."); %>
							</p>
							<%}else{ %>
							<p Class="text-thiny">
							<%out.println("등록된 지도가 없습니다."); %>
							<%} %>
						</div>
                    </div>
                    <!-- Tab 3 -->
                    <div id="tab3" class="tab">
                    <%
                    ReviewDao reviewDao=ReviewDao.getInstance();
                    ArrayList<ReviewDto> reviewDto=reviewDao.list(businessNumber);
                    int reviewCnt=reviewDao.getReviewCount(businessNumber);
                    int averageStar=0;
                    for(int i=0;i<reviewDto.size();i++){
                    	ReviewDto tmpReDto=reviewDto.get(i);
                    	averageStar+=Integer.parseInt(tmpReDto.getStarCount());
                    }
                    if(averageStar==0 && reviewDto.size()==0){
                    	averageStar=0;
                    }else{
                    	averageStar=averageStar/reviewDto.size();
                    }
                    %>
                        <div class="list-block media-list margin-top-15">
							<div class="content-block-title">
								<div class="row">
									<div class="col-50">
										<%=reviewCnt %> Reviews
									</div>
									<div class="col-50">
										<ul class="user-reviews-star no-border pull-right">
										<%
										for(int i=0;i<averageStar;i++){
										%>
										
											<li><i class="flaticon-star yellow-star"></i></li>
										<%
										} 
											
										%>
										</ul>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
							<ul>
							<%
							for(int i=0;i<reviewDto.size();i++){
								ReviewDto ReDto=reviewDto.get(i);
								int ReStar=Integer.parseInt(ReDto.getStarCount());
							%>
								<li>
									<a href="#" class="item-link item-content">
										<div class="item-media"><img src="img/photos/user-1.png" width="60"></div>
										<div class="item-inner">
											<div class="item-title-row">
												<div class="item-title"><%=ReDto.getUserName() %></div>
											</div>
											<div class="item-subtitle">
												<ul class="user-reviews-star">
												<%
												for(int j=0;j<ReStar;j++) {
												%>
													<li><i class="flaticon-star yellow-star"></i></li>
												<%
												}
												%>
												</ul>
											</div>
											<div class="item-text"><%=ReDto.getReviewText() %></div>
										</div>
										<%
										String sessionid=(String)session.getAttribute("id");
										if(sessionid!=null){
											if(sessionid.equals(ReDto.getUserId())){
										%>
										<a href="review_modify_form.jsp?businessNum=<%=businessNumber%>" class="button button-fill color-deeporange text-extrat-thiny">리뷰 수정</a>
										<a href="review_deleteOk.jsp?businessNum=<%=businessNumber %>" class="button button-fill color-deeporange text-extrat-thiny">리뷰 삭제</a>
										<%
											}
										}
										%>
									</a>
								</li>
								<%
							}
								%>
							</ul>
							
							<div class="text-center margin-bottom-15">
							<a href="review_write_form.jsp?businessNum=<%=businessNumber %>" class="button button-fill color-facebook text-thiny">리뷰 추가</a>
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