package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "categories")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;

    @Column(name="name")
    public String name;

    @Column(name = "parent_cat_id")
    public Long parent_cat_id;

    @Column(name="cat_level")
    public Long cat_level;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getParent_cat_id() {
        return parent_cat_id;
    }

    public void setParent_cat_id(Long parent_cat_id) {
        this.parent_cat_id = parent_cat_id;
    }

    public Long getCat_level() {
        return cat_level;
    }

    public void setCat_level(Long cat_level) {
        this.cat_level = cat_level;
    }
}
