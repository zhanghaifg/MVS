package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.User;

/**
 * Servlet implementation class LoginLoadServlet
 */
@WebServlet("/LoginLoadServlet")
public class LoginLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		User user = (User) hs.getAttribute("user");
		String globalId = user.getGlobalId();
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		response.reset();
		pw.write(globalId);
		pw.flush();
		
	}

}
