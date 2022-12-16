<%@page import="com.entities.*"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp" %>

</head>
<body>
<%@include file="navbar.jsp" %>
  <h1>Edit your Notes</h1>
  <br> 
  <%
  int id=Integer.parseInt(request.getParameter("note_id"));
  
  Session s=FactoryProvider.getFactory().openSession();
  Note n=s.get(Note.class,id);
  
  
  
  %>

<form action="UpdateServlet" method="post">

<input value="<%=n.getId() %>" name="note_id" type="hidden">


  <div class="mb-3">
    <label 
    for="title" 
    class="form-label">Note Title</label>
    
    <input 
    name="title"
    required
    type="text" 
    class="form-control" 
    id="title" 
    value="<%=n.getTitle() %>"
    placeholder="Enter here">
   
  </div>
  
  
  <div class="mb-3">
    <label for="contenet" class="form-label">Note Content</label>
    <textarea name="content" id="content" class="form-control" placeholder="Enter your content here" style="height:300px;" required><%=n.getContent() %></textarea>
  </div>
<div class="container text-center">

<button type="submit" class="btn btn-success">Save Your Note</button>
  
</div>
  
</form>




</body>
</html>