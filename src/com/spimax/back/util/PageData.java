package com.spimax.back.util;

import java.util.List;

/**
 * 分页数据类
 */
public class PageData<T> {
	private List<T> data; // 查找的数据

	private Integer total; // 总记录数

	private Integer pageSize;// 每页几行，每页的记录数

	private Integer page;// 页数
    
	private Integer totalPage;
	public PageData() {
		super();
	}

	public PageData(List<T> data, Integer total, Integer pageSize, Integer page) {
		super();
		this.data = data;
		this.total = total;
		this.pageSize = pageSize;
		this.page = page;
		this.totalPage=getTotalPage();
	}

	

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	/**
	 * 自定义方法gettotalPage 获取总页数
	 * 
	 * @return
	 */
	public int getTotalPage() {
		//  15   4
		int num = total / pageSize; //3
		if (total % pageSize != 0)
			num++;
		return num;
	}

	@Override
	public String toString() {
		return "{total:" + total + ",data:" + data + "}";
	}
}
