/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.domain;

/**
 *
 * @author jahyvone
 */
public class SubstanceFormObject {

    private String name;
    private int alertLimit1;
    private int alertLimit2;
    private String needsColdStorage;
    private String manufacturer;
    private String supplier;

    public int getAlertLimit1() {
        return alertLimit1;
    }

    public void setAlertLimit1(int alertLimit1) {
        this.alertLimit1 = alertLimit1;
    }

    public int getAlertLimit2() {
        return alertLimit2;
    }

    public void setAlertLimit2(int alertLimit2) {
        this.alertLimit2 = alertLimit2;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNeedsColdStorage() {
        return needsColdStorage;
    }

    public void setNeedsColdStorage(String needsColdStorage) {
        this.needsColdStorage = needsColdStorage;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }
}