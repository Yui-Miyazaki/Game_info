<%@page import="model.entity.PostBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%List<PostBean> postList = (List) session.getAttribute("postList");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員追加画面</title>
</head>
<body>
<h1>従業員追加画面</h1>
<form action="employeeAdd" method="post">
    氏名
    <input type="text" name="name">
    年齢
    <select name="age">
    <%for(int i = 18;i <= 60;i++) {%>
    <option>
    <%=i %>
    </option>
    <%} %>
    </select>
    <select name="postCode">
    <%for(PostBean post : postList){ %>
    <option value=<%=post.getPostCode()%>>
    <%=post.getPostName()%>
    </option>
    <%} %>
    </select>
    <input type="submit" value="登録">
</form>
<form action="employeeList" method="get">
<input type="submit" value="従業員一覧へ">
</form>
</body>
</html>