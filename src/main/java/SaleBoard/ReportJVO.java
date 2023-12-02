package SaleBoard;

public class ReportJVO {
	private int idx;
	private String part;
	private int partIdx;
	private String cpMid;
	private String title;
	private String cpContent;
	private String cpDate;
	private String fSName;
	
	private String hour_diff;
	private String date_diff;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public int getPartIdx() {
		return partIdx;
	}
	public void setPartIdx(int partIdx) {
		this.partIdx = partIdx;
	}
	public String getCpMid() {
		return cpMid;
	}
	public void setCpMid(String cpMid) {
		this.cpMid = cpMid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCpContent() {
		return cpContent;
	}
	public void setCpContent(String cpContent) {
		this.cpContent = cpContent;
	}
	public String getCpDate() {
		return cpDate;
	}
	public void setCpDate(String cpDate) {
		this.cpDate = cpDate;
	}
	public String getfSName() {
		return fSName;
	}
	public void setfSName(String fSName) {
		this.fSName = fSName;
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
		return "ReportJVO [idx=" + idx + ", part=" + part + ", partIdx=" + partIdx + ", cpMid=" + cpMid + ", title="
				+ title + ", cpContent=" + cpContent + ", cpDate=" + cpDate + ", fSName=" + fSName + ", hour_diff="
				+ hour_diff + ", date_diff=" + date_diff + "]";
	}
}
