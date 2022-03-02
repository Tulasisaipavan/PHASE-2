package com.flightbooking.servlet;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flightbooking.databases.ConnectionUtil;
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ForgotPassword() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		try {
		ConnectionUtil dao=new ConnectionUtil();
		HttpSession session=request.getSession();
		if(dao.changeAdminPassword(email,password)) {
		session.setAttribute("message", "Password Changed Successfully");
		}
		else {
		session.setAttribute("message", "Invalid Details");
		}
		} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
		}
		response.sendRedirect("AdminPage.jsp");
	}

}
