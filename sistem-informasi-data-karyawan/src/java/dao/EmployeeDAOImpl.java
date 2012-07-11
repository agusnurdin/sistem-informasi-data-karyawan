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
    public Employee get(String id) throws Exception {
        Employee o = null;
        try {
            em.getTransaction().begin();
            o = em.find(Employee.class, id);
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw ex;
        }
        return o;
    }

    @Override
    public List<Employee> gets() throws Exception {
        List<Employee> list = new ArrayList<Employee>();
        try {
            em.getTransaction().begin();
            list = em.createQuery("SELECT o FROM Employee o").getResultList();
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw ex;
        }
        return list;
    }
}
