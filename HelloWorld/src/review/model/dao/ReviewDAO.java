package review.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import review.model.vo.Review;
import review.model.vo.ReviewComment;
import review.model.vo.ReviewPhoto;

public class ReviewDAO {
	
	private Properties prop = new Properties();
	
	public ReviewDAO() {
		String fileName = getClass().getResource("/sql/review/review-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Review> selectAll(Connection conn, int cPage, int numPerPage) {
		List<Review> list = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAll");

		try {
			pstmt = conn.prepareStatement(sql);
			
			int startrownum = (cPage-1)*numPerPage+1;
			int endrownum = cPage * numPerPage;
			
			pstmt.setInt(1, startrownum);
			pstmt.setInt(2, endrownum);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review rv = new Review();
				rv.setReviewNo(rset.getInt("review_no"));
				rv.setMemberId(rset.getString("member_id"));
				rv.setPlaceNo(rset.getInt("place_no"));
				rv.setPlaceTitle(rset.getString("place_title"));
				rv.setReviewContent(rset.getString("review_content"));
				rv.setPlaceRating(rset.getInt("place_rating"));
				rv.setLikeCount(rset.getInt("like_count"));
				rv.setReadCount(rset.getInt("read_count"));
				rv.setReviewDate(rset.getDate("review_date"));
				list.add(rv);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int countAll(Connection conn) {
		int totalContent = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalContent = rset.getInt("cnt");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContent;
	}

	public Review selectOne(Connection conn, int reviewNo) {
		Review rv = new Review();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rv.setReviewNo(rset.getInt("review_no"));
				rv.setMemberId(rset.getString("member_id"));
				rv.setPlaceNo(rset.getInt("place_no"));
				rv.setPlaceTitle(rset.getString("place_title"));
				rv.setReviewContent(rset.getString("review_content"));
				rv.setPlaceRating(rset.getInt("place_rating"));
				rv.setLikeCount(rset.getInt("like_count"));
				rv.setReadCount(rset.getInt("read_count"));
				rv.setReviewDate(rset.getDate("review_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rv;
	}

	public int insertReview(Connection conn, Review rv) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rv.getMemberId());
			pstmt.setInt(2, rv.getPlaceNo());
			pstmt.setString(3, rv.getPlaceTitle());
			pstmt.setString(4, rv.getReviewContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectLastSeq(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLastSeq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("reviewNo");
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public int insertReviewPhoto(Connection conn, ReviewPhoto rp) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReviewPhoto");
//		insert into review_photo values(seq_photo_no.nextval, ?, ?, ?, ?)
//		rp.getPhotoLevel() 추가
		
		try {
			String[] Oname = rp.getOriginalPhotoName().split("&");
			String[] Rname = rp.getRenamedPhotoName().split("&");

			for(int i=0; i<Oname.length; i++) {
				if(!Oname[i].equals("없음")) {
					pstmt = conn.prepareStatement(sql);
			
					pstmt.setInt(1, rp.getReviewNo());
					pstmt.setString(2, Oname[i]);
					pstmt.setString(3, Rname[i]);
					
	/*				pstmt.setInt(1, rp.getReviewNo());
					pstmt.setInt(2, rp.getPhotoLevel());
					pstmt.setString(3, Oname[i]);
					pstmt.setString(4, Rname[i]);*/
				
					result += pstmt.executeUpdate();
				}
				else {
					continue;
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<ReviewPhoto> selectPhoto(Connection conn, int reviewNo) {
		List<ReviewPhoto> list = new ArrayList<ReviewPhoto>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ReviewPhoto rp = new ReviewPhoto();
				rp.setPhotoNo(rset.getInt("photo_no"));
				rp.setReviewNo(rset.getInt("review_no"));
				rp.setPhotoLevel(rset.getInt("photo_level"));
				rp.setOriginalPhotoName(rset.getString("original_photo_name"));
				rp.setRenamedPhotoName(rset.getString("renamded_photo_name"));
				list.add(rp);
			}
			System.out.println("리뷰사진확인="+list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int deleteReviewImg(Connection conn, String img) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReviewImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, img);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateReview(Connection conn, Review rv) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rv.getPlaceTitle());
			pstmt.setString(2, rv.getReviewContent());
			pstmt.setInt(3, rv.getReviewNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteReviewPhoto(Connection conn, int reviewNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReviewPhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteReview(Connection conn, int reviewNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<ReviewComment> selectReviewComment(Connection conn, int reviewNo) {
		List<ReviewComment> commentList = new ArrayList<ReviewComment>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ReviewComment rc = new ReviewComment();
				rc.setReviewCommentContent(rset.getString("review_comment_content"));
				rc.setReviewCommentDate(rset.getDate("review_comment_date"));
				rc.setReviewCommentLevel(rset.getInt("review_comment_level"));
				rc.setReviewCommentNo(rset.getInt("review_comment_no"));
				rc.setReviewCommentRef(rset.getInt("review_comment_ref"));
				rc.setReviewCommentWriter(rset.getString("review_comment_writer"));
				rc.setReviewRef(rset.getInt("review_ref"));
				commentList.add(rc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return commentList;
	}

	public int deleteReply(Connection conn, int reviewCommentNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewCommentNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertReviewComment(Connection conn, ReviewComment rc) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReviewComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rc.getReviewRef());
			pstmt.setString(2, rc.getReviewCommentWriter());
			pstmt.setString(3, rc.getReviewCommentRef()==0?null:String.valueOf(rc.getReviewCommentRef()));
			pstmt.setInt(4, rc.getReviewCommentLevel());
			pstmt.setString(5, rc.getReviewCommentContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
