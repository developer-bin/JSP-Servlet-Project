<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<div class="pages">
	<div data-page="login" class="page">
		<div class="navbar navbar-no-color">
			<div class="navbar-inner">
				<div class="left"><a href="#" class="back link"> <i class="icon icon-back"></i></a></div>
				<div class="center">식당추가</div>
				<div class="right">
				<!-- Right link contains only icon - additional "icon-only" class--><a href="#" class="link icon-only open-panel"> <i class="icon icon-bars"></i></a>
				</div>
			</div>
		</div>
		<div class="page-content text-center">
			
			<div class="page-top-cover"></div>
			<div class="text-medium margin-top-15">식당 추가</div>
			<form action="register_restaurant.do" method="post">
				<div class="list-block margin-bottom-40">
				  <ul class="no-border">	
				  	
					<li>
					  <div class="item-content">
						<div class="input-icon item-media"><i class="flaticon-user"></i></div>
						<div class="item-inner no-margin">
						  <div class="item-input">
							<input type="text" class="text-thiny" placeholder="restaurantName" name="restaurantName">
						  </div>
						</div>
						
					  </div>
					</li>
					
					<li>
					  <div class="item-content">
						<div class="input-icon item-media"><i class="flaticon-user"></i></div>
						<div class="item-inner no-margin">
						  <div class="item-input">
							<input type="text" class="text-thiny" placeholder="category" name="category">
						  </div>
						</div>
						
					  </div>
					</li>
					
					<li>
					  <div class="item-content">
						<div class="input-icon item-media"><i class="flaticon-user"></i></div>
						<div class="item-inner no-margin">
						  <div class="item-input">
							<input type="text" class="text-thiny" placeholder="businessNumber" name="businessNumber">
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
</body> 
</html>