package pl.coderslab.repository;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.entity.Article;
import pl.coderslab.entity.Author;

import java.util.List;


public interface ArticleRepository extends JpaRepository<Article, Long> {

    @Query("SELECT a FROM Article a order by a.created desc")
    List<Article> findArticlesByCreated();
//
//    @Query("SELECT a FROM Article a JOIN a.categories c where c.id = :id")
//    List<Article> findArticlesByCategoriesId(@Param("id") long id);
//
//    @Query("Select a From Article a where a.draft=true")
//    List<Article> findAllDrafts();


}
