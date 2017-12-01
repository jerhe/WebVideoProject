package com.spimax.front.data;
import java.util.List;

import com.spimax.front.entity.Videos;

/**
 * ��ҳ����������
 * @author zhuzhen
 *
 */
public class HomeData {
	private List<Videos> nrData;//����
	private List<Videos> phData;//���а�
	public HomeData() {
	}
	
	@Override
	public String toString() {
		return "HomeData [nrData=" + nrData + ", phData=" + phData + "]";
	}
	public HomeData(List<Videos> nrData, List<Videos> phData) {
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
