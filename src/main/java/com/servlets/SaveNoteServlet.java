package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

@WebServlet("/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			Note note = new Note(1, title, content, new Date());
//			System.out.println(note.getId() + " " +note.getTitle());    //Just for testing

			Session s = FactoryProvider.getFactory().openSession();
			Transaction t = s.beginTransaction();
			s.persist(note);
			t.commit();

			s.close();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			
			out.println("<h1>Note is added successfully!</h1>"
					+ "<a class='nav-link active' aria-current='page' href='index.jsp'>Go to Home Page</a>");
			out.println("</br><a class='nav-link active' aria-current='page' href='all_notes.jsp'>View all notes</a>");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
