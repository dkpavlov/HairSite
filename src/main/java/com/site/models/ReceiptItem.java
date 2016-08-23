package com.site.models;

import com.site.utils.DoubleUtils;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

/**
 * Created by dimitar.pavlov.mus on 17.08.2016.
 */
@Entity
public class ReceiptItem extends BaseEntity{

    @ManyToOne
    private ServiceItem item;

    @ManyToOne
    private ServiceMaterial material;

    @Column
    private Integer quantity = 0;

    @Column
    private Integer materialQuantity = 0;

    public ServiceItem getItem() {
        return item;
    }

    public void setItem(ServiceItem item) {
        this.item = item;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public ServiceMaterial getMaterial() {
        return material;
    }

    public void setMaterial(ServiceMaterial material) {
        this.material = material;
    }

    public Integer getMaterialQuantity() {
        return materialQuantity;
    }

    public void setMaterialQuantity(Integer materialQuantity) {
        this.materialQuantity = materialQuantity;
    }

    @Transient
    public Double getTotalPrice(){
        Double totalPrice = 0.0;
        if(item != null && item.getSalonPrice() != null){
            totalPrice = item.getSalonPrice() * quantity;
        }
        return DoubleUtils.round(totalPrice, 2);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        ReceiptItem that = (ReceiptItem) o;

        if (item != null ? !item.equals(that.item) : that.item != null) return false;
        if (quantity != null ? !quantity.equals(that.quantity) : that.quantity != null) return false;
        return materialQuantity != null ? materialQuantity.equals(that.materialQuantity) : that.materialQuantity == null;

    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + (item != null ? item.hashCode() : 0);
        result = 31 * result + (quantity != null ? quantity.hashCode() : 0);
        result = 31 * result + (materialQuantity != null ? materialQuantity.hashCode() : 0);
        return result;
    }
}
