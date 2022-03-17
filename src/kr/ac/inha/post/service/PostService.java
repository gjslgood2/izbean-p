package kr.ac.inha.post.service;

import kr.ac.inha.post.dao.PostDao;

import java.util.List;
import java.util.Map;

public class PostService {
    private static PostService postService;

    private final PostDao postDao = PostDao.getInstance();

    public static PostService getInstance() {
        if (postService == null)
            postService = new PostService();
        return postService;
    }

    public List<Map<String, String>> getPosts() {
        return postDao.getPosts();
    }

    public Map<String, String> getPost(String id) {
        return postDao.getPost(id);
    }

    public int insertPost(String title, String note, String regId) {
        return postDao.insertPost(title, note, regId);
    }

    public int updatePost(String id, String title, String note) {
        return postDao.updatePost(id, title, note);
    }

    public int deletePost(String ids) {
        int count = 0;

        if (ids == null || "".equals(ids))
            return 0;

        for (String id : ids.split(","))
            count += postDao.deletePost(id);

        return count;
    }

}
