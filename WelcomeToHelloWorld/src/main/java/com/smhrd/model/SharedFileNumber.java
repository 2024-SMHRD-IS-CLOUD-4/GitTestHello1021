package com.smhrd.model;

public class SharedFileNumber {
	private static SharedFileNumber instance = new SharedFileNumber();
    private int fileNum = 99999; // 초기값 설정

    private SharedFileNumber() {}

    public static SharedFileNumber getInstance() {
        return instance;
    }

    public synchronized int getFileNum() {
        return fileNum;
    }

    public synchronized void setFileNum(int fileNum) {
        this.fileNum = fileNum;
    }
}
