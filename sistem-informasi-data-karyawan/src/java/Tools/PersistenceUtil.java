/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Tools;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Luckma
 */
public class PersistenceUtil {

    public static EntityManager getEntityManager() {
        EntityManagerFactory emf =
                Persistence.createEntityManagerFactory("sistem-informasi-data-karyawanPU");
        EntityManager em = emf.createEntityManager();
        return em;
    }
}
