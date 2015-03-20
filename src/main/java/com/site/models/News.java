package com.site.models;

import javax.persistence.*;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-24
 * Time: 13:06
 */

@Entity
public class News extends BaseEntity{

    @Column
    private String title;

    @Column(length = 2048)
    private String text;

    @ManyToOne(cascade = CascadeType.ALL)
    private Image image;

    @Enumerated(EnumType.STRING)
    private Status status = Status.INACTIVE;

    public void copy(News news){
        this.title = news.getTitle();
        this.text = news.getText();
        this.status = news.getStatus();
    }

    public String getShortText(){
        if(text.length() > 35){
            return text.substring(0, 32) + "...";
        } else {
            return text;
        }
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
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
