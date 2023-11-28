package SaleBoard;

public class SaleBoardVO {
	private int idx;
	private String fName;
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
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
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
	@Override
	public String toString() {
		return "SaleBoardVO [idx=" + idx + ", fName=" + fName + ", fSName=" + fSName + ", fSize=" + fSize + ", title="
				+ title + ", money=" + money + ", totLike=" + totLike + ", viewCnt=" + viewCnt + ", uploadDate="
				+ uploadDate + ", content=" + content + ", mid=" + mid + ", state=" + state + ", category=" + category
				+ "]";
	}
}
