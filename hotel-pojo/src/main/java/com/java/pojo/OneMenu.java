package com.java.pojo;

import java.io.Serializable;
import java.util.List;

public class OneMenu implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long oneId;
    private String oneName;
    private List<TwoMenu> twoMenuList;

    public Long getOneId() {
        return oneId;
    }

    public void setOneId(Long oneId) {
        this.oneId = oneId;
    }

    public String getOneName() {
        return oneName;
    }

    public void setOneName(String oneName) {
        this.oneName = oneName;
    }

    public List<TwoMenu> getTwoMenuList() {
        return twoMenuList;
    }

    public void setTwoMenuList(List<TwoMenu> twoMenuList) {
        this.twoMenuList = twoMenuList;
    }

    @Override
    public String toString() {
        return "OneMenu{" +
                "oneId=" + oneId +
                ", oneName='" + oneName + '\'' +
                ", twoMenuList=" + twoMenuList +
                '}';
    }
}
