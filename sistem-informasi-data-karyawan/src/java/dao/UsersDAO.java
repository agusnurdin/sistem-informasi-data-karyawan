/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Users;

/**
 *
 * @author Luckma
 */
public interface UsersDAO extends GeneralDAO {

    public Users get(String id) throws Exception;
    public Users get(String id, String password) throws Exception;
    public List<Users> gets(String id) throws Exception;
}