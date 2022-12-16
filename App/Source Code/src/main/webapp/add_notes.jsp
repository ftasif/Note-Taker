<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes Page</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>

<div class="container">  


<%@include file="navbar.jsp" %>
<h1>Please Fill your Note Details</h1>


<!-- Form -->

<form action="SaveNoteServlet" method="post">
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
    placeholder="Enter here">
   
  </div>
  
  
  <div class="mb-3">
    <label for="contenet" class="form-label">Note Content</label>
    <textarea name="content" id="content" class="form-control" placeholder="Enter your content here" style="height:300px;" required></textarea>
  </div>
<div class="container text-center">

<a href="index.jsp" class="btn btn-primary">Back</a>
<button type="submit" class="btn btn-success">Add</button>
  
</div>
  
</form>

</div>

</body>
</html>