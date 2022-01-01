package com.example.chatproj.chatproj.controller;

import org.springframework.web.multipart.MultipartFile;

public class FileuploadForm {
	private int unum;
	private int cnum;
	MultipartFile fileupload;

	public int getUnum() {
		return unum;
	}

	public void setUnum(int unum) {
		this.unum = unum;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public MultipartFile getFileupload() {
		return fileupload;
	}

	public void setFileupload(MultipartFile fileupload) {
		this.fileupload = fileupload;
	}

	public MultipartFile getUserimg() {
		return fileupload;
	}

	public void setUserimg(MultipartFile userimg) {
		this.fileupload = userimg;
	}
	
}
