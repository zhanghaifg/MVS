package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.Mask;
import dao.MaskDao;

/**
 * Servlet implementation class MaskSearchServlet
 */
@WebServlet("/MaskSearchServlet")
public class MaskSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> maskMap = new HashMap<String,Object>();
		String maskName = request.getParameter("maskName");
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		MaskDao maskDao = (MaskDao) context.getBean("maskDao");
		List<Mask> maskList = maskDao.search(maskName);
		PrintWriter pw = response.getWriter();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.reset();
		if(maskList==null||maskList.isEmpty()){
			maskMap =  makenoneMask();
			String jsons = mapper.writeValueAsString(maskMap);
//			System.out.println(jsons);
			pw.write(jsons);
			pw.flush();;
			return;
		}
		else{
			maskMap = makeMask(hs,maskList);
			String jsons = mapper.writeValueAsString(maskMap);
//			System.out.println(jsons);
			pw.write(jsons);
			pw.flush();
		}
		
	}
	private Map<String,Object> makeMask(HttpSession hs, List<Mask> maskList) {
		List<Mask> maskU1 = new ArrayList<Mask>();
		List<Mask> maskU2 = new ArrayList<Mask>();
		List<Mask> maskU3 = new ArrayList<Mask>();
		List<Mask> maskD1 = new ArrayList<Mask>();
		List<Mask> maskD2 = new ArrayList<Mask>();
		List<Mask> maskD3 = new ArrayList<Mask>();
		Map<String,Object> maskMap = new HashMap<String,Object>();
		
		
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
		maskMap.put("status", true);
		maskMap.put("maskU1", maskU1);
		maskMap.put("maskU2", maskU2);
		maskMap.put("maskU3", maskU3);
		maskMap.put("maskD1", maskD1);
		maskMap.put("maskD2", maskD2);
		maskMap.put("maskD3", maskD3);
		
		return maskMap;

	}
	
	private Map<String,Object> makenoneMask() {
		Map<String,Object> maskMap = new HashMap<String,Object>();
		maskMap.put("status", false);
		return maskMap;

	}	
}
