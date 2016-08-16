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

    @ManyToOne
    private User user;

    @Column
    private Double userPrice;

    public UserServiceItemPrice(Long serviceItemId, User user, Double userPrice) {
        this.serviceItem = new ServiceItem();
        this.serviceItem.setId(serviceItemId);
        this.user = user;
        this.userPrice = userPrice;
    }

    public UserServiceItemPrice() {
    }

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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setUserPrice(Double userPrice) {
        this.userPrice = userPrice;
    }
}