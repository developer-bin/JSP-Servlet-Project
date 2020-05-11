<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.File" %>
 <%@ page import="java.util.ArrayList"%>
 <%@page import="dto.RestaurantDto"%>
<%@page import="dao.RestaurantDao"%>
 <%request.setCharacterEncoding("UTF-8");%>
<div class="pages">
    <div data-page="restaurants" class="page navbar-fixed toolbar-fixed">
        <div class="navbar">
            <div class="navbar-inner">
                <div class="left">
                    <a href="#" class="back link"> <i class="icon icon-back"></i></a>
                </div>
                <div class="center">Restaurants</div>
                <div class="right">
                    <!-- Right link contains only icon - additional "icon-only" class-->
                    <a href="#" class="link icon-only open-panel"> <i class="icon icon-bars"></i></a>
                </div>
            </div>
        </div>

        <div class="toolbar tabbar">
            <div class="toolbar-inner">
                <a href="#tab-1" class="tab-link active">List</a>
                <a href="#tab-2" class="tab-link">Grid</a>
            </div>
        </div>

        <!-- Toolbar has additional "toolbar-bottom" class -->
        <div class="tabs-animated-wrap">
            <div class="tabs">
			
				<!-- TAB LIST -->
                <div id="tab-1" class="page-content tab active">
                    <div class="content-block">
                        <div id="list-restaurants">
                        
                        
                        <%
											String path = request.getRealPath("restaurantFolder");	//패스바꾸기
											File file=new File(path);
											String[] fileList= file.list();
											RestaurantDao dao=new RestaurantDao();
											ArrayList<RestaurantDto> dtos=dao.lists();
											
											
											
											for(int i=0; i<dtos.size();i++){	
												String imgPath="img\\photos\\food.jpg";
												RestaurantDto dto=dtos.get(i);
												
												for(int j=0;j<fileList.length;j++){
													int idx=fileList[j].indexOf(".");
													String resName=fileList[j].substring(0,idx);
													if(resName.equals(dto.getRestaurantName()))
														imgPath=path+"\\"+fileList[j];
												}
												
												
						 %>						
                            <div class="restaurant">
                                <div class="row">
                                    <div class="col-100">
                                        <div class="restaurant-img">
												<img src="<%=imgPath%>" alt="restaurant" width="300" height="100">
									
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-50">                            
                                        <h6><%=dto.getRestaurantName()%></h6>
                                        <div class="gray-text text-thiny"><a href="food-categories.jsp?categories=<%=dto.getCategory()%>"><%=dto.getCategory()%></a></div>
                                    </div>
                                    <div class="col-50">
                                        <a href="restaurant-single.jsp?businessNumber=<%=dto.getBusinessNumber()%>" class="button button-fill color-deeporange text-extrat-thiny">식당 선택</a>
                                    </div>
                                </div>
                            </div>												
												
												
												
<%
											}
%>
                                       

                        </div>
                    </div>
                </div>
				<!-- TAB LIST -->
				
				
				<!-- TAB GRID -->
				<div id="tab-2" class="page-content tab">
					<div class="content-block">
						<div class="row">
						
						<%
											
						for(int i=0; i<dtos.size();i++){	
							String imgPath="img\\photos\\food.jpg";
							RestaurantDto dto=dtos.get(i);
							
							for(int j=0;j<fileList.length;j++){
								int idx=fileList[j].indexOf(".");
								String resName=fileList[j].substring(0,idx);
								if(resName.equals(dto.getRestaurantName()))
									imgPath=path+"\\"+fileList[j];
							}						
                        %>
							<div class="col-50">
								<div class="restaurant-grid">
									<img src="<%=imgPath%>" alt="restaurant" width="300" height="100">
									
									<h6><%=dto.getRestaurantName()%></h6>
									<div class="gray-text text-thiny margin-bottom-10"><a href="food-categories.jsp?categories=<%=dto.getCategory()%>"><%=dto.getCategory()%></a></div>
									<a href="restaurant-single.jsp?businessNumber=<%=dto.getBusinessNumber()%>" class="button button-fill color-deeporange text-extrat-thiny">식당 선택</a>
								</div>
							</div>
							
							<%
							} 
							%>
							
							
							
						</div>
					</div>
				</div>
				<!-- TAB GRID -->
				
            </div>
        </div>
        <!-- TAB -->

    </div>
</div>