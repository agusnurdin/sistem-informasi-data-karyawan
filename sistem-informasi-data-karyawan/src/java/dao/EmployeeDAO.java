/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Employee;

/**
 *
 * @author Luckma
 */
public interface EmployeeDAO extends GeneralDAO {

    public List<Employee> gets() throws Exception;

    public List<Employee> gets(String id) throws Exception;
}
