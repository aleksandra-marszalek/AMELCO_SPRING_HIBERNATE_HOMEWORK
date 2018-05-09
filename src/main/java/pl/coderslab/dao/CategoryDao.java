package pl.coderslab.dao;

import org.springframework.stereotype.Component;
import pl.coderslab.entity.Category;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;



    @Component
    @Transactional
    public class CategoryDao {


        @PersistenceContext
        EntityManager em;

        public void save(Category category) {
            em.persist(category);
        }

        public void update(Category category) {
            em.merge(category);
        }

        public Category findById(long id) {
            return em.find(Category.class, id);
        }

        public void delete(Long id) {
            Category category = findById(id);
            em.remove( em.contains(category) ? category : em.merge(category) );
        }

        public List<Category> findAll () {
            Query query = em.createQuery("SELECT a FROM Category a");
            List<Category> allCategories = query.getResultList();
            return allCategories;
        }
    }
