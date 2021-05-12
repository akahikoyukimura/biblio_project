<%@page import="com.util.db.BookManager"%>
<%@page import="com.util.db.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.util.db.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.js"></script>
</head>
<body>

<!-- declaration -->	
<%
Student s = (Student)session.getAttribute("student");
BookManager bm = new BookManager();
%>

<!-- role -->
<%
if(request.getParameter("op")!=null)
{
	if(request.getParameter("op").equals("delete"))
	{
		int id = Integer.parseInt(request.getParameter("id"));
		bm.returnBookToBiblio(id);
	}	
}
%>
	<jsp:include page="navBar.jsp"></jsp:include>
	
	<!-- la liste des livres enprunter dans la bibliotheque -->
	<%
	int id = s.getId();
	List<Book> ab = bm.allStudentBooks(id);
	%>
	
	<div class="Container m-5">
		<h4>Salut <%=s.getLogin().toUpperCase()%></h4>
		<p>voici les livres que vous avez emprunte</p><hr>
		
		<div class="row ">
		
			<%for (Book b : ab) {%>
			<div class="col-12 mt-3">
				<div class="card">
					<div class="card-header">
						<div class="row justify-content-between">
							<div class="col-6">
								<h5>Livre de <%=b.getName()%></h5>
							</div>
						</div>
					</div>
					<div class="card-body">
						<p class="card-text ">
							<b>Categorie : </b><%=b.getCategorie()%>
						</p>
						<p class="card-text ">
							<b>Auteur : </b><%=b.getAuthor()%>
							
						</p>
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<a href="?op=delete&id=<%= b.getId()%>" class="btn btn-warning px-4 py-2">rendre à la bibliotheque</a>
							</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>


</body>
</html>