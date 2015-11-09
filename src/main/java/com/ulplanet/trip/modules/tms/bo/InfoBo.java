package com.ulplanet.trip.modules.tms.bo;

/**
 * Created by makun on 2015/10/30.
 */
public class InfoBo {
    private String id;
    private String name;
    private String address;
    private String phone;
    private String longitude;
    private String latitude;
    private String description;
    private String phoneCol = "-1";

    public String getPhoneCol() {
        return phoneCol;
    }

    public void setPhoneCol(String phoneCol) {
        this.phoneCol = phoneCol;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
