package servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import dao.User;

/**
 * Servlet implementation class SummaryServlet
 */
@WebServlet("/SummaryServlet")
public class SummaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		User user = (User) hs.getAttribute("user");
		String globalId = user.getGlobalId();
		String jsonString = request.getParameter("jsonOb");
		ObjectMapper mapper = new ObjectMapper();
		@SuppressWarnings("unchecked")
		Map<String,String> jsonOb =  mapper.readValue(jsonString, Map.class);
		System.out.println("------"+jsonOb.get("maskD1"));
		jsonOb.put("globalId",globalId);
		String jsons = mapper.writeValueAsString(jsonOb);
		System.out.println(jsons);
		hs.setAttribute("jsons", jsons);
		request.getRequestDispatcher("Summary.jsp").forward(request, response);
		
	}

}
