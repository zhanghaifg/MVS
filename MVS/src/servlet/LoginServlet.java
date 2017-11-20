package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.Product;
import dao.ProductDao;
import dao.User;
import dao.UserDao;
import dao.Wafer;
import dao.WaferDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

		/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	private void process (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		UserDao userDao = (UserDao) context.getBean("userDao");
		HttpSession hs = request.getSession();
		
		if(userId==null||password==null||userId.trim().isEmpty()||password.trim().isEmpty()) {
			hs.setAttribute("login", false);
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return;
		}
		else{
			if(userDao.checkPassword(userId, password)){
				hs.setAttribute("login", true);
				User user = userDao.getUser(userId);
				hs.setAttribute("user", user);
				//fetch product names from database
				ProductDao productDao = (ProductDao) context.getBean("productDao");
				List<Product> productList = productDao.getList();
				hs.setAttribute("productList", productList);
				//fetch wafer info from database
				WaferDao waferDao = (WaferDao) context.getBean("waferDao");
				List<Wafer> waferList = waferDao.getList();
				hs.setAttribute("waferList", waferList);
				request.getRequestDispatcher("MaskJS.jsp").forward(request,response);
				return;
			} 
			else{
				hs.setAttribute("Login", false);
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		}
		
	}
}
