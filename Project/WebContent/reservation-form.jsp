<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%>
<%
String businessNumber = request.getParameter("businessNum");
%>
<div class="pages">
	<div data-page="reservation" class="page">
		<div class="navbar navbar-no-color">
			<div class="navbar-inner">
				<div class="left"><a href="#" class="back link"> <i class="icon icon-back"></i></a></div>
				<div class="center">reservation</div>
				<div class="right">
				<!-- Right link contains only icon - additional "icon-only" class--><a href="#" class="link icon-only open-panel"> <i class="icon icon-bars"></i></a>
				</div>
			</div>
		</div>
		<div class="page-content text-center">
			
			<div class="page-top-cover reservation-cover"></div>
			<div class="text-medium margin-top-15">reservation</div>
			<form action="reservation.do" method="post">
				<div class="list-block margin-bottom-40 booking-form">
				  <ul class="no-border">
					
					
					<li>
						  <div class="item-input">
							<input type="hidden" value="<%=businessNumber %>" name="businessNumber">
						  </div>
					</li>
					
					
					
					<li>
					  <div class="item-content">
						<div class="input-icon item-media"><i class="flaticon-email"></i></div>
						<div class="item-inner no-margin">
						  <div class="item-input">
							<input type="text" class="text-thiny" placeholder="E-mail*" name="userMail">
						  </div>
						</div>
						
					  </div>
					</li>
					<li>
					  <div class="item-content">
						<div class="input-icon item-media"><i class="flaticon-phone"></i></div>
						<div class="item-inner no-margin">
						  <div class="item-input">
							<input type="text" class="text-thiny" placeholder="Your Phone*" name="userPhone">
						  </div>
						</div>
					  </div>
					</li>
					
					<li>
					  <div class="item-content">
						<div class="input-icon item-media"><i class="flaticon-date"></i></div>
						<div class="item-inner no-margin">
						  <div class="item-input">
							<input type="text" class="text-thiny" placeholder="Date*" id="calendar-default" name="userDate">
						  </div>
						</div>
						
					  </div>
					</li>
					<li>
					  <div class="item-content">
						<div class="input-icon item-media"><i class="flaticon-time"></i></div>
						<div class="item-inner no-margin">
						  <div class="item-input">
							<input type="text" class="text-thiny" placeholder="Time*" id="picker-time" name="userTime">
						  </div>
						</div>
						
					  </div>
					</li>
					<li>
					  <div class="item-content">
						<div class="input-icon item-media"><i class="flaticon-people"></i></div>
						<div class="item-inner no-margin">
						  <div class="item-input">
							<input type="text" class="text-thiny" placeholder="Sits*" name="userSit">
						  </div>
						</div>
						
					  </div>
					</li>
					</ul>
				</div>
				<div class="margin-bottom-15 content-block">
					<input type="submit" class="button button-fill color-deeporange text-thiny" value="예약하기"></a>
				</div>
			</form>
		</div>
	</div>
</div>