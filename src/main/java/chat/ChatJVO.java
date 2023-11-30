package chat;

public class ChatJVO {
	private int idx;
	private int chatIdx;
	private int saleBoardIdx;
	private String saleMid;
	private String myMid;
	private String chat;
	private String alarm;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getChatIdx() {
		return chatIdx;
	}
	public void setChatIdx(int chatIdx) {
		this.chatIdx = chatIdx;
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
	public String getChat() {
		return chat;
	}
	public void setChat(String chat) {
		this.chat = chat;
	}
	public String getAlarm() {
		return alarm;
	}
	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}
	@Override
	public String toString() {
		return "ChatJVO [idx=" + idx + ", chatIdx=" + chatIdx + ", saleBoardIdx=" + saleBoardIdx + ", saleMid="
				+ saleMid + ", myMid=" + myMid + ", chat=" + chat + ", alarm=" + alarm + "]";
	}
}
