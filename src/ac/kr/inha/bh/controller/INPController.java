package ac.kr.inha.bh.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class INPController extends HttpServlet{
	
	private static final long serialVersionUID = -1363111968156302845L;

	private Connection getConnection() throws Exception {
		Connection conn = null;
        
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "INHA_INP";
		String password = "INHA_INP";

        try{
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);

        } catch(ClassNotFoundException e){
        } catch(SQLException e){
        } catch (Exception ex) {
        }
        return conn;
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response){
		try {
			String url = request.getServletPath().replace("/", "").replace(".bh", "");
			
			if ( url.equals("insert")) {
				insertBoard(request, response);
			} else if ("delete".equals(url)) {
				delBoard(request, response);
			} else if ("update".equals(url)) {
				modifyBoard(request, response);
			} else if ("select".equals(url)) {
				selectBoard(request, response);
			} else if ("detail".equals(url)) {
				detailBoard(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void detailBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet st = null;
		Map<String, String> _params = getParameterMap(request);
		
		String sql = "SELECT * FROM BOARD WHERE ID = ? ";
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, _params.get("ID"));
		st = pstmt.executeQuery();
		
		JSONObject obj = new JSONObject();
		
		while(st.next()) {
			obj.put("ID", st.getString("ID"));
			obj.put("NOTE", st.getString("NOTE"));
			obj.put("TITLE", st.getString("TITLE"));
			obj.put("REG_ID", st.getString("REG_ID"));
			obj.put("REG_DT", st.getString("REG_DT"));
		}
		
		pstmt.close();
		st.close();
		con.close();

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(obj.toJSONString());
		response.getWriter().flush();
		
	}
	
	private void selectBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet st = null;
		JSONArray _jArray = new JSONArray();
		
		String sql = "SELECT * FROM BOARD ORDER BY ID DESC";
		
		pstmt = con.prepareStatement(sql);
		
		st = pstmt.executeQuery();
		
		while(st.next()) {
			JSONObject obj = new JSONObject();
			
			obj.put("ID", st.getString("ID"));
			obj.put("TITLE", st.getString("TITLE"));
			obj.put("REG_ID", st.getString("REG_ID"));
			obj.put("REG_DT", st.getString("REG_DT"));
			
			_jArray.add(obj);
		}
		
		pstmt.close();
		st.close();
		con.close();

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(_jArray.toJSONString());
		response.getWriter().flush();
	}
	
	private void insertBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet st = null;
		
		Map<String, String> _params = getParameterMap(request);
		
		String sql = "INSERT INTO BOARD(ID, TITLE, NOTE, REG_ID, REG_DT)"
					+ "SELECT NVL(MAX(ID)+1, 1), ?, ?, ?, SYSDATE FROM BOARD";
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, _params.get("TITLE"));
		pstmt.setString(2, _params.get("NOTE"));
		pstmt.setString(3, _params.get("REG_ID"));
		
		int i = pstmt.executeUpdate();
		
		con.commit();
		pstmt.close();
		con.close();
		
		JSONObject obj = new JSONObject();
		String msg = "";
		boolean success = false;
		if ( i == 1) {
			msg = "글 등록에 성공하셨습니다.";
			success = true;
		} else {
			msg = "글 등록에 실패하셨습니다.";
		}
		
		obj.put("msg", msg);
		obj.put("success", success);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(obj.toJSONString());
		response.getWriter().flush();
	}
	
	private void delBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet st = null;
		
		Map<String, String> _params = getParameterMap(request);
		
		String[] _arr = _params.get("ID").split(",");
		
		int i = 0;
		for ( int j=0; _arr.length > j; j++) {
			String sql = "DELETE FROM BOARD WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, _arr[j]);
			i += pstmt.executeUpdate();
		}
		
		con.commit();
		pstmt.close();
		con.close();
		
		JSONObject obj = new JSONObject();
		String msg = "";
		boolean success = false;
		if ( i > 0) {
			msg = "글 삭제에 성공하셨습니다.";
			success = true;
		} else {
			msg = "글 삭제에 실패하셨습니다.";
		}
		
		obj.put("msg", msg);
		obj.put("success", success);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(obj.toJSONString());
		response.getWriter().flush();
	}
	
	private void modifyBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet st = null;
		
		Map<String, String> _params = getParameterMap(request);
		
		String sql = "UPDATE BOARD SET  "
				+ "TITLE = ?,"
				+ "NOTE = ?"
				+ "WHERE ID = ?";
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, _params.get("TITLE"));
		pstmt.setString(2, _params.get("NOTE"));
		pstmt.setString(3, _params.get("ID"));
		
		int i = pstmt.executeUpdate();
		
		con.commit();
		pstmt.close();
		con.close();
		
		JSONObject obj = new JSONObject();
		String msg = "";
		boolean success = false;
		if ( i > 0) {
			msg = "글 수정에 성공하셨습니다.";
			success = true;
		} else {
			msg = "글 수정에 실패하셨습니다.";
		}
		
		obj.put("msg", msg);
		obj.put("success", success);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(obj.toJSONString());
		response.getWriter().flush();
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map getParameterMap(HttpServletRequest request) {

		Map parameterMap = new HashMap();
		Enumeration enums = request.getParameterNames();
		while (enums.hasMoreElements()) {
			String paramName = (String) enums.nextElement();
			String[] parameters = request.getParameterValues(paramName);

			// Parameter가 배열일 경우
			if (parameters.length > 1) {
				parameterMap.put(paramName, parameters);
				// Parameter가 배열이 아닌 경우
			} else {
				parameterMap.put(paramName, parameters[0]);
			}
		}
		return parameterMap;
	}

}
