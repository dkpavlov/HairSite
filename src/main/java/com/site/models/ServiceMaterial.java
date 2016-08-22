package com.site.models;

import org.codehaus.jackson.map.deser.ValueInstantiators;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 * Created by Dimitar.Pavlov.mus on 22.08.2016.
 */
@Entity
public class ServiceMaterial extends BaseEntity {

    @Column
    private String name;

    @Column
    private String price;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
