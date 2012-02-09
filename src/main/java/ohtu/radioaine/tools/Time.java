/*
 * To change this template, choose Time | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.tools;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author jahyvone
 */
public class Time {

    public static Timestamp getTimestamp() {
        Calendar calendar = Calendar.getInstance();
        Date now = calendar.getTime();
        Timestamp timestamp = new java.sql.Timestamp(now.getTime());
        return timestamp;
    }
}
