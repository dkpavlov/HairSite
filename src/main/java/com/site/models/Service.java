package com.site.models;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-28
 * Time: 11:24
 */

@Entity
public class Service extends BaseEntity {

    @Column
    private String name;

    @Column
    private Double price;

    @Column
    @Deprecated
    private String summary;

    @Column
    private String description;

    @Enumerated(EnumType.STRING)
    private Status status = Status.INACTIVE;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private Image mainImage;

    /* TODO add promotions */
    @Transient
    private MultipartFile file;

    public void copy(Service service){
        this.name = service.getName();
        this.description = service.getDescription();
        this.price = service.getPrice();
        this.status = service.getStatus();
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    /* TODO add promotions */

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
