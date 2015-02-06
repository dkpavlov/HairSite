package com.site.models;

import javax.persistence.*;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-30
 * Time: 17:13
 */

@Entity
public class Product extends BaseEntity {

    @Column
    private String name;

    @Column
    private String description;

    @Enumerated(EnumType.STRING)
    private Status status;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private Image image;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
