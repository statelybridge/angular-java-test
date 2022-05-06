package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Category;
import com.example.demo.repository.CategoryRepository;
import java.util.List;

@Service
public class CategoryService {

    @Autowired
    CategoryRepository catRepository;

    // CREATE
    public Category createCategory(Category cat) {
        return catRepository.save(cat);
    }

    // READ
    public List<Category> getCategory() {
        return catRepository.findAll();
    }

    // DELETE
    public void deleteCategory(Long catId) {
        catRepository.deleteById(catId);
    }

    // UPDATE
    public Category updateCategory(Long catId, Category categoryDetails) {
        Category cat = catRepository.findById(catId).get();
        cat.setName(categoryDetails.getName());
        cat.setParent_cat_id(categoryDetails.getParent_cat_id());
        cat.setCat_level(categoryDetails.getCat_level());

        return catRepository.save(cat);
    }
}
