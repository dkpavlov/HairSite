package com.site.models;

import javax.persistence.*;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 5/30/15
 * Time: 12:54
 */
@Entity
public class GalleryLink extends BaseEntity {

    @OneToOne(cascade = CascadeType.ALL)
    private Image image;

    @Column
    private String name;

    @Column
    private String href;

    @Column
    @Enumerated(EnumType.STRING)
    private Status status = Status.INACTIVE;

    public void copy(GalleryLink galleryLink){
        this.name = galleryLink.getName();
        this.status = galleryLink.getStatus();
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

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
