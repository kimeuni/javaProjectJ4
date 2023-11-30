package chat;

public class ChatGroupJVO {
	private int idx;
	private int saleBoardIdx;
	private String saleMid;
	private String myMid;
	private int alarm;
	
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
	public String getSaleMid() {
		return saleMid;
	}
	public void setSaleMid(String saleMid) {
		this.saleMid = saleMid;
	}
	public String getMyMid() {
		return myMid;
	}
	public void setMyMid(String myMid) {
		this.myMid = myMid;
	}
	public int getAlarm() {
		return alarm;
	}
	public void setAlarm(int alarm) {
		this.alarm = alarm;
	}
	@Override
	public String toString() {
		return "ChatGroupJVO [idx=" + idx + ", saleBoardIdx=" + saleBoardIdx + ", saleMid=" + saleMid + ", myMid="
				+ myMid + ", alarm=" + alarm + "]";
	}
}
