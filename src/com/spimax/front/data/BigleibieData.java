package com.spimax.front.data;

import java.util.HashMap;
import java.util.List;

import com.spimax.back.entity.VideoType;

public class BigleibieData {
	private List<VideoType> listType;
	private HashMap<Integer, BigleibieItem> bigleibieData;
	public BigleibieData() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "BigleibieData [listType=" + listType + ", bigleibieData=" + bigleibieData + "]";
	}
	public List<VideoType> getListType() {
		return listType;
	}
	public void setListType(List<VideoType> listType) {
		this.listType = listType;
	}
	public HashMap<Integer, BigleibieItem> getBigleibieData() {
		return bigleibieData;
	}
	public void setBigleibieData(HashMap<Integer, BigleibieItem> bigleibieData) {
		this.bigleibieData = bigleibieData;
	}
	public BigleibieData(List<VideoType> listType, HashMap<Integer, BigleibieItem> bigleibieData) {
		super();
		this.listType = listType;
		this.bigleibieData = bigleibieData;
	}
	
}
