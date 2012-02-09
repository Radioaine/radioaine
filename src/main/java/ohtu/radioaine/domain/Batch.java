package ohtu.radioaine.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
public class Batch implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(nullable = false)
    private Long id;
    @Column(nullable = false)
    private int batchNumber;
    private Substance substance;
//    private Date useBefore;
    private boolean qualityCheck;
    private double strength;
    private String manufacturer;
    private String supplier;

    public int getBatchNumber() {
        return batchNumber;
    }

    public void setBatchNumber(int batchNumber) {
        this.batchNumber = batchNumber;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public boolean qualityCheckDone() {
        return qualityCheck;
    }

    public void setQualityCheck(boolean qualityCheck) {
        this.qualityCheck = qualityCheck;
    }

    public double getStrength() {
        return strength;
    }

    public void setStrength(double strength) {
        this.strength = strength;
    }

    public Substance getSubstance() {
        return substance;
    }

    public void setSubstance(Substance substance) {
        this.substance = substance;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

//    public Date getUseBefore() {
//        return useBefore;
//    }
//
//    public void setUseBefore(Date useBefore) {
//        this.useBefore = useBefore;
//    }
}
