
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
	List<Book> ab ;
	%>
	
	<!-- emprunter un livre pour un etudiant -->
	<%
	if (request.getParameter("op") != null) {
		if (request.getParameter("op").equals("add")) {
			int student_id = Integer.parseInt(request.getParameter("student_id"));
			int book_id = Integer.parseInt(request.getParameter("book_id"));
			bm.addBookFromStudent(student_id, book_id);
		}
	}
	%>

	<!-- lister les livres -->
	<%
	if (request.getParameter("Cop") != null) {
		String Cop = request.getParameter("Cop");
		 ab = bm.allBooksByCategorie(Cop);
	} else if (request.getParameter("Aop") != null) {
		String Aop = request.getParameter("Aop");
		 ab = bm.allBooksByAuthor(Aop);
	}else{
	 	 ab = bm.allBooksAvailable();
	}
	%>

	<div class="Container m-5">
		<h3>Salut <%=s.getLogin().toUpperCase()%></h3>
		<p>bienvenu dans la bibliotheque</p><hr>
	
				<div class="row">
					<div class="col-10 offset-1  ">

						<form class="d-flex mb-2" method="Get">
							<input class="form-control me-2" type="search"
								placeholder="Categorie" aria-label="Search" name="Cop">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
						<form class="d-flex mb-2">
							<input class="form-control me-2" type="search"
								placeholder="Auteur" aria-label="Search" name="Aop">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
			
			<hr>
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
								<a href="?op=add&student_id=<%=s.getId()%>&book_id=<%=b.getId()%>"
									class="btn btn-success px-3 py-2">Emprunter</a>
						</div>
					</div>
				</div>
			</div>
			<%}%>
		</div>
	</div>
</body>
</html>