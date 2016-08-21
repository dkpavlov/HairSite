package com.site.models;

import com.site.utils.DoubleUtils;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by dimitar.pavlov.mus on 16.08.2016.
 */
@Entity
public class Receipt extends BaseEntity {

    public enum ReceiptStatus {
        COMMITTED, CONFIRMED;
    }

    @ManyToOne
    private User seller;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<ReceiptItem> items;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<CustomReceiptItem> customItems;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<ProductItem> products;

    @Column
    private Date createdAt;

    @Column
    private Double totalAmount;

    @Column
    private Double sellerAmount;

    @ElementCollection
    private List<String> logs;

    @Enumerated(EnumType.STRING)
    private ReceiptStatus receiptStatus = ReceiptStatus.COMMITTED;

    public User getSeller() {
        return seller;
    }

    public void setSeller(User seller) {
        this.seller = seller;
    }

    public List<ReceiptItem> getItems() {
        return items;
    }

    public void setItems(List<ReceiptItem> items) {
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

    public ReceiptStatus getReceiptStatus() {
        return receiptStatus;
    }

    public void setReceiptStatus(ReceiptStatus receiptStatus) {
        this.receiptStatus = receiptStatus;
    }

    public Double getTotalAmount() {
        return DoubleUtils.round(totalAmount, 2);
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Double getSellerAmount() {
        return DoubleUtils.round(sellerAmount, 2);
    }

    public void setSellerAmount(Double sellerAmount) {
        this.sellerAmount = sellerAmount;
    }

    public List<CustomReceiptItem> getCustomItems() {
        return customItems;
    }

    public void setCustomItems(List<CustomReceiptItem> customItems) {
        this.customItems = customItems;
    }

    public List<ProductItem> getProducts() {
        return products;
    }

    public void setProducts(List<ProductItem> products) {
        this.products = products;
    }
}
