package com.java.pojo;

import java.io.Serializable;

public class TwoMenu implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long twoId;
    private String twoName;
    private String url;
    private Long parent;

    public Long getTwoId() {
        return twoId;
    }

    public void setTwoId(Long twoId) {
        this.twoId = twoId;
    }

    public String getTwoName() {
        return twoName;
    }

    public void setTwoName(String twoName) {
        this.twoName = twoName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Long getParent() {
        return parent;
    }

    public void setParent(Long parent) {
        this.parent = parent;
    }

    @Override
    public String toString() {
        return "TwoMenu{" +
                "twoId=" + twoId +
                ", twoName='" + twoName + '\'' +
                ", url='" + url + '\'' +
                ", parent=" + parent +
                '}';
    }
}
