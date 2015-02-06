package com.site.models;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-24
 * Time: 13:27
 */

@Entity
public class Image extends BaseEntity {

    @Column
    private String fileName;

    @Column
    private String text;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
