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
    public List<Department> gets(String id) throws Exception {
        List<Department> list = new ArrayList<Department>();
        try {
            em.getTransaction().begin();
            list = this.em.createQuery("SELECT o FROM Department o WHERE o.id LIKE :id").setParameter("id", "%" + id + "%").getResultList();
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw ex;
        }
        return list;
    }
}
