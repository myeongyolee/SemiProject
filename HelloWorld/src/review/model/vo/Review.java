package review.model.vo;

import java.util.Date;

public class Review {
	private int reviewNo;
	private String memberId;
	private int placeNo;
	private String placeTitle;
	private String reviewContent;
	private int placeRating;
	private int likeCount;
	private int readCount;
	private Date reviewDate;
	
	public Review() {}

	public Review(int reviewNo, String memberId, int placeNo, String placeTitle, String reviewContent, int placeRating,
			int likeCount, int readCount, Date reviewDate) {
		this.reviewNo = reviewNo;
		this.memberId = memberId;
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
		this.reviewContent = reviewContent;
		this.placeRating = placeRating;
		this.likeCount = likeCount;
		this.readCount = readCount;
		this.reviewDate = reviewDate;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	public String getPlaceTitle() {
		return placeTitle;
	}

	public void setPlaceTitle(String placeTitle) {
		this.placeTitle = placeTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getPlaceRating() {
		return placeRating;
	}

	public void setPlaceRating(int placeRating) {
		this.placeRating = placeRating;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	
	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", memberId=" + memberId + ", placeNo=" + placeNo + ", placeTitle="
				+ placeTitle + ", reviewContent=" + reviewContent + ", placeRating=" + placeRating + ", likeCount="
				+ likeCount + ", readCount=" + readCount + ", reviewDate=" + reviewDate + "]";
	}

	
	
}
