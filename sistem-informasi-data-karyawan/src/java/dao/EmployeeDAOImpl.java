/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import model.Employee;

/**
 *
 * @author Luckma
 */
public class EmployeeDAOImpl extends GeneralDAOImpl
        implements EmployeeDAO {

    public EmployeeDAOImpl(EntityManager em) {
        super(em);
    }

    @Override
    public List<Employee> gets(String id) throws Exception {
        List<Employee> list = new ArrayList<Employee>();
        try {
            this.em.getTransaction().begin();
            list = this.em.createQuery("SELECT o FROM Employee o WHERE o.id LIKE :id").setParameter("id", "%" + id + "%").getResultList();
            this.em.getTransaction().commit();
        } catch (Exception ex) {
            throw ex;
        }
        return list;
    }
}
