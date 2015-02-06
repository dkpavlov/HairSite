package com.site.models;

import javax.persistence.*;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-27
 * Time: 9:34
 */

@Entity
public class Employee extends BaseEntity {

    @Column
    private String name;

    @Column
    private String summary;

    @Column
    private String description;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private Image mainImage;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Image> imagesList;

    @Enumerated(EnumType.STRING)
    private Status status;

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Image getMainImage() {
        return mainImage;
    }

    public void setMainImage(Image mainImage) {
        this.mainImage = mainImage;
    }

    public List<Image> getImagesList() {
        return imagesList;
    }

    public void setImagesList(List<Image> imagesList) {
        this.imagesList = imagesList;
    }
}
