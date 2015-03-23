package com.site.models;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.util.ArrayList;
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

    @OneToOne(cascade = CascadeType.ALL)
    private Image mainImage;

    @ManyToMany(cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Image> images = new ArrayList<>();

    @Enumerated(EnumType.STRING)
    private Status status = Status.INACTIVE;

    @Transient
    private MultipartFile[] files;

    @Transient
    private MultipartFile file;

    @Transient
    private List<Long> oldImages;

    public void copy(Gallery gallery){
        this.name = gallery.getName();
        this.status = gallery.getStatus();
    }

    public MultipartFile[] getFiles() {
        return files;
    }

    public void setFiles(MultipartFile[] files) {
        this.files = files;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public List<Long> getOldImages() {
        return oldImages;
    }

    public void setOldImages(List<Long> oldImages) {
        this.oldImages = oldImages;
    }

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
}
