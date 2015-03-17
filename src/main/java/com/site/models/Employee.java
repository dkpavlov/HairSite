package com.site.models;

import javax.persistence.*;

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
    private String experience;

    @Column
    private String description;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private Image mainImage;

    @Enumerated(EnumType.STRING)
    private Status status;

    @ManyToOne
    private Salon salon;

    public Salon getSalon() {
        return salon;
    }

    public void setSalon(Salon salon) {
        this.salon = salon;
    }

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

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
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
}
