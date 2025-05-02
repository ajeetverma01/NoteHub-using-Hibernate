package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int noteId = Integer.parseInt(request.getParameter("note_id").trim());
            System.out.println(noteId);

            Session session = FactoryProvider.getFactory().openSession();
            Transaction tr = session.beginTransaction();

            // Fetch the note from the database
            Note note = (Note) session.get(Note.class, noteId);
            System.out.println(note);
            session.delete(note);
            tr.commit();
            session.close();

            // Redirect to the notes page with a success message
            response.sendRedirect("all_notes.jsp");
        } catch (Exception e) {
            e.printStackTrace();
           
        }
    }
}
