/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.*;
import ohtu.radioaine.tools.Time;

/**
 *
 * @author Richard Moneybags
 */
@Entity
public class Event implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private Timestamp arrivalDate;
    private Timestamp expDate;
    private String batchNumber;
    private String note;
    private String substanceName;
    private int amount;
    @Column (length = 1000)
    private String info;
    private Timestamp timestamp;
    private String signature;

    public Timestamp getExpDate() {
        return expDate;
    }

    public void setExpDate(Timestamp expDate) {
        this.expDate = expDate;
    }

    public String getSubstanceName() {
        return substanceName;
    }

    public void setSubstanceName(String substanceName) {
        this.substanceName = substanceName;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getBatchNumber() {
        return batchNumber;
    }

    public void setBatchNumber(String batchNumber) {
        this.batchNumber = batchNumber;
    }
    
    public Timestamp getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(Timestamp arrivalDate) {
        this.arrivalDate = arrivalDate;
    }
    
    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }
    
    public Event() {
        timestamp = Time.getTimestamp();
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
    
}
