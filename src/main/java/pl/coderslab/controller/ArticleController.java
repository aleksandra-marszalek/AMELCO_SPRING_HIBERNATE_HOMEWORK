package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.dao.ArticleDao;
import pl.coderslab.dao.AuthorDao;
import pl.coderslab.dao.CategoryDao;
import pl.coderslab.entity.Article;
import pl.coderslab.entity.Author;
import pl.coderslab.entity.Category;


import java.util.List;


    @Controller
    public class ArticleController {

        @Autowired
        ArticleDao articleDao;

        @Autowired
        AuthorDao authorDao;
        
        @Autowired
        CategoryDao categoryDao;

        @GetMapping("/article")
        public String allArticles(Model model) {
            List<Article> articles = articleDao.findAll();
            model.addAttribute("articles", articles);
            return "ArticleList";
        }

        @GetMapping("/article/add")
        public String articleForm(Model model) {
            model.addAttribute("article", new Article());
            return "ArticleForm";
        }

        @PostMapping("/article/add")
        public String articleForm(@ModelAttribute Article article) {
            articleDao.save(article);
            return "redirect:/article";
        }

        @GetMapping("/article/edit/{id}")
        public String article(Model model, @PathVariable long id) {
            Article article = articleDao.findById(id);
            //System.out.println(article.getCreated());
            model.addAttribute("article", article);
            return "ArticleForm";
        }

        @PostMapping("/article/edit/{id}")
        public String edit(@ModelAttribute Article article, @PathVariable long id) {
            articleDao.update(article);
            return "redirect:/article";
        }

        @GetMapping("/article/delete/{id}")
        public String delete(Model model, @PathVariable long id) {
            Article article = articleDao.findById(id);
            model.addAttribute("article", article);
            return "ArticleDelete";
        }

        @PostMapping("/article/delete/{id}")
        public String delete(@ModelAttribute Article article, @PathVariable long id, @RequestParam String agree) {
            if (agree.equals("yes")) {
                articleDao.delete(article.getId());
            }
            return "redirect:/article";
        }

        ////////// MODEL ATTRIBUTES //////////


        @ModelAttribute("categories")
        public List<Category> categories() {
            return categoryDao.findAll();
        }

        @ModelAttribute("authors")
        public List<Author> authors() {return authorDao.findAll();
        }



}
