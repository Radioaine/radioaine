package ohtu.radioaine.domain;

/*
 * Used for form validation. Has only getters and setters.
 */
import java.util.ArrayList;
import javax.validation.constraints.NotNull;

/**
 * Used for form validation
 *
 * @author rmjheino
 */
public class BatchFormObject {

    @NotNull(message = "Eränumero ei saa olla tyhjä")
    private String batchNumber;
    @NotNull(message = "Aine ei saa olla tyhjä")
    private Long substance;
    @NotNull(message = "Määrä ei saa olla tyhjä")
    private int amount;
    @NotNull(message = "Tilavuus ei saa olla tyhjä")
    private int substanceVolume;
    @NotNull(message = "Saapumispäivä ei saa olla tyhjä")
    private String arrivalDate;
    @NotNull(message = "Vanhenemispäivä ei saa olla tyhjä")
    private String expDate;
    private String note;
    private int storageLocationsCount = 10;
    private Long[][] storageLocations = new Long[storageLocationsCount][2];
    @NotNull(message = "Nimi ei saa olla tyhjä")
    private String signature;

    public Long[][] getStorageLocations() {
        return storageLocations;
    }

    public void setStorageLocations(Long[][] storageLocations) {
        this.storageLocations = storageLocations;
    }
    
    public int getStorageLocationsCount() {
        return storageLocationsCount;
    }

    public void setStorageLocationsCount(int storageLocationsCount) {
        this.storageLocationsCount = storageLocationsCount;
    }
    
    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public int getSubstanceVolume() {
        return substanceVolume;
    }

    public void setSubstanceVolume(int substanceVolume) {
        this.substanceVolume = substanceVolume;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(String arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public String getExpDate() {
        return expDate;
    }

    public void setExpDate(String expDate) {
        this.expDate = expDate;
    }

    public String getBatchNumber() {
        return batchNumber;
    }

    public void setBatchNumber(String batchNumber) {
        this.batchNumber = batchNumber;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Long getSubstance() {
        return substance;
    }

    public void setSubstance(Long substance) {
        this.substance = substance;
    }
}
