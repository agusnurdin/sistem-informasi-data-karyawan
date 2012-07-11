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
    public List<Job> gets() throws Exception {
        List<Job> list = new ArrayList<Job>();
        try {
            em.getTransaction().begin();
            list = em.createQuery("SELECT o FROM Job o").getResultList();
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw ex;
        }
        return list;
    }
}
