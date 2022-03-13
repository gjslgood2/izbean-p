package kr.ac.inha.post.controller;

import kr.ac.inha.post.service.PostService;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PostController extends HttpServlet {

	private PostService postService;

	public PostController() {
		postService = new PostService();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONObject responseJSONObject = new JSONObject();
		responseJSONObject.put("code", 200);
		Object responseObject = null;
		try {
			String action = request.getServletPath().replace("/", "").replace(".do", "");

			String id = request.getParameter("ID");
			String title = request.getParameter("TITLE");
			String note = request.getParameter("NOTE");
			String regId = request.getParameter("REG_ID");

			if ( action.equals("insert")) {
				responseObject = postService.insertPost(title, note, regId);
			} else if ("delete".equals(action)) {
				responseObject = postService.deletePost(id);
			} else if ("update".equals(action)) {
				responseObject = postService.updatePost(id, title, note);
			} else if ("select".equals(action)) {
				responseObject = postService.getPosts();
			} else if ("detail".equals(action)) {
				responseObject = postService.getPost(id);
			}

		} catch (Exception e) {
			responseJSONObject.put("code", 500);
			e.printStackTrace();
		}

		responseJSONObject.put("response", responseObject);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(responseJSONObject.toJSONString());
		response.getWriter().flush();
	}

}
