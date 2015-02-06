package com.site.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

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

    @Column
    private String summary;

    @Column
    private String description;

    @Enumerated(EnumType.STRING)
    private Status status;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
