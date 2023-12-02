package chat;

public class ChatJVO {
	private int idx;
	private int chatIdx;
	private int saleBoardIdx;
	private String saleMid;
	private String myMid;
	private String chat;
	private String alarm;
	private String chatDate;
	private String whoChatMid;
	
	private int totAlarm;

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

	public String getChatDate() {
		return chatDate;
	}

	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}

	public String getWhoChatMid() {
		return whoChatMid;
	}

	public void setWhoChatMid(String whoChatMid) {
		this.whoChatMid = whoChatMid;
	}

	public int getTotAlarm() {
		return totAlarm;
	}

	public void setTotAlarm(int totAlarm) {
		this.totAlarm = totAlarm;
	}

	@Override
	public String toString() {
		return "ChatJVO [idx=" + idx + ", chatIdx=" + chatIdx + ", saleBoardIdx=" + saleBoardIdx + ", saleMid="
				+ saleMid + ", myMid=" + myMid + ", chat=" + chat + ", alarm=" + alarm + ", chatDate=" + chatDate
				+ ", whoChatMid=" + whoChatMid + ", totAlarm=" + totAlarm + "]";
	}
}
