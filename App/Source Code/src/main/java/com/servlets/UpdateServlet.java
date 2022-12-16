package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet{

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException
	{
	
		int id=Integer.parseInt(req.getParameter("note_id").trim());
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		
		
		Session s=FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		Note n=s.get(Note.class, id);
		n.setTitle(title);
		n.setContent(content);
		tx.commit();
		s.close();
		
		resp.sendRedirect("all_notes.jsp");
	} 

}
