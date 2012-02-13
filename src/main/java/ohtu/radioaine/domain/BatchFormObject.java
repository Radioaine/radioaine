package ohtu.radioaine.domain;

/*
 * Used for form validation. Has only getters and setters.
 */

import javax.validation.constraints.NotNull;

/**
 * Used for form validation
 * @author rmjheino
 */
public class BatchFormObject {

    @NotNull(message = "Eränumero ei saa olla tyhjä")
    private String batchNumber;
    @NotNull(message = "Aine ei saa olla tyhjä")
    private int substance;
    @NotNull(message = "Määrä ei saa olla tyhjä")
    private int amount;
    @NotNull(message = "Saapumispäivä ei saa olla tyhjä")
    private String arrivalDate;
    @NotNull(message = "Vanhenemispäivä ei saa olla tyhjä")
    private String expDate;
    private String note;
    
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


    public int getSubstance() {
        return substance;
    }

    public void setSubstance(int substance) {
        this.substance = substance;
    }
}
