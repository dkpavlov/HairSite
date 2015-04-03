package com.site.models;

import javax.persistence.*;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 4/2/15
 * Time: 21:07
 */

@Entity
public class Carousel extends BaseEntity{

    @OneToOne(cascade = CascadeType.ALL)
    private Image image;

    @Column
    private String name;

    @Column
    @Enumerated(EnumType.STRING)
    private Status status = Status.INACTIVE;

    public void copy(Carousel carousel){
        this.image = carousel.getImage();
        this.name = carousel.getName();
        this.status = carousel.getStatus();
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
