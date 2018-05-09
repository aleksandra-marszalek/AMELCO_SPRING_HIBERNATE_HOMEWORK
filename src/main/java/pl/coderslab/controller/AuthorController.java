package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.dao.ArticleDao;
import pl.coderslab.dao.AuthorDao;
import pl.coderslab.entity.Article;
import pl.coderslab.entity.Author;

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
        public String authorForm(@ModelAttribute Author author) {
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
        public String edit(@ModelAttribute Author author, @PathVariable long id) {
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
        public String delete(@ModelAttribute Author author, @PathVariable long id, @RequestParam String agree) {
            if (agree.equals("yes")) {
                authorDao.delete(author.getId());
            }
            return "redirect:/author";
        }

        ////////// MODEL ATTRIBUTES //////////

        @ModelAttribute("articles")
        public List<Article> articles() {
            return articleDao.findAll();
        }


    }
