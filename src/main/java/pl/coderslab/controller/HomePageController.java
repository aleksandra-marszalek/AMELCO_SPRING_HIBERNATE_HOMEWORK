package pl.coderslab.controller;


import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.dao.ArticleDao;
import pl.coderslab.dao.CategoryDao;
import pl.coderslab.entity.Article;
import pl.coderslab.entity.Category;
import pl.coderslab.repository.ArticleRepository;

import java.awt.print.Book;
import java.util.List;

@Controller
public class HomePageController {

    @Autowired
    ArticleDao articleDao;

    @Autowired
    CategoryDao categoryDao;

    @Autowired
    ArticleRepository articleRepository;

    @GetMapping("/")
    public String showLast5(Model model) {
        List<Article> latestArticles = articleRepository.findArticlesByCreated();
        latestArticles = latestArticles.subList(0, 5);
        model.addAttribute("articles", latestArticles);
        return "home";
    }

    @GetMapping("/articles/{id}")
    public String showArticles(Model model, @PathVariable int id) {
        List<Article> articlesById = articleDao.findByCategoryId(id);
        String catName = categoryDao.findById(id).getName();
        model.addAttribute("category", catName);
        model.addAttribute("articles", articlesById);
            return "ArticlesById";
    }


    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryDao.findAll();
    }
}
