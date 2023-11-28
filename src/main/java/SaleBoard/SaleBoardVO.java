package SaleBoard;

public class SaleBoardVO {
	private int idx;
	private String fSName;
	private int fSize;
	private String title;
	private int money;
	private int totLike;
	private int viewCnt;
	private String uploadDate;
	private String content;
	private String mid;
	private String state;
	private String category;
	
	// 메인화면에서 게시글 올린지 얼마나 지났는지 확인을 위해서
	private String hour_diff;
	private String date_diff;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getfSName() {
		return fSName;
	}
	public void setfSName(String fSName) {
		this.fSName = fSName;
	}
	public int getfSize() {
		return fSize;
	}
	public void setfSize(int fSize) {
		this.fSize = fSize;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getTotLike() {
		return totLike;
	}
	public void setTotLike(int totLike) {
		this.totLike = totLike;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getHour_diff() {
		return hour_diff;
	}
	public void setHour_diff(String hour_diff) {
		this.hour_diff = hour_diff;
	}
	public String getDate_diff() {
		return date_diff;
	}
	public void setDate_diff(String date_diff) {
		this.date_diff = date_diff;
	}
	@Override
	public String toString() {
		return "SaleBoardVO [idx=" + idx + ", fSName=" + fSName + ", fSize=" + fSize + ", title=" + title + ", money="
				+ money + ", totLike=" + totLike + ", viewCnt=" + viewCnt + ", uploadDate=" + uploadDate + ", content="
				+ content + ", mid=" + mid + ", state=" + state + ", category=" + category + ", hour_diff=" + hour_diff
				+ ", date_diff=" + date_diff + "]";
	}
}
