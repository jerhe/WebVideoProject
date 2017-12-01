package com.spimax.front.data;

public class DanmuItem {
	private String text;
	private String color;
	private int size;
	private int position;
	private long time;
	
	public DanmuItem() {
	}

	@Override
	public String toString() {
		return "DanmuItem [text=" + text + ", color=" + color + ", size=" + size + ", position=" + position + ", time="
				+ time + "]";
	}

	public DanmuItem(String text, String color, int size, int position, long time) {
		super();
		this.text = text;
		this.color = color;
		this.size = size;
		this.position = position;
		this.time = time;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getPosition() {
		return position;
	}

	public void setPosition(int position) {
		this.position = position;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}
	
}
