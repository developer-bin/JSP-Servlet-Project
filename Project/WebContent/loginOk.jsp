<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<%
	MemberDao dao = MemberDao.getInstance();
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	MemberDto businessDto = dao.getMember(id);
	int checkNum = dao.userCheck(id, pw);
	
	if(checkNum == -1) {
%>
		<script language="javascript">
			alert("아이디가 존재하지 않습니다.");
			history.go(-1);
		</script>
<%
	} else if(checkNum == 0) {
%>
		<script language="javascript">
			alert("비밀번호가 틀립니다.");
			history.go(-1);
		</script>
<%
	} else if(checkNum == 1) {
		MemberDto dto = dao.getMember(id);
		if(dto == null) {
%>
		<script language="javascript">
			alert("존재하지 않는 회원 입니다.");
			history.go(-1);
		</script>
<%
		} else {
			
			String restaurantName=businessDto.getrestaurantName();
			String businessNumber=businessDto.getBusinessNumber();
			String name = dto.getName();
			
			MenuDao menuDao=MenuDao.getInstance();
			int muNum=menuDao.MenuCnt(businessNumber);
			String mmNum=String.valueOf(muNum);
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("restaurantName",restaurantName);
			session.setAttribute("businessNumber",businessNumber);
			session.setAttribute("ValidMem", "yes");
			session.setAttribute("mNum",mmNum);
			response.sendRedirect("index.jsp");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>