
<%@page import="com.util.db.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.util.db.BookManager"%>
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
	<jsp:include page="navBar.jsp"></jsp:include>
	<!-- declaration -->
	<%
	Student s = (Student) session.getAttribute("student");
	BookManager bm = new BookManager();
	%>
	<!-- supprimer livre -->
	<%
	if (request.getParameter("op") != null) {
		if (request.getParameter("op").equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			bm.deleteBook(id);
		}
	}
	%>
	
		<%if (request.getParameter("res") != null) {
			if (request.getParameter("res").equals("succ")) {%>
		        <div class="d-grid gap-2 d-md-flex justify-content-md-center">
		        <li class="list-group-item list-group-item-success mt-2 col-6 text-center rounded">Livre
			est ajouter avec succee : )</li>
		        </div>
		<%}}%>

	<!-- la liste des livres dans la bibliotheque -->
	<%
	List<Book> ab = bm.allBooks();
	%>

	<div class="Container m-5">
		
		
		<h4>
			Salut <%=s.getLogin().toUpperCase()%>
		</h4>
		<p>Dans la page gestion des livres</p><hr>
		<div class="row ">
					<div class="d-grid gap-2 mb-3">
						<a href="addBook.jsp" class="btn btn-success">Ajouter un nouveau livre</a>
					</div>
		<hr>
			<%for (Book b : ab) {%>
			<div class="col-12 mt-4">
				<div class="card">
					<div class="card-header">
						<div class="row justify-content-between">
							<div class="col-4">
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
								<a href="?op=delete&id=<%=b.getId()%>"
									class="btn btn-danger px-4 py-2">Supprimer</a>
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