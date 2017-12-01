package com.spimax.front.data;

import java.util.HashMap;
import java.util.List;

import com.spimax.back.entity.Users;
import com.spimax.back.entity.VideoType;
import com.spimax.front.entity.Comment;
import com.spimax.front.entity.Videos;

/**
 * ��Ƶҳ�洫�ݵ�����
 * @author zhuzhen
 *
 */
public class PlayerData {
	private Users user;//�û�����
	private Videos video;//��������
	private List<DanmuItem> danmuData;//��Ļ�б�
	private List<Comment> commitsList;//�����б�
	private VideoType videoType;//��Ƶ����
	private HashMap<Integer, Users> listUser;//�û������б�
	
	public PlayerData() {
	}
	public PlayerData(Users user, Videos video, List<DanmuItem> danmuData, List<Comment> commitsList,
			VideoType videoType, HashMap<Integer, Users> listUser) {
		super();
		this.user = user;
		this.video = video;
		this.danmuData = danmuData;
		this.commitsList = commitsList;
		this.videoType = videoType;
		this.listUser = listUser;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public Videos getVideo() {
		return video;
	}
	public void setVideo(Videos video) {
		this.video = video;
	}
	public List<DanmuItem> getDanmuData() {
		return danmuData;
	}
	public void setDanmuData(List<DanmuItem> danmuData) {
		this.danmuData = danmuData;
	}
	public List<Comment> getCommitsList() {
		return commitsList;
	}
	public void setCommitsList(List<Comment> commitsList) {
		this.commitsList = commitsList;
	}
	public VideoType getVideoType() {
		return videoType;
	}
	public void setVideoType(VideoType videoType) {
		this.videoType = videoType;
	}
	public HashMap<Integer, Users> getListUser() {
		return listUser;
	}
	public void setListUser(HashMap<Integer, Users> listUser) {
		this.listUser = listUser;
	}
	@Override
	public String toString() {
		return "PlayerData [user=" + user + ", video=" + video + ", danmuData=" + danmuData + ", commitsList="
				+ commitsList + ", videoType=" + videoType + ", listUser=" + listUser + "]";
	}
	
	
	
}
