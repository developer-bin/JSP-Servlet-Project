<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%>


<%

String businessNumber=request.getParameter("businessNum"); 
String userId=(String)session.getAttribute("id");
if(userId == null){
	
	%>
	<script language="javascript">
				alert("로그인 하세요!");
				document.location.href="index.jsp";
		</script>
	<%
}
%>
    
<div class="pages">
	<div data-page="login" class="page">
		<div class="navbar navbar-no-color">
			<div class="navbar-inner">
				<div class="left"><a href="#" class="back link"> <i class="icon icon-back"></i></a></div>
				<div class="center">게시판 글쓰기</div>
				<div class="right">
				<!-- Right link contains only icon - additional "icon-only" class--><a href="#" class="link icon-only open-panel"> <i class="icon icon-bars"></i></a>
				</div>
			</div>
		</div>
		<div class="page-content text-center">
			
			<div class="page-top-cover"></div>
			<div class="text-medium margin-top-15">게시판 글쓰기</div>
			<form action="review_write.do" method="post">
				<div class="list-block margin-bottom-40">
				  <ul class="no-border">	
				  	
				  	<li>
						  <div class="item-input">
							<input type="hidden" value="<%=businessNumber %>" name="businessNumber">
						  </div>
					</li>
				  	
				  	
				  	
				  	
				  	
				  	
					
					<li>
					  <div class="item-content">
						<div class="input-icon item-media"><i class="flaticon-user"></i></div>
						<div class="item-inner no-margin">
						  <div class="item-input">
							<input type="text" class="text-thiny" placeholder="별점을입력하세요 (1~5점)" name="starCount">
						  </div>
						</div>
						
					  </div>
					</li>
					
					<li>
					  <div class="item-content">
						<div class="input-icon item-media"><i class="flaticon-user"></i></div>
						<div class="item-inner no-margin">
						  <div class="item-input">
							<input type="text" class="text-thiny" placeholder="리뷰를 입력하세요" name="reviewText">
						  </div>
						</div>
						
					  </div>
					</li>

				
					</ul>
				</div>


				<div>
				<input type="submit" class="button button-fill color-black text-thiny" value="입력">
				</div>

				

			</form>
		</div>
	</div>
</div>

