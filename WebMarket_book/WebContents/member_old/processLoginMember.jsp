<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	/* 파라미터로 넘어온 값 얻기, 문자셋 설정 */
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
%>
<%-- 데이터 셋 설정 --%>
<sql:setDataSource var="dataSource" 
	url="jdbc:mysql://localhost:3306/WebMarketDB"
	user="root" password="1234" 
	driver="com.mysql.cj.jdbc.Driver" />

<%-- id, password에 맞는 회원정보를 db에서 추출 --%>
<sql:query dataSource="${dataSource}" var="resultSet">
	select * from member where id=? and password=?
	<sql:param value="<%=id %>" />
	<sql:param value="<%=password %>" />
</sql:query>

<%-- (결과 데이터가 있을 때)출력 결과 처리, session에 id정보 저장 후 결과 페이지로 이동(get방식) --%>
<c:forEach var="row" items="${resultSet.rows}"><%-- rows를 사용하려면 반복문이 필요함 --%>
	<%
		session.setAttribute("sessionId",id);
	%><%-- 아이디와 비밀번호가 일치되는경우는 1개밖에 없으니 일치되면 바로 화면 전환시키는 것 --%>
	<c:redirect url="resultMember.jsp?msg=2"/>
</c:forEach>

<%-- 조회 결과 테이터가 없으면 다시 로그인 페이지로 이동, 이동시 error의 파라미터값을 1로 전달 --%>
<c:redirect url="loginMember.jsp?error=1"/>