/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.domain;

import javax.validation.constraints.NotNull;

/**
 *
 * @author jahyvone
 */
public class SubstanceFormObject {

    @NotNull(message = "Nimi ei saa olla tyhjÃ¤")
    private String name;
    private String genericName;
    private String eluateName;
    private int type;
    private String halflife;
    private int warningBeforeDays;
    private int warningBeforeAmount;
    private String volume;
    private String strength;
    private int qualityControl;
    private boolean needsColdStorage;
    private String manufacturer;
    private String supplier;
    private String signature;

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getWarningBeforeAmount() {
        return warningBeforeAmount;
    }

    public void setWarningBeforeAmount(int warningBeforeAmount) {
        this.warningBeforeAmount = warningBeforeAmount;
    }

    public int getWarningBeforeDays() {
        return warningBeforeDays;
    }

    public void setWarningBeforeDays(int warningBeforeDays) {
        this.warningBeforeDays = warningBeforeDays;
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

    public boolean getNeedsColdStorage() {
        return needsColdStorage;
    }

    public void setNeedsColdStorage(boolean needsColdStorage) {
        this.needsColdStorage = needsColdStorage;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getHalflife() {
        return halflife;
    }

    public void setHalflife(String halflife) {
        this.halflife = halflife.replaceAll(",", ".");
    }

    public String getEluateName() {
        return eluateName;
    }

    public void setEluateName(String eluateName) {
        this.eluateName = eluateName;
    }

    public String getGenericName() {
        return genericName;
    }

    public void setGenericName(String genericName) {
        this.genericName = genericName;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    public String getStrength() {
        return strength;
    }

    public void setStrength(String strength) {
        this.strength = strength.replaceAll(",", ".");
    }

    public int getQualityControl() {
        return qualityControl;
    }

    public void setQualityControl(int qualityControl) {
        this.qualityControl = qualityControl;
    }
}
