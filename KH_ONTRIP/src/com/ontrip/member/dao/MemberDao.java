package ontrip.domain.member.dao;

import ontrip.web.controller.JDBCTemplate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static ontrip.web.controller.JDBCTemplate.*;

public class MemberDao {

    public void insertmember(){

        int result = 0;

        Connection conn = JDBCTemplate.getConnection();

        PreparedStatement psmt = null;

        String sql = "INSERT INTO MEMBER (MEMBERNAME) VALUES (?)";

        try {
            psmt = conn.prepareStatement(sql);

            psmt.setString(1,"안녕");

            result = psmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(psmt);
            close();
        }

        if(result > 0){
            System.out.println("실행성공");
        }else{
            System.out.println("실행실패");
        }

    }
}
