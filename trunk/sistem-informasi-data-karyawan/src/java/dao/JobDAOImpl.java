/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import model.Job;

/**
 *
 * @author Luckma
 */
public class JobDAOImpl extends GeneralDAOImpl
        implements JobDAO {

    public JobDAOImpl(EntityManager em) {
        super(em);
    }

    @Override
    public List<Job> gets(String id) throws Exception {
        List<Job> list = new ArrayList<Job>();
        try {
            em.getTransaction().begin();
            list = this.em.createQuery("SELECT o FROM Job o WHERE o.id LIKE :id").setParameter("id", "%" + id + "%").getResultList();
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw ex;
        }
        return list;
    }
}
