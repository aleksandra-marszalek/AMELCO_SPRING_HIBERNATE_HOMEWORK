package pl.coderslab.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.dao.ArticleDao;
import pl.coderslab.dao.AuthorDao;
import pl.coderslab.dao.CategoryDao;
import pl.coderslab.entity.Article;
import pl.coderslab.entity.Author;
import pl.coderslab.entity.Category;
import pl.coderslab.interfaces.ValidationDraft;

import javax.validation.Valid;
import java.awt.print.Book;
import java.util.List;

@Controller
public class DraftController {

    @Autowired
    ArticleDao articleDao;

    @Autowired
    CategoryDao categoryDao;

    @Autowired
    AuthorDao authorDao;

    @GetMapping("/draft")
    public String allDrafts(Model model) {
        List<Article> drafts = articleDao.findDrafts();
        model.addAttribute("articles", drafts);
        return "DraftList";
    }

    @GetMapping("draft/add")
    public String draftForm(Model model) {
        model.addAttribute("article", new Article());
        return "DraftForm";
    }

    @PostMapping("/draft/add")
    public String draftForm(@Valid @ModelAttribute Article article, BindingResult result) {
        if (result.hasErrors()) {
            return "DraftForm";
        }
        articleDao.save(article);
        return "redirect:/draft";
    }

    @GetMapping("/draft/edit/{id}")
    public String edit(Model model, @PathVariable long id) {
        Article article = articleDao.findById(id);
        //System.out.println(article.getCreated());
        model.addAttribute("article", article);
        return "DraftForm";
    }

    @PostMapping("/draft/edit/{id}")
    public String edit(@Valid @ModelAttribute Article article, @PathVariable long id, BindingResult result) {
        if (result.hasErrors()) {
            return "DraftForm";
        }
        articleDao.update(article);
        return "redirect:/draft";
    }

    @GetMapping("/draft/delete/{id}")
    public String delete(Model model, @PathVariable long id) {
        Article article = articleDao.findById(id);
        model.addAttribute("article", article);
        return "ArticleDelete";
    }

    @PostMapping("/draft/delete/{id}")
    public String delete(@ModelAttribute Article article, @PathVariable long id, @RequestParam String agree) {
        if (agree.equals("yes")) {
            articleDao.delete(article.getId());
        }
        return "redirect:/draft";
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
