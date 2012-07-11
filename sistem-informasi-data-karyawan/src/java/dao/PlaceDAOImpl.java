/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import model.Place;

/**
 *
 * @author Luckma
 */
public class PlaceDAOImpl extends GeneralDAOImpl
        implements PlaceDAO {

    public PlaceDAOImpl(EntityManager em) {
        super(em);
    }

    @Override
    public List<Place> gets() throws Exception {
        List<Place> list = new ArrayList<Place>();
        try {
            em.getTransaction().begin();
            list = em.createQuery("SELECT o FROM Location o").getResultList();
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw ex;
        }
        return list;
    }
}
