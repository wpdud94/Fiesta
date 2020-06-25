package com.fiesta.controller.component;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fiesta.controller.Controller;
import com.fiesta.controller.ModelAndView;
import com.fiesta.model.FiestaDaoImpl;

public class EmailExistController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		boolean flag = false;
		// String path = "customerRegister.jsp";
		PrintWriter out = response.getWriter();
		try {
			flag = FiestaDaoImpl.getInstance().emailExist(email);
			out.print(flag);
		} catch (SQLException e) {
			
		}
		//request.setAttribute("flag", flag); 이것도 필요 없는거다 ok! 이해완료!!
		return null;
	}

}
