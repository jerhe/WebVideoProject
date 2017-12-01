package com.spimax.front.data;

import java.util.List;

import com.spimax.front.entity.Videos;


public class BigleibieItem {
	private List<Videos> nrData;//ÄÚÈÝ
	private List<Videos> phData;//ÅÅÐÐ°ñ
	public BigleibieItem() {
	}
	@Override
	public String toString() {
		return "BigleibieItem [nrData=" + nrData + ", phData=" + phData + "]";
	}
	public BigleibieItem(List<Videos> nrData, List<Videos> phData) {
		super();
		this.nrData = nrData;
		this.phData = phData;
	}
	public List<Videos> getNrData() {
		return nrData;
	}
	public void setNrData(List<Videos> nrData) {
		this.nrData = nrData;
	}
	public List<Videos> getPhData() {
		return phData;
	}
	public void setPhData(List<Videos> phData) {
		this.phData = phData;
	}
	
}
