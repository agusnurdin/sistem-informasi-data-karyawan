/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import model.Users;

/**
 *
 * @author Joni_Geol
 */
public class UsersDAOImpl extends GeneralDAOImpl
        implements UsersDAO {

    public UsersDAOImpl(EntityManager em) {
        super(em);
    }

    @Override
    public Users get(Long id) throws Exception {
        Users obj = null;
        try {
            em.getTransaction().begin();
            obj = em.find(Users.class, id);
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw ex;
        }
        return obj;
    }

    @Override
    public Users get(String username, String password) throws Exception {
        Users obj = null;
        try {
            em.getTransaction().begin();
            obj = (Users) this.em.createQuery("SELECT o FROM Users o WHERE o.username =:username and o.password=:password").setParameter("username", username).setParameter("password", password).getSingleResult();
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw ex;
        }
        return obj;
    }

    @Override
    public List<Users> gets(String id) throws Exception {
        List<Users> list = new ArrayList<Users>();
        try {
            em.getTransaction().begin();
            list = this.em.createQuery("SELECT o FROM Users o WHERE o.id LIKE :id").setParameter("id", "%" + id + "%").getResultList();
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw ex;
        }
        return list;
    }
}
