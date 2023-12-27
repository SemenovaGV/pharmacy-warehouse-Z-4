package bean;

import entity.Item;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;

@Stateless
public class ItemsBean extends AbstractBean<Item> {
    
    @PersistenceContext
    EntityManager em;

    public ItemsBean() {
        super(Item.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public List<Item> findByCategory(Object category) {
        var cb = em.getCriteriaBuilder();
        var cq = cb.createQuery(Item.class);
        var root = cq.from(Item.class);
        cq.select(root).where(cb.equal(root.get("categoryId"), category));
        return em.createQuery(cq).getResultList();
    }

}
