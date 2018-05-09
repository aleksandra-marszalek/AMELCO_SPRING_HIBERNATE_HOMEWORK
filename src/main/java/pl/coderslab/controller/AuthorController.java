package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.dao.ArticleDao;
import pl.coderslab.dao.AuthorDao;
import pl.coderslab.entity.Article;
import pl.coderslab.entity.Author;

import javax.validation.Valid;
import java.awt.print.Book;
import java.util.List;


    @Controller
    public class AuthorController {

        @Autowired
        AuthorDao authorDao;

        @Autowired
        ArticleDao articleDao;

        @GetMapping("/author")
        public String allAuthors(Model model) {
            List<Author> authors = authorDao.findAll();
            model.addAttribute("authors", authors);
            return "AuthorList";
        }

        @GetMapping("/author/add")
        public String authorForm(Model model) {
            model.addAttribute("author", new Author());
            return "AuthorForm";
        }

        @PostMapping("/author/add")
        public String authorForm(@Valid @ModelAttribute Author author, BindingResult result) {
            if (result.hasErrors()) {
                return "AuthorForm";
            }
            authorDao.save(author);
            return "redirect:/author";
        }

        @GetMapping("/author/edit/{id}")
        public String author(Model model, @PathVariable long id) {
            Author author = authorDao.findById(id);
            model.addAttribute("author", author);
            return "AuthorForm";
        }

        @PostMapping("/author/edit/{id}")
        public String edit(@Valid @ModelAttribute Author author, @PathVariable long id, BindingResult result) {
            if (result.hasErrors()) {
                return "AuthorForm";
            }
            authorDao.update(author);
            return "redirect:/author";
        }

        @GetMapping("/author/delete/{id}")
        public String delete(Model model, @PathVariable long id) {
            Author author = authorDao.findById(id);
            model.addAttribute("author", author);
            return "AuthorDelete";
        }

        @PostMapping("/author/delete/{id}")
        public String delete(@ModelAttribute Author author, @PathVariable long id, @RequestParam String agree, Model model) {
            if (agree.equals("yes")) {
                try {
                    authorDao.delete(author.getId());
                } catch (Exception e) {
                    model.addAttribute("error", "author");
                    return "Error";
                }
            }
            return "redirect:/author";
        }

        ////////// MODEL ATTRIBUTES //////////

        @ModelAttribute("articles")
        public List<Article> articles() {
            return articleDao.findAll();
        }


    }
