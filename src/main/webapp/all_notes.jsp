<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="CSS/style.css" rel="stylesheet" />
<style>
    .note-card {
        transition: transform 0.2s;
    }

    .note-card:hover {
        transform: scale(1.02);
    }

    .note-content {
        max-height: 120px;
        overflow: hidden;
    }
</style>
</head>
<body>
    <div class="container my-4">
        <div class="sticky-top">
            <%@include file="NavBar.jsp"%>
        </div>

        <h1 class="text-center mb-5">📚 All Notes</h1>

        <div class="row g-4">
            <%
            // Displaying any messages
            String message = request.getParameter("message");
            if (message != null) {
            %>
            <div class="col-12">
                <div class="alert alert-info text-center" role="alert">
                    <%= message %>
                </div>
            </div>
            <%
            }

            // Fetch all notes
            Session s = FactoryProvider.getFactory().openSession();
            Query q = s.createQuery("from Note");
            List<Note> l = q.list();

            for (Note note : l) {
            %>
            <div class="col-md-4">
                <div class="card shadow-sm note-card h-100">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title text-primary">#<%=note.getId()%> - <%=note.getTitle()%></h5>
                        <p class="card-text note-content"><%=note.getContent()%></p>

                        <div class="mt-auto d-flex justify-content-between">
                            <a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger" 
                                onclick="return confirm('Are you sure you want to delete this note?');">Delete</a>
                            <a href="edit_page.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
            }
            s.close();
            %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
