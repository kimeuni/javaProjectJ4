package SaleBoard;

public class SmallCategoryVO {
	private int idx;
	private int majorCategoryIdx;
	private int midCategoryIdx;
	private String smallCategory;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMajorCategoryIdx() {
		return majorCategoryIdx;
	}
	public void setMajorCategoryIdx(int majorCategoryIdx) {
		this.majorCategoryIdx = majorCategoryIdx;
	}
	public int getMidCategoryIdx() {
		return midCategoryIdx;
	}
	public void setMidCategoryIdx(int midCategoryIdx) {
		this.midCategoryIdx = midCategoryIdx;
	}
	public String getSmallCategory() {
		return smallCategory;
	}
	public void setSmallCategory(String smallCategory) {
		this.smallCategory = smallCategory;
	}
	@Override
	public String toString() {
		return "SmallCategoryVO [idx=" + idx + ", majorCategoryIdx=" + majorCategoryIdx + ", midCategoryIdx="
				+ midCategoryIdx + ", smallCategory=" + smallCategory + "]";
	}
}
