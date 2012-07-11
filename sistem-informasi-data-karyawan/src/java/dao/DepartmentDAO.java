/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Department;

/**
 *
 * @author Luckma
 */
public interface DepartmentDAO extends GeneralDAO {

    public List<Department> gets() throws Exception;
}
