/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Place;

/**
 *
 * @author Luckma
 */
public interface PlaceDAO extends GeneralDAO {

    public List<Place> gets() throws Exception;
}
