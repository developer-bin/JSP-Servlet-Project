<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("UTF-8");%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%
   
  String businessNumber=request.getParameter("businessNum");
  String menuNumber=request.getParameter("menunu");
   

	String path = request.getRealPath("menuFolder");	//패스바꾸기
	File file=new File(path);
	String[] fileList= file.list();	
	MenuDao Mdao=MenuDao.getInstance();
	ArrayList<MenuDto> dtos=Mdao.lists();
	String imgPath="img\\photos\\food.jpg";
	MenuDto MenuDto=Mdao.MenuCheck(businessNumber, menuNumber);
		

		for(int j=0; j<fileList.length;j++){
			int idx=fileList[j].indexOf("_");
			String resName=fileList[j].substring(0,idx);
			String name2=fileList[j].substring(idx+1);
			int idx2=name2.indexOf(".");
			String menuName=name2.substring(0,idx2);
			if(resName.equals(MenuDto.getRestaurantName())){
				if(menuName.equals(MenuDto.getmenuName())){
					imgPath=path+"\\"+fileList[j];
					break;
				}
			}
		}
	
	
	
	
%>

   <div class="pages">
   <div data-page="restaurant-search" class="page">

      <div class="page-content text-center margin-top-30">
         <div class="text-center back-close-icon"><a href="#" class="back link"><i class="flaticon-close"></i></a></div>
         <div class="content-block">
         
            
            <div class="text-center margin-bottom-15"><img src="<%=imgPath %>" width="150"></div></div>
            <div class="text-medium margin-bottom-15"><%=MenuDto.getmenuName() %></div>            
            <div class="gray-text text-thiny"> <%=MenuDto.getmenuText() %> </div>
            <div class="text-medium margin-bottom-15"><%=MenuDto.getmenuPrice() %></div> 
            
           <form action="menu_cart.do" method="post">
           
            <div class="text-medium margin-bottom-15">수량 
            
            
             <select name="menuCount">
            
            
            
               <%
                  for(int i=1; i<11; i++)   {
               %>
                <option value=<%=i%>><%=i%></option>
                     <%
                        }
                     %>
                  </select> </div>   
               <div class="text-medium margin-bottom-15"></div> 
               
               
               <div class="row">

                     
                  <div class="col-50">
                       
                       <input type="hidden" name="restaurantName" value="<%=MenuDto.getRestaurantName() %>">
                       <input type="hidden" name="businessNumber" value="<%=MenuDto.getbusinessNumber() %>">
                       <input type="hidden" name="menuName" value="<%=MenuDto.getmenuName() %>">
                       <input type="hidden" name="menuText" value="<%=MenuDto.getmenuText() %>">
                       <input type="hidden" name="menuPrice" value="<%=MenuDto.getmenuPrice() %>">
                       <input type="hidden" name="menuNumber" value="<%=MenuDto.getMenuNumber() %>">
                     <input type = "submit" class="button button-fill color-deeporange text-thiny" value = "장바구니 담기">
                     </div>
                   
                   
                   
                     
                     </form>
                  <div class="col-50">
                     <a href="reservation-form.jsp" class="button button-fill color-deeporange text-thiny">예약하기</a>
               
 
                  </div>
               </div>
            
         </div>
      </div>


</form>
   
</body>
</html>