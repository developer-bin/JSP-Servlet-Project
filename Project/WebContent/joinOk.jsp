<%@page import="java.sql.Timestamp"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="dto.MemberDto"/>
<jsp:setProperty name="dto" property="*" />
<%
		if(dto.getBusinessNumber()==null)
			dto.setBusinessNumber("-1");
		if(dto.getrestaurantName()==null)
			dto.setrestaurantName("-1");
		dto.setrDate(new Timestamp(System.currentTimeMillis()));
		MemberDao dao = MemberDao.getInstance();
		if(dao.confirmId(dto.getId()) == MemberDao.MEMBER_EXISTENT) {
%>
		<script language="javascript">
			alert("아이디가 이미 존재 합니다.");
			history.back();
		</script>
<%
		} else {
			int ri = dao.insertMember(dto);
			if(ri == MemberDao.MEMBER_JOIN_SUCCESS) {
				//session.setAttribute("id", dto.getId());			
%>				
			<script language="javascript">
				alert("회원가입을 축하 합니다.");
				document.location.href="index.html";
			</script>
<%
			} else {
%>
			<script language="javascript">
				alert("회원가입에 실패했습니다.");
				document.location.href="index.html";
			</script>
<%
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