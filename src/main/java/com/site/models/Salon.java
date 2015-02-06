package com.site.models;

import javax.persistence.*;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-27
 * Time: 9:18
 */

@Entity
public class Salon extends BaseEntity {

    @Column
    private String name;

    @Column
    private String information;

    @ManyToOne(targetEntity = Image.class)
    private List<Image> images;

    //TODO contacts

    @Enumerated(EnumType.STRING)
    private Status status;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
