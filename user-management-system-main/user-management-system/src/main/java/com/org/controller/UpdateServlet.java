package com.org.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.dao.UserDao;
import com.org.dto.User;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		long mobile = Long.parseLong(req.getParameter("mobile"));
		String email = req.getParameter("email");
		int id = Integer.parseInt(req.getParameter("id"));

		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setAge(age);
		user.setMobile(mobile);
		user.setEmail(email);
		
		UserDao dao = new UserDao();
		dao.updateUser(user);
		
		resp.sendRedirect("home.jsp");
	}
	

}
