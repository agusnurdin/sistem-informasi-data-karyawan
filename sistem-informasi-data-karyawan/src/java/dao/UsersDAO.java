/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Users;

/**
 *
 * @author Joni_Geol
 */
public interface UsersDAO extends GeneralDAO {

    public Users get(Long id) throws Exception;
    public Users get(String username, String password) throws Exception;
    public List<Users> gets(String id) throws Exception;
}
