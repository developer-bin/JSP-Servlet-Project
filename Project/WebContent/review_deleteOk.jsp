<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>    
    
 <%request.setCharacterEncoding("UTF-8");%>

<%

String businessNumber=request.getParameter("businessNum"); 
%>
    
<div class="pages">
	<div data-page="login" class="page">
		<div class="navbar navbar-no-color">
			<div class="navbar-inner">
				<div class="left"><a href="#" class="back link"> <i class="icon icon-back"></i></a></div>
				<div class="center">게시판 글삭제</div>
				<div class="right">
				<!-- Right link contains only icon - additional "icon-only" class--><a href="#" class="link icon-only open-panel"> <i class="icon icon-bars"></i></a>
				</div>
			</div>
		</div>
		<div class="page-content text-center">
			
			<div class="page-top-cover"></div>
			<div class="text-medium margin-top-15">게시판 글삭제</div>
			<form action="review_delete.do" method="post">
				<div class="list-block margin-bottom-40">
				  <ul class="no-border">	
				  	
				  	<li>
						  <div class="item-input">
							<input type="hidden" value="<%=businessNumber %>" name="businessNumber">
						  </div>
					</li>
					</ul>
				</div>
				<div class="row">
					<div class="col-50">
						<input type="submit" class="button button-fill color-black text-thiny" value="삭제확인">
					</div>
					<div class="col-50">
						<a href="restaurant-single.jsp?businessnumber=<%=businessNumber %>" class="button button-fill color-black text-thiny">삭제취소</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

</body> 
</html>