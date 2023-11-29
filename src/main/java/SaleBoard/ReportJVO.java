package SaleBoard;

public class ReportJVO {
	private int idx;
	private String part;
	private int partIdx;
	private String cpMid;
	private String title;
	private String cpContent;
	private String cpDate;
	
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
	@Override
	public String toString() {
		return "ReportJVO [idx=" + idx + ", part=" + part + ", partIdx=" + partIdx + ", cpMid=" + cpMid + ", title="
				+ title + ", cpContent=" + cpContent + ", cpDate=" + cpDate + "]";
	}
}
