package com.site.models;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-30
 * Time: 17:28
 */

@Entity
public class BlogPost extends BaseEntity {

    @Column
    private String title;

    @Column
    private String body;

    @Column
    private Boolean promoted;

    @Enumerated(EnumType.STRING)
    private Status status;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private Image image;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Image> imageList;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Comment> commentList;

    public boolean addComment(String text){
        if(this.commentList == null){
            this.commentList = new ArrayList<Comment>();
        }
        return this.commentList.add(new Comment(text));
    }

    public Boolean getPromoted() {
        return promoted;
    }

    public void setPromoted(Boolean promoted) {
        this.promoted = promoted;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public List<Image> getImageList() {
        return imageList;
    }

    public void setImageList(List<Image> imageList) {
        this.imageList = imageList;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }
}
