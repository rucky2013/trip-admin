package com.ulplanet.trip.modules.iom.entity;

import com.ulplanet.trip.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

/**
 * 产品Entity
 * Created by zhangxd on 15/12/01.
 */
public class Product extends DataEntity<Product> {

	private static final long serialVersionUID = 1L;

    public static final String USE_DETAIL_YES = "1";
    public static final String USE_DETAIL_NO = "0";

    private String name;
    private String code;
    private String unit;
    private double avgPrice;
    private double totalAmt;
    private double rentAmt;
    private double rsvAmt;
    private double avlAmt;
    private double lowLimit;
    private String useDetail = USE_DETAIL_NO;
    private String comment;

    public Product() {
        super();
    }

    public Product(String id) {
        super(id);
    }

    public Product(String id, String name) {
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

    @Length(min=0, max=10, message="编码长度必须介于 1 和 10 之间")
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public double getAvgPrice() {
        return avgPrice;
    }

    public void setAvgPrice(double avgPrice) {
        this.avgPrice = avgPrice;
    }

    public double getTotalAmt() {
        return totalAmt;
    }

    public void setTotalAmt(double totalAmt) {
        this.totalAmt = totalAmt;
    }

    public double getRentAmt() {
        return rentAmt;
    }

    public void setRentAmt(double rentAmt) {
        this.rentAmt = rentAmt;
    }

    public double getRsvAmt() {
        return rsvAmt;
    }

    public void setRsvAmt(double rsvAmt) {
        this.rsvAmt = rsvAmt;
    }

    public double getAvlAmt() {
        return avlAmt;
    }

    public void setAvlAmt(double avlAmt) {
        this.avlAmt = avlAmt;
    }

    public double getLowLimit() {
        return lowLimit;
    }

    public void setLowLimit(double lowLimit) {
        this.lowLimit = lowLimit;
    }

    public String getUseDetail() {
        return useDetail;
    }

    public void setUseDetail(String useDetail) {
        this.useDetail = useDetail;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

}