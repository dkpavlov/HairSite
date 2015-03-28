package com.site.models;

import javax.persistence.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-30
 * Time: 17:15
 */

@Entity
public class Offer extends BaseEntity {

    private static DateFormat df = new SimpleDateFormat("dd/MM/yyyy");

    @Column
    private String name;

    @Column
    private Double price;

    @Column(name = "date_from")
    private Date from;

    @Column(name = "date_to")
    private Date to;

    @ManyToOne
    private Product product;

    @ManyToOne
    private Service service;

    @Enumerated(EnumType.STRING)
    private Status status = Status.INACTIVE;

    @Transient
    String toAsString, fromAsString;

    public void copy(Offer offer){
        this.name = offer.getName();
        this.price = offer.getPrice();
        this.from = offer.getFrom();
        this.to = offer.getTo();
        this.status = offer.getStatus();
    }

    public String getToAsString(){
        return to != null ? df.format(to) : null;

    }

    public void setToAsString(String to){
        try{
            this.to = df.parse(to);
        } catch (Exception e){
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFromAsString(){
        return from != null ? df.format(from) : null;
    }

    public void setFromAsString(String from){
        try {
            this.from = df.parse(from);
        } catch (ParseException e) {
        }
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Date getFrom() {
        return from;
    }

    public void setFrom(Date from) {
        this.from = from;
    }

    public Date getTo() {
        return to;
    }

    public void setTo(Date to) {
        this.to = to;
    }


}
