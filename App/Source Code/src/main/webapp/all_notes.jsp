<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes : Note Taker</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container">
<%@include file="navbar.jsp" %>
<br>
<h1 class="text-uppercase">All Notes:</h1>
<div class="row">
<div class="col-12">

<%
Session s=FactoryProvider.getFactory().openSession();
Query q=s.createQuery("from Note");
List<Note> list=q.list();
for(Note n:list)
{
%>

<div class="card mt-3 text-center">
  <img src="note.jpg" class="card-img-top m-4 mx-auto" style="width:200px;">
  <div class="card-body px-5">
    <h5 class="card-title"><%=n.getTitle() %></h5>
    <p class="card-text"><%=n.getContent() %></p>
    <label>Added On : </label><p><%=n.getAddedDate().toLocaleString() %></p>
    <div class="container text-center mt-2">
    
    <a href="index.jsp" class="btn btn-primary">Back</a>
    <a href="DeleteServlet?note_id=<%=n.getId() %>" class="btn btn-danger">Delete</a>
    <a href="edit.jsp?note_id=<%=n.getId() %>" class="btn btn-success">Update</a>
    
    
    </div>
  </div>
</div>



<%
}
s.close();
%>

</div>

</div>

</div>
</body>
</html>