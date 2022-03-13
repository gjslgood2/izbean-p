package kr.ac.inha.common;

import kr.ac.inha.config.ConnectionManager;

import java.sql.*;
import java.util.*;

public abstract class AbstractDao {

    protected final Connection connection = ConnectionManager.getConnection();

    protected Map<String, String> querySelectSingle(String sql, String... params) throws SQLException {
        PreparedStatement preparedStatement = setParamForPreparedStatement(sql, params);
        ResultSet resultSet = preparedStatement.executeQuery();

        List<Map<String, String>> resultList = parseToList(resultSet);

        if (resultList.size() > 0)
            return resultList.get(0);

        return Collections.emptyMap();
    }

    protected List<Map<String, String>> querySelectList(String sql, String... params) throws SQLException {
        PreparedStatement preparedStatement = setParamForPreparedStatement(sql, params);
        ResultSet resultSet = preparedStatement.executeQuery();

        return parseToList(resultSet);
    }

    protected int update(String sql, String... params) throws SQLException {
        PreparedStatement preparedStatement = setParamForPreparedStatement(sql, params);
        int count = preparedStatement.executeUpdate();
        connection.commit();
        return count;
    }

    protected int insert(String sql, String... params) throws SQLException {
        PreparedStatement preparedStatement = setParamForPreparedStatement(sql, params);
        int count = preparedStatement.executeUpdate();
        connection.commit();
        return count;
    }

    private List<Map<String, String>> parseToList(ResultSet resultSet) throws SQLException {
        ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
        int columnCount = resultSetMetaData.getColumnCount();

        List<Map<String, String>> resultList = new ArrayList<>();

        while(resultSet.next()) {
            Map<String, String> result = new HashMap<>();
            for (int i=0; columnCount > i; i++) {
                String columnName = resultSetMetaData.getColumnLabel(i);
                result.put(columnName, resultSet.getString(columnName));
            }
            resultList.add(result);
        }

        return resultList;
    }

    private PreparedStatement setParamForPreparedStatement(String sql, String[] params) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        for (int i=0; params.length > i; i++)
            preparedStatement.setString(i+1, params[i]);

        return preparedStatement;
    }

}
