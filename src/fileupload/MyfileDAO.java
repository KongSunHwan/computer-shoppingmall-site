package fileupload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MyfileDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

public MyfileDAO() {
	try {
		Context context = new InitialContext();
		ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		
	} catch (Exception e) {
		System.out.println("MyfileDAO err : " + e);
	}
}
	// 새로운 게시물을 입력합니다.
    public int insertFile(MyfileDTO dto) {
        int applyResult = 0;
        try {
        	conn = ds.getConnection();
            String query = "INSERT INTO myfile ( "
                + " idx, name, title, cate, ofile, sfile) "
                + " VALUES ( "
                + " ?, ?, ?, ?, ?, ?)";
                        
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getIdx());
            pstmt.setString(2, dto.getName());
            pstmt.setString(3, dto.getTitle());
            pstmt.setString(4, dto.getCate());
            pstmt.setString(5, dto.getOfile());
            pstmt.setString(6, dto.getSfile());
        
            applyResult = pstmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("INSERT 중 예외 발생");
            e.printStackTrace();
        } finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		} 
        return applyResult;
    }

    // 파일 목록을 반환합니다.
    public List<MyfileDTO> myFileList() {
        List<MyfileDTO> fileList = new Vector<MyfileDTO>();

        // 쿼리문 작성
        String query = "SELECT * FROM myfile ORDER BY idx DESC";
        try {
        	conn = ds.getConnection();
        	pstmt = conn.prepareStatement(query);  // 쿼리 준비
            rs = pstmt.executeQuery();  // 쿼리 실행

            while (rs.next()) {  // 목록 안의 파일 수만큼 반복
                // DTO에 저장
                MyfileDTO dto = new MyfileDTO();
                dto.setIdx(rs.getString(1));
                dto.setName(rs.getString(2));
                dto.setTitle(rs.getString(3));
                dto.setCate(rs.getString(4));
                dto.setOfile(rs.getString(5));
                dto.setSfile(rs.getString(6));
                dto.setPostdate(rs.getString(7));
                
                fileList.add(dto);  // 목록에 추가
            }
        }
        catch (Exception e) {
            System.out.println("SELECT 시 예외 발생");
            e.printStackTrace();
        } finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		}       
        return fileList;  // 목록 반환
    }
}