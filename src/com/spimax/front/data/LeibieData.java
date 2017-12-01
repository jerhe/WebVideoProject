package com.spimax.front.data;

import com.spimax.back.entity.VideoType;
import com.spimax.front.util.PageData;

public class LeibieData<T> {
	private PageData<T> pageData;
	private VideoType videoType;
	public LeibieData() {
		// TODO Auto-generated constructor stub
	}
	public PageData<T> getPageData() {
		return pageData;
	}
	public void setPageData(PageData<T> pageDate) {
		this.pageData = pageDate;
	}
	public VideoType getVideoType() {
		return videoType;
	}
	public void setVideoType(VideoType videoType) {
		this.videoType = videoType;
	}
	public LeibieData(PageData<T> pageData, VideoType videoType) {
		super();
		this.pageData = pageData;
		this.videoType = videoType;
	}
	@Override
	public String toString() {
		return "LeibieData [pageData=" + pageData + ", videoType=" + videoType + "]";
	}
	
}
