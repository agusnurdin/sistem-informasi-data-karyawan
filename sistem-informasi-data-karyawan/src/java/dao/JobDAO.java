/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Job;

/**
 *
 * @author Luckma
 */
public interface JobDAO extends GeneralDAO {

    public List<Job> gets(String id) throws Exception;
}
