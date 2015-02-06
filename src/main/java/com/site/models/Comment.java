package com.site.models;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-30
 * Time: 17:31
 */

@Entity
public class Comment extends BaseEntity {

    @Column
    private String text;

    public Comment() {
    }

    public Comment(String text) {
        this.text = text;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
