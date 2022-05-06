package com.example.demo.controller;
import java.sql.SQLOutput;
import java.util.List;

import com.example.demo.model.Category;
import com.example.demo.service.CategoryService;

import org.springframework.aop.scope.ScopedProxyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class CategoryController {
    @Autowired
    CategoryService catService;

    @RequestMapping(value="/categories", method=RequestMethod.POST)
    public Category createCategory(@RequestBody Category cat) {
        System.out.println("Cat" + cat.name);
        return catService.createCategory(cat);
    }

    @RequestMapping(value="/categories", method=RequestMethod.GET)
    public List<Category> readCategories() {
        return catService.getCategory();
    }

    @RequestMapping(value="/categories/{catId}", method=RequestMethod.PUT)
    public Category readCategories(@PathVariable(value = "catId") Long id, @RequestBody Category catDetails) {
        return catService.updateCategory(id, catDetails);
    }

    @RequestMapping(value="/categories/{catId}", method=RequestMethod.DELETE)
    public void deleteCategories(@PathVariable(value = "catId") Long id) {
        catService.deleteCategory(id);
    }
}
