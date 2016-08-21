package com.site.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

/**
 * Created by dkpavlov on 8/20/16.
 */
@Entity
public class ServiceProduct extends BaseEntity {
    @Column
    private String name;

    @Column
    private Double salonPrice;

    @Enumerated(EnumType.STRING)
    private Status status = Status.ACTIVE;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getSalonPrice() {
        return salonPrice;
    }

    public void setSalonPrice(Double salonPrice) {
        this.salonPrice = salonPrice;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
