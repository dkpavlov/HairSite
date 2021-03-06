package com.site.models;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: imishev
 * Date: 14-6-9
 * Time: 15:55
 */

@Entity
public class User extends BaseEntity {

    @Column
    @Size(min = 3, max = 45)
    @NotBlank
    private String username;

    @Column
    private String password;

    @Column
    private String role = "ADMINISTRATOR";

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    List<UserServiceItemPrice> prices;

    @Transient
    private String password1;

    @Transient
    private String password2;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword1() {
        return password1;
    }

    public void setPassword1(String password1) {
        this.password1 = password1;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public List<UserServiceItemPrice> getPrices() {
        return prices;
    }

    public void setPrices(List<UserServiceItemPrice> prices) {
        this.prices = prices;
    }
}