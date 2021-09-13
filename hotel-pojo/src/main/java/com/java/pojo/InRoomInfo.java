package com.java.pojo;

import java.io.Serializable;

public class InRoomInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long roomId;    //  房间主键

    private String customerName;    //  客人姓名

    private String gender;

    private String isVip;

    private String idcard;

    private String phone;

    private Float money;    //  押金

    private String createDate;  //  入住时间

    public Long getRoomId() {
        return roomId;
    }

    public void setRoomId(Long roomId) {
        this.roomId = roomId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getIsVip() {
        return isVip;
    }

    public void setIsVip(String isVip) {
        this.isVip = isVip;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Float getMoney() {
        return money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "InRoomInfo{" +
                "roomId=" + roomId +
                ", customerName='" + customerName + '\'' +
                ", gender='" + gender + '\'' +
                ", isVip='" + isVip + '\'' +
                ", idcard='" + idcard + '\'' +
                ", phone='" + phone + '\'' +
                ", money=" + money +
                ", createDate='" + createDate + '\'' +
                '}';
    }
}
