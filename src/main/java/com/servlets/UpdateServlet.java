//package com.servlets;
//
//import java.io.IOException;
//import java.util.Date;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.hibernate.Session;
//import org.hibernate.Transaction;
//
//import com.entities.Note;
//import com.helper.FactoryProvider;
//
//@WebServlet("/UpdateServlet")
//public class UpdateServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    public UpdateServlet() {
//        super();
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            // Get parameters from the request
//            String title = request.getParameter("title");
//            String content = request.getParameter("content");
//            int noteId = Integer.parseInt(request.getParameter("noteId"));
//
//            // Open Hibernate session
//            Session s = FactoryProvider.getFactory().openSession();
//            Transaction tx = s.beginTransaction();
//
//            // Retrieve the Note from DB
//            Note n = (Note) s.get(Note.class, noteId);
//
//            if (n == null) {
//                response.getWriter().println("Note with ID " + noteId + " not found.");
//                return;  // Exit early as there's no need to proceed
//            }
//
//            // Update Note object
//            n.setTitle(title);
//            n.setContent(content);
//            n.setAddedDate(new Date());
//
//            s.flush();  // Ensure changes are written to DB
//            tx.commit();
//
//            s.close();
//            response.sendRedirect("all_notes.jsp");
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.getWriter().println("An error occurred while updating the note: " + e.getMessage());
//        }
//    }
//}
