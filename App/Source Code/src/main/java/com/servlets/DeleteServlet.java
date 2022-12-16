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

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException
	{
		
		int id=Integer.parseInt(req.getParameter("note_id"));
		
		Session s=FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		Note note=(Note)s.get(Note.class, id);
		s.delete(note);
		tx.commit();
		s.close();
		
		resp.sendRedirect("all_notes.jsp");
		
		
	}
	
}
