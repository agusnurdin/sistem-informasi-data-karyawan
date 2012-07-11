/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import model.Department;

/**
 *
 * @author Luckma
 */
public class DepartmentDAOImpl extends GeneralDAOImpl
        implements DepartmentDAO {

    public DepartmentDAOImpl(EntityManager em) {
        super(em);
    }

    @Override
    public Department get(String id) throws Exception {
        Department o = null;
        try {
            em.getTransaction().begin();
            o = em.find(Department.class, id);
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw ex;
        }
        return o;
    }

    @Override
    public List<Department> gets() throws Exception {
        List<Department> list = new ArrayList<Department>();
        try {
            em.getTransaction().begin();
            list = em.createQuery("SELECT o FROM Department o").getResultList();
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw ex;
        }
        return list;
    }
}
