package com.site.models;

import com.site.utils.DoubleUtils;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

/**
 * Created by dimitar.pavlov.mus on 17.08.2016.
 */
@Entity
public class ReceiptItem extends BaseEntity{

    @ManyToOne
    private ServiceItem item;

    @Column
    private Integer quantity = 0;

    @ManyToOne
    private Receipt receipt;

    public ServiceItem getItem() {
        return item;
    }

    public void setItem(ServiceItem item) {
        this.item = item;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Transient
    public Double getTotalPrice(){
        Double totalPrice = 0.0;
        if(item != null && item.getSalonPrice() != null){
            totalPrice = item.getSalonPrice() * quantity;
        }
        return DoubleUtils.round(totalPrice, 2);
    }
}
