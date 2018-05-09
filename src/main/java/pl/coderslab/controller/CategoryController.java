package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.dao.ArticleDao;
import pl.coderslab.dao.CategoryDao;
import pl.coderslab.entity.Article;
import pl.coderslab.entity.Category;

import java.util.List;

@Controller
public class CategoryController {

    @Autowired
    CategoryDao categoryDao;

    @Autowired
    ArticleDao articleDao;

    @GetMapping("/category")
    public String allCategories (Model model) {
        List<Category> categories = categoryDao.findAll();
        model.addAttribute("categories", categories);
        return "CategoriesList";
    }

    @GetMapping("/category/add")
    public String categoryForm(Model model) {
        model.addAttribute("category", new Category());
        return "CategoryForm";
    }

    @PostMapping("/category/add")
    public String categoryForm(@ModelAttribute Category category) {
        categoryDao.save(category);
        return "redirect:/category";
    }

    @GetMapping("/category/edit/{id}")
    public String category(Model model, @PathVariable long id) {
        Category category = categoryDao.findById(id);
        model.addAttribute("category", category);
        return "CategoryForm";
    }

    @PostMapping("/category/edit/{id}")
    public String edit(@ModelAttribute Category category, @PathVariable long id) {
        categoryDao.update(category);
        return "redirect:/category";
    }

    @GetMapping("/category/delete/{id}")
    public String delete(Model model, @PathVariable long id) {
        Category category = categoryDao.findById(id);
        model.addAttribute("category", category);
        return "CategoryDelete";
    }

    @PostMapping("/category/delete/{id}")
    public String delete(@ModelAttribute Category category, @PathVariable long id, @RequestParam String agree) {
        if (agree.equals("yes")) {
            categoryDao.delete(category.getId());
        }
        return "redirect:/category";
    }

    ////////// MODEL ATTRIBUTES //////////


    @ModelAttribute("articles")
    public List<Article> articles() {
        return articleDao.findAll();
    }
}
