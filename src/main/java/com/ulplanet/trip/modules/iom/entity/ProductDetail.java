package com.ulplanet.trip.modules.iom.entity;

import com.ulplanet.trip.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

/**
 * 产品明细Entity
 * Created by zhangxd on 15/12/01.
 */
public class ProductDetail extends DataEntity<ProductDetail> {

	private static final long serialVersionUID = 1L;

    /** 待测试 */
    public static final String STATUS_UNTEST = "1";
    /** 已测试 */
    public static final String STATUS_TESTED = "2";
    /** 待租 */
    public static final String STATUS_UNRENT = "3";
    /** 已租 */
    public static final String STATUS_RENTED = "4";
    /** 维修 */
    public static final String STATUS_REPAIR = "5";
    /** 报废 */
    public static final String STATUS_DISCARD = "9000";

    private Product product;
    private String code;
    private String device;
    private String status;
    private String comment;

    public ProductDetail() {
        super();
    }

    @NotNull
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Length(min=1, max=64, message="设备号长度必须介于 1 和 64 之间")
    public String getDevice() {
        return device;
    }

    public void setDevice(String device) {
        this.device = device;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Length(min=0, max=2000, message="备注长度必须介于 1 和 2000 之间")
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}