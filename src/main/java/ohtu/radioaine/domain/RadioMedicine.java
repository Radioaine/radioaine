/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.domain;

import java.util.List;
import javax.persistence.*;

@Entity
public class RadioMedicine extends Product {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(nullable = false)
    private Long id;
    @Column
    private double volume;
    @Column
    private List<Eluate> eluate;

    public long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getVolume() {
        return volume;
    }

    public void setVolume(double volume) {
        this.volume = volume;
    }

    public List<Eluate> getEluate() {
        return eluate;
    }

    public void setEluate(Eluate eluate) {
        this.eluate.add(eluate);
    }
}
