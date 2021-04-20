package Controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.LoginDao;
import java.io.IOException;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
       
   
        @Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario=request.getParameter("usuario");
		String senha=request.getParameter("senha");
		LoginDao dao=new LoginDao();
		
		
		if(dao.check(usuario, senha))
		{
			
			HttpSession session=request.getSession();
			session.setAttribute("username",usuario);
                        session.setAttribute("logado", "true");
			response.sendRedirect("index.jsp");
			
		}
                else {
                    response.sendRedirect("index.jsp");
                }
		
		
		
	}

}