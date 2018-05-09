package pl.coderslab.dao;

import org.springframework.stereotype.Component;
import pl.coderslab.entity.Article;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.awt.print.Book;
import java.time.LocalDateTime;
import java.util.List;


@Component
@Transactional
public class ArticleDao {


        @PersistenceContext
        EntityManager em;

        public void save(Article article) {
            article.setCreated(LocalDateTime.now());
            em.persist(article);
        }

        public void update(Article article) {
            Article oldArticle = this.findById( article.getId() );
            article.setCreated( oldArticle.getCreated() );

            article.setUpdated(LocalDateTime.now());
            em.merge(article);
        }

        public Article findById(long id) {
            return em.find(Article.class, id);
        }

        public void delete(Long id) {
            Article article = findById(id);
            em.remove( em.contains(article) ? article : em.merge(article) );
        }

        public List<Article> findAll () {
            Query query = em.createQuery("SELECT a FROM Article a");
            List<Article> allArticles = query.getResultList();
            return allArticles;
        }

    public List<Article> findLastest (int N) {
        Query query = em.createQuery("SELECT a FROM Article a order by created desc");
        query.setMaxResults(N);
        List<Article> allArticles = query.getResultList();
        return allArticles;
    }

    public List<Article> findByCategoryId (int N) {
            Query query = em.createQuery("SELECT a FROM Article a JOIN a.categories c where c.id="+N);
            List<Article> articlesByCategoryId = query.getResultList();
            return articlesByCategoryId;
    }

}
