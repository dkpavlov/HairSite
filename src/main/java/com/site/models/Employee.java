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

    @Column(length = 2048)
    private String activity;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private Image image;

    @Column
    private String email;

    @Column
    private String phoneNumber;

    @Enumerated(EnumType.STRING)
    private Status status = Status.INACTIVE;

    @ManyToOne
    private Salon salon;

    public void copy(Employee employee){
        this.name = employee.getName();
        this.experience = employee.getExperience();
        this.description = employee.getDescription();
        this.activity = employee.getActivity();
        this.email = employee.getEmail();
        this.phoneNumber = employee.getPhoneNumber();
        this.status = employee.getStatus();
        this.salon = employee.getSalon();
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

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

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }
}
