package com.site.models;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 16-08-10
 * Time: 11:24
 */

@Entity
public class ServiceItem extends BaseEntity {

    @Column
    private String name;

    @Column
    private Double salonPrice;
    
    @Column
    private Double materialsCost;

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

    public Double getMaterialsCost() {
        return materialsCost;
    }

    public void setMaterialsCost(Double materialsCost) {
        this.materialsCost = materialsCost;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
