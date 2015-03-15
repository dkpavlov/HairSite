package com.site.models;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 3/15/15
 * Time: 18:57
 */

@Entity
public class Message extends BaseEntity {

    @Column
    private String text;

    @Column
    private String name;

    @Column
    private String email;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getShortText(){
        return text.substring(0, 50);
    }
}
