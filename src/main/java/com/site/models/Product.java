package com.site.models;

import org.springframework.web.multipart.MultipartFile;

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

    @Column
    private Double price;

    @Enumerated(EnumType.STRING)
    private Status status = Status.INACTIVE;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private Image image;

    @Transient
    private MultipartFile file;

    /* TODO add promotions */

    public void copy(Product product){
        this.name = product.getName();
        this.description = product.getDescription();
        this.price = product.getPrice();
        this.status = product.getStatus();
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

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
