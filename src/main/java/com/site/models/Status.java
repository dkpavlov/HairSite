package com.site.models;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-27
 * Time: 9:28
 */

public enum Status {
    ACTIVE("Активно"),
    INACTIVE("Неактивно"),
    ARCHIVED("Архивирано");

    private String name;

    Status(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
