/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
import javax.persistence.*;
import ohtu.radioaine.tools.Time;

/**
 *
 * @author Richard Moneybags
 */
@Entity
public class Event3 implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column
    private String message;
    @Column
    private Timestamp timestamp;
    @Column
    private String type;
    @OneToMany(cascade = CascadeType.MERGE)
    private List<Batch> batches;
    @OneToMany(cascade = CascadeType.MERGE)
    @JoinTable(joinColumns = {
        @JoinColumn(name = "event_id")},
    inverseJoinColumns = {
        @JoinColumn(name = "eluate_id")})
    private List<Eluate> eluates;
    @OneToMany(cascade = CascadeType.MERGE)
    @JoinTable(joinColumns = {
        @JoinColumn(name = "event_id")},
    inverseJoinColumns = {
        @JoinColumn(name = "substance_id")})
    private List<Substance> substances;
//    @OneToMany(cascade = CascadeType.MERGE)
//    @JoinTable(joinColumns = {
//        @JoinColumn(name = "event_id")},
//    inverseJoinColumns = {
//        @JoinColumn(name = "product_id")})
//    private List<Product> products;
    @OneToMany(cascade = CascadeType.MERGE)
    @JoinTable(joinColumns = {
        @JoinColumn(name = "event_id")},
    inverseJoinColumns = {
        @JoinColumn(name = "radiomedicine_id")})
    private List<RadioMedicine> radioMedicines;

    public Event3() {
        timestamp = Time.getTimestamp();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<Batch> getBatches() {
        return batches;
    }

    public void setBatches(List<Batch> batches) {
        this.batches = batches;
    }

    public List<Eluate> getEluates() {
        return eluates;
    }

    public void setEluates(List<Eluate> eluates) {
        this.eluates = eluates;
    }

//    public List<Product> getProducts() {
//        return products;
//    }
//
//    public void setProducts(List<Product> products) {
//        this.products = products;
//    }

    public List<RadioMedicine> getRadioMedicines() {
        return radioMedicines;
    }

    public void setRadioMedicines(List<RadioMedicine> radioMedicines) {
        this.radioMedicines = radioMedicines;
    }

    public List<Substance> getSubstances() {
        return substances;
    }

    public void setSubstances(List<Substance> substances) {
        this.substances = substances;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String happening) {
        this.message = happening;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
