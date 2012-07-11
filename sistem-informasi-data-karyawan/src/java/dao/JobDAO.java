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

    public Job get(String id) throws Exception;

    public List<Job> gets() throws Exception;
}
