<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.smhrd.model.MavenMemer"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  <a href="join.html"><button>회원가입</button></a>
	<a href="login.html"><button>로그인</button></a>
-->
	<%
	MavenMemer member = (MavenMemer) session.getAttribute("member");
	%>

	<%
	if (member == null) {
	%>
	<a href="join.html">
		<button>회원가입</button>
	</a>
	<a href="login.html">
		<button>로그인</button>
	</a>
	<%
	} else {
	%>
	<%=member.getNickname()%>
	<br>
	<a href="logoutController">
		<button>로그아웃</button>
	</a>
	<%
	}
	%>

	<c:choose>
		<c:when test="${empty member}">
			<a href="join.html">
				<button>회원가입</button>
			</a>
			<a href="login.html">
				<button>로그인</button>
			</a>
		</c:when>

		<c:otherwise>
			<%=member.getNickname()%>
			<a href="logoutController">
				<button>로그아웃</button>
			</a>

		</c:otherwise>


	</c:choose>


</body>
</html>