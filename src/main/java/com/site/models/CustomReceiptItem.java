package com.site.models;

import org.codehaus.jackson.map.deser.ValueInstantiators;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 * Created by dimitar.pavlov.mus on 19.08.2016.
 */
@Entity
public class CustomReceiptItem extends BaseEntity {

    @Column
    private String name;

    @Column
    private Double singlePrice;

    @Column
    private Integer quantity;

    @Column
    private Double totalPrice;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getSinglePrice() {
        return singlePrice;
    }

    public void setSinglePrice(Double singlePrice) {
        this.singlePrice = singlePrice;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
