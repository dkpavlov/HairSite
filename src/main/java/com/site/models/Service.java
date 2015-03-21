package com.site.models;

import javax.persistence.*;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-28
 * Time: 11:24
 */

@Entity
public class Service extends BaseEntity {

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private Image mainImage;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Image> gallery;

    @Column
    private String title;

    @Column
    private Double price;

    @Column
    @Deprecated
    private String summary;

    @Column
    private String description;

    @Enumerated(EnumType.STRING)
    private Status status = Status.INACTIVE;

    public void copy(Service service){
        this.title = service.getTitle();
        this.description = service.getDescription();
        this.price = service.getPrice();
        this.status = service.getStatus();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
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

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
