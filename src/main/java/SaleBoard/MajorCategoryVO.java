package SaleBoard;
//대분류
public class MajorCategoryVO {
	private int idx;
	private String majorCategory;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMajorCategory() {
		return majorCategory;
	}
	public void setMajorCategory(String majorCategory) {
		this.majorCategory = majorCategory;
	}
	@Override
	public String toString() {
		return "MajorCategoryVO [idx=" + idx + ", majorCategory=" + majorCategory + "]";
	}
}
