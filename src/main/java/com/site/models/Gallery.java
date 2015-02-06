package com.site.models;

import javax.persistence.*;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-27
 * Time: 9:24
 */

@Entity
public class Gallery extends BaseEntity {

    @Column
    private String name;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private Image mainImage;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Image> gallery;

    @Enumerated(EnumType.STRING)
    private Status status;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Image getMainImage() {
        return mainImage;
    }

    public void setMainImage(Image mainImage) {
        this.mainImage = mainImage;
    }

    public List<Image> getGallery() {
        return gallery;
    }

    public void setGallery(List<Image> gallery) {
        this.gallery = gallery;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
