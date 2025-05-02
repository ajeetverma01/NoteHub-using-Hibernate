<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Note</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"
	crossorigin="anonymous">
<link href="CSS/style.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<%@include file="NavBar.jsp"%>
		<h1>Edit Note:</h1>


		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Note n = (Note)s.get(Note.class, noteId);
		
		
		
		s.close();
		%>

		<form action="UpdateServlet" method="post">

			<!-- Hidden field to send note ID -->
			<input type="hidden" name="noteId" value="" />

			<div class="mb-3">
				<label for="title" class="form-label">Note title</label>
				 <input
					required type="text" class="form-control" id="title" name="title"
					value="<%= n.getTitle()%>" 
					/>
			</div>

			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea name="content" id="content" class="form-control"
					style="height: 300px" required><%= n.getContent()%></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success ">Update Note</button>
			</div>

		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
		crossorigin="anonymous"></script>

</body>
</html>
