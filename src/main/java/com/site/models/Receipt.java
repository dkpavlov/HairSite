package com.site.models;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by dimitar.pavlov.mus on 16.08.2016.
 */
@Entity
public class Receipt extends BaseEntity {

    @ManyToOne
    private User seller;

    @ManyToMany
    private List<ServiceItem> items;

    @Column
    private Date createdAt;

    @ElementCollection
    private List<String> logs;

    public User getSeller() {
        return seller;
    }

    public void setSeller(User seller) {
        this.seller = seller;
    }

    public List<ServiceItem> getItems() {
        return items;
    }

    public void setItems(List<ServiceItem> items) {
        this.items = items;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public List<String> getLogs() {
        return logs;
    }

    public void setLogs(List<String> logs) {
        this.logs = logs;
    }
}
