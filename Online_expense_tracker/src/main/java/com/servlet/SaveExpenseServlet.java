package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDao;
import com.db.HibernateUtil;
import com.entity.Expense;
import com.entity.User;

@WebServlet("/saveExepnse")
public class SaveExpenseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String date = req.getParameter("date");
		String time = req.getParameter("time");
		String description = req.getParameter("description");
		String price = req.getParameter("price");
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		Expense ex = new Expense(title, date, time, description, price, user);
		ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
		
		boolean f = dao.saveExpense(ex);
		if(f) {
			session.setAttribute("msg", "Expense added successfully");
			resp.sendRedirect("user/add_expense.jsp");
			//System.out.println("Register successfully");
		}else {
			session.setAttribute("msg", "Something went wrong");
			//System.out.println("something went wrong");
			resp.sendRedirect("user/add_expense.jsp");
		}

	}

}