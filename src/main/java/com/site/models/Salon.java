package com.site.models;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-27
 * Time: 9:18
 */

@Entity
public class Salon extends BaseEntity {

    @Column
    private String name;

    @Column
    private String information;

    @Column
    private String providedServices;

    @ManyToOne(targetEntity = Image.class)
    private List<Image> images = new ArrayList<>();

    @ManyToOne
    private Contact contact;

    @Enumerated(EnumType.STRING)
    private Status status = Status.INACTIVE;

    @Transient
    private MultipartFile[] files;

    @Transient
    private List<Long> oldImages;

    public void copy(Salon salon){
        this.name = salon.getName();
        this.information = salon.getInformation();
        this.providedServices = salon.getProvidedServices();
        this.contact = salon.getContact();
        this.status = salon.getStatus();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getProvidedServices() {
        return providedServices;
    }

    public void setProvidedServices(String providedServices) {
        this.providedServices = providedServices;
    }

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

    public MultipartFile[] getFiles() {
        return files;
    }

    public void setFiles(MultipartFile[] files) {
        this.files = files;
    }

    public List<Long> getOldImages() {
        return oldImages;
    }

    public void setOldImages(List<Long> oldImages) {
        this.oldImages = oldImages;
    }
}
