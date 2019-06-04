package review.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import review.model.dao.ReviewDAO;
import review.model.vo.Review;
import review.model.vo.ReviewComment;
import review.model.vo.ReviewPhoto;

public class ReviewService {

	public List<Review> selectAll(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Review> list = new ReviewDAO().selectAll(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int countAll() {
		Connection conn = getConnection();
		int totalContent = new ReviewDAO().countAll(conn);
		if(totalContent>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return totalContent;
	}

	public Review selectOne(int reviewNo) {
		Connection conn = getConnection();
		Review rv = new ReviewDAO().selectOne(conn, reviewNo);
		close(conn);
		return rv;
	}

	public int insertReview(Review rv) {
		Connection conn = getConnection();
		int result = new ReviewDAO().insertReview(conn, rv);
		if(result>0) {
			commit(conn);
			result = new ReviewDAO().selectLastSeq(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int insertReviewPhoto(ReviewPhoto rp, int mainPhoto) {
		Connection conn = getConnection();
		int result = new ReviewDAO().insertReviewPhoto(conn, rp, mainPhoto);
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<ReviewPhoto> selectPhoto(int reviewNo) {
		Connection conn = getConnection();
		List<ReviewPhoto> list = new ReviewDAO().selectPhoto(conn, reviewNo);
		close(conn);
		return list;
	}

	public int deleteReviewImg(String img) {
		Connection conn = getConnection();
		int result = new ReviewDAO().deleteReviewImg(conn, img);
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateReview(Review rv) {
		Connection conn = getConnection();
		int result = new ReviewDAO().updateReview(conn, rv);
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteReviewPhoto(int reviewNo) {
		Connection conn = getConnection();
		int result = new ReviewDAO().deleteReviewPhoto(conn, reviewNo);
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteReview(int reviewNo) {
		Connection conn = getConnection();
		int result = new ReviewDAO().deleteReview(conn, reviewNo);
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<ReviewComment> selectReviewComment(int reviewNo) {
		Connection conn = getConnection();
		List<ReviewComment> commentList = new ReviewDAO().selectReviewComment(conn, reviewNo);
		close(conn);
		return commentList;
	}

	public int deleteReply(int reviewCommentNo) {
		Connection conn = getConnection();
		int result = new ReviewDAO().deleteReply(conn, reviewCommentNo);
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int insertReviewComment(ReviewComment rc) {
		Connection conn = getConnection();
		int result = new ReviewDAO().insertReviewComment(conn, rc);
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}





}
