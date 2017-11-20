package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.Mask;
import dao.MaskDao;

/**
 * Servlet implementation class MaskServlet
 */
@WebServlet("/MaskServlet")
public class MaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}
	private void process (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String productName = request.getParameter("productName");
		String maskName = request.getParameter("maskName");
		HttpSession hs = request.getSession();
		hs.setAttribute("title", title);
		hs.setAttribute("productName", productName);
		hs.setAttribute("maskName", maskName);
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		MaskDao maskDao = (MaskDao) context.getBean("maskDao");
		
		if(maskName==null||maskName.trim().isEmpty()){
			makeMasknone(hs);
			response.sendRedirect("Mask.jsp");
			return;
		}
		else {
			List<Mask> maskList = maskDao.search(maskName);
			if(maskList==null||maskList.isEmpty()){
				makeMasknone(hs);
				response.sendRedirect("Mask.jsp");
			}
			else{
				makeMask(hs,maskList);
				request.getRequestDispatcher("Mask.jsp").forward(request, response);
			}
		}
		
	}

	private void makeMask(HttpSession hs, List<Mask> maskList) {
		List<Mask> maskU1 = new ArrayList<Mask>();
		List<Mask> maskU2 = new ArrayList<Mask>();
		List<Mask> maskU3 = new ArrayList<Mask>();
		List<Mask> maskD1 = new ArrayList<Mask>();
		List<Mask> maskD2 = new ArrayList<Mask>();
		List<Mask> maskD3 = new ArrayList<Mask>();
		
		for(Mask x:maskList){
			if(x.getTab().equals("U")&&x.getLayer().equals("1"))
				maskU1.add(x);
			if(x.getTab().equals("U")&&x.getLayer().equals("2"))
				maskU2.add(x);
			if(x.getTab().equals("U")&&x.getLayer().equals("3"))
				maskU3.add(x);
			if(x.getTab().equals("D")&&x.getLayer().equals("1"))
				maskD1.add(x);
			if(x.getTab().equals("D")&&x.getLayer().equals("2"))
				maskD2.add(x);
			if(x.getTab().equals("D")&&x.getLayer().equals("3"))
				maskD3.add(x);
		}
		
		hs.setAttribute("maskU1", maskU1);
		hs.setAttribute("maskU2", maskU2);
		hs.setAttribute("maskU3", maskU3);
		hs.setAttribute("maskD1", maskD1);
		hs.setAttribute("maskD2", maskD2);
		hs.setAttribute("maskD3", maskD3);
		
	}
	private void makeMasknone(HttpSession hs){
		hs.setAttribute("maskU1", null);
		hs.setAttribute("maskU2", null);
		hs.setAttribute("maskU3", null);
		hs.setAttribute("maskD1", null);
		hs.setAttribute("maskD2", null);
		hs.setAttribute("maskD3", null);
		
	}
}
