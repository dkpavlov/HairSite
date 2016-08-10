package com.site.models;

import javax.persistence.*;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 16-08-10
 * Time: 11:24
 */

@Entity
public class UserServiceItemPrice extends BaseEntity {

    @ManyToOne
    private ServiceItem serviceItem;

    @Column
    private Double userPrice;

    public ServiceItem getServiceItem() {
        return serviceItem;
    }

    public void setServiceItem(ServiceItem serviceItem) {
        this.serviceItem = serviceItem;
    }

    public Double getUserPrice() {
        return userPrice;
    }

    public void setPrice(Double userPrice) {
        this.userPrice = userPrice;
    }
}