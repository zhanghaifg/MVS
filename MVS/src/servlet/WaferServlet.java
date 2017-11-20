package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import dao.Wafer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

/**
 * Servlet implementation class WaferServlet
 */
@WebServlet(description = "send Wafer JSON data", urlPatterns = { "/WaferServlet" })
public class WaferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		List<Wafer> waferList = (List<Wafer>) hs.getAttribute("waferList");
		ObjectMapper mapper = new ObjectMapper();
		String jsons = mapper.writeValueAsString(waferList);
		PrintWriter pw = response.getWriter();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.reset();
		pw.write(jsons);
		pw.flush();
		
	}

}
