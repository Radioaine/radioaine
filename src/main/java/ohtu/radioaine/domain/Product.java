package ohtu.radioaine.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Product implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(nullable=false)
    private long id;
    @Column(nullable=false)
    private String name;
    @Column
    private String preparer;
    @Column
    private Date timeCreated;

    public Product() {
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPreparer() {
        return preparer;
    }

    public Date getTimeCreated() {
        return timeCreated;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPreparer(String preparer) {
        this.preparer = preparer;
    }

    public void setTimeCreated(Date timeCreated) {
        this.timeCreated = timeCreated;
    }
    
}
