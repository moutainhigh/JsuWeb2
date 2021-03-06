package  com.jsu.commons.page;
/**
 * Description:分页器，包含分页所需要的信息
 * @author  Robin
 * @version V1.0 
 * @createDateTime：2014-10-30  11:35:26 
 * @Company: 
 * @Copyright: Copyright (c) 2014
 **/
public class Paginator {
	/**
	 * 分页中要显示的页数
	 */
	private int showPage=3;
	/**
	 * 每页的记录数
	 */
	private int pageSize = 2; // 页大小
	/**
	 * 总记录数
	 */
	private int totalCount = 0; 

	/**
	 * 当前页号
	 */
	private int currentPage = 0; // 当前页号//每页记录数
    private int currentFlag=1;

	/**
	 * 页面显示的排序号
	 */
	private int index = 0; 
	
	/**
	 * 总页数
	 */
	private int totalPage = 0;
	
	 //是否分页
	private boolean pagination=false; //是否分页

	public Paginator() {

	}
	public void initPage(int totalCount,int pageSize,int currentPage){
		this.totalCount=totalCount;
		this.pageSize=pageSize;
		
		totalPage=(totalCount/pageSize)+(totalCount % pageSize>0?1:0);
	}

	public int getCurrentPage() {
		return totalCount >= 0 ? currentPage + 1 : currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage-1;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getStartIndex() {
		return pageSize * currentPage;
	}

	public int getIndex() {
		return pageSize * currentPage + ++index;
	}

	public int getEndIndex() {
		return pageSize * (currentPage + 1);
	}
	public int getTotalPage() {
		totalPage = (int) Math.ceil((float) getTotalCount() / (float) pageSize); 
		return totalPage;
	}
	public int getShowPage() {
		return showPage;
	}

	public void setShowPage(int showPage) {
		this.showPage = showPage;
	}

	public boolean isPagination() {
		return pagination;
	}

	public void setPagination(boolean pagination) {
		this.pagination = pagination;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentFlag() {
		return currentFlag;
	}
	public void setCurrentFlag(int currentFlag) {
		this.currentFlag = currentFlag;
	}
	
	
}
