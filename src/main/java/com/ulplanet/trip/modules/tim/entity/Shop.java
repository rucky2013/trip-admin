package com.ulplanet.trip.modules.tim.entity;

import com.ulplanet.trip.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotNull;

/**
 * 购物Entity
 * Created by zhangxd on 15/11/08.
 */
public class Shop extends DataEntity<Shop> {

	private static final long serialVersionUID = 1L;

    private String name;
    private City city;
    private String type;
    private String description;
    private String address;
    private double longitude;
    private double latitude;
    private int score;
    private int level;
    private String worktime;
    private String cooper;
    private String published;

    public Shop() {
        super();
    }

    public Shop(String id, String name) {
        super(id);
        this.name = name;
    }

    @Length(min=1, max=255, message="名称长度必须介于 1 和 255 之间")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Length(min=0, max=2000, message="描述长度必须介于 1 和 2000 之间")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @NotNull(message="城市不能为空")
    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    @NotNull(message="类型不能为空")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Length(min=0, max=255, message="地址长度必须介于 1 和 255 之间")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    @Range(min = 0, max = 5, message = "分数必须介于 0 和 5 之间")
    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    @Range(min = 0, max = 5, message = "推荐等级必须介于 0 和 5 之间")
    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    @Length(min=0, max=255, message="营业时间长度必须介于 1 和 255 之间")
    public String getWorktime() {
        return worktime;
    }

    public void setWorktime(String worktime) {
        this.worktime = worktime;
    }

    public String getCooper() {
        return cooper;
    }

    public void setCooper(String cooper) {
        this.cooper = cooper;
    }

    public String getPublished() {
        return published;
    }

    public void setPublished(String published) {
        this.published = published;
    }
}