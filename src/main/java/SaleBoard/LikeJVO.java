package SaleBoard;

public class LikeJVO {
	private int idx;
	private int saleBoardIdx;
	private String likeMid;
	private String likeYN;
	private String alarm;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getSaleBoardIdx() {
		return saleBoardIdx;
	}
	public void setSaleBoardIdx(int saleBoardIdx) {
		this.saleBoardIdx = saleBoardIdx;
	}
	public String getLikeMid() {
		return likeMid;
	}
	public void setLikeMid(String likeMid) {
		this.likeMid = likeMid;
	}
	public String getLikeYN() {
		return likeYN;
	}
	public void setLikeYN(String likeYN) {
		this.likeYN = likeYN;
	}
	public String getAlarm() {
		return alarm;
	}
	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}
	@Override
	public String toString() {
		return "LikeJVO [idx=" + idx + ", saleBoardIdx=" + saleBoardIdx + ", likeMid=" + likeMid + ", likeYN=" + likeYN
				+ ", alarm=" + alarm + "]";
	}
}
