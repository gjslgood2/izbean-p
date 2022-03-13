package kr.ac.inha.post.dao;

import kr.ac.inha.common.AbstractDao;

import java.util.Collections;
import java.util.List;
import java.util.Map;

public class PostDao extends AbstractDao {

    private static final String GET_POST_SQL = "select * from board where id = ?";
    private static final String GET_POSTS_SQL = "select * from board order by id desc";
    private static final String INSERT_POST_SQL = "insert into board(title, note, reg_id, reg_dt)" +
                                                    "values (?, ?, ?, now())";
    private static final String UPDATE_POST_SQL = "update board set title = ?, note = ? where id = ?";
    private static final String DELETE_POST_SQL = "delete from board where id = ?";

    public List<Map<String, String>> getPosts() {
        try {
            return querySelectList(GET_POSTS_SQL);
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }

        return Collections.emptyList();
    }

    public Map<String, String> getPost(String id) {
        try {
            return querySelectSingle(GET_POST_SQL, id);
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }

        return Collections.emptyMap();
    }

    public int insertPost(String title, String note, String regId) {
        try {
            return insert(INSERT_POST_SQL, title, note, regId);
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }

        return 0;
    }

    public int updatePost(String id, String title, String note) {
        try {
            return update(UPDATE_POST_SQL, title, note, id);
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }

        return 0;
    }

    public int deletePost(String id) {
        try {
            return update(DELETE_POST_SQL, id);
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }

        return 0;
    }

}
