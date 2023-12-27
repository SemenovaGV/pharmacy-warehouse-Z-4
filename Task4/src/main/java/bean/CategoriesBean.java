package bean;

import entity.Category;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class CategoriesBean extends AbstractBean<Category> {
    
    @PersistenceContext(name = "Task4")
    EntityManager em;

    public CategoriesBean() {
        super(Category.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
}
