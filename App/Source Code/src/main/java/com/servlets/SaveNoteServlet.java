package com.servlets;

import java.io.*;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class SaveNoteServlet extends HttpServlet{

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException
	{
	
		
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		
		Note n =new Note(title,content, new Date());
		
		Session s=FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		s.save(n);
		tx.commit();
		s.close();
		
		resp.setContentType("text/html");
		
		PrintWriter out=resp.getWriter();
		
		out.println("<h1 style='text-align:center;'>Note Added Successfully</h1>");
		out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View All Notes</a></h1>");
		
	}
}
