package SaleBoard;

public class MidCategoryVO {
	private int idx;
	private int majorCategoryIdx;
	private String midCategory;
	
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
	public String getMidCategory() {
		return midCategory;
	}
	public void setMidCategory(String midCategory) {
		this.midCategory = midCategory;
	}
	@Override
	public String toString() {
		return "MidCategoryVO [idx=" + idx + ", majorCategoryIdx=" + majorCategoryIdx + ", midCategory=" + midCategory
				+ "]";
	}
}
