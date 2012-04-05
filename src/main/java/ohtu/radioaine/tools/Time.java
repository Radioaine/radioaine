package ohtu.radioaine.tools;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * Tools for managing time
 *
 * @author Radioaine
 */
public class Time {

    public static Timestamp getTimestamp() {
        Calendar calendar = Calendar.getInstance();
        Date now = calendar.getTime();
        Timestamp timestamp = new java.sql.Timestamp(now.getTime());
        return timestamp;
    }

    public static Timestamp parseTime(String time, String format) {
        DateFormat sdf = new SimpleDateFormat(format);
        Timestamp timestamp = null;
        try {
            Date date = sdf.parse(time);
            timestamp = new java.sql.Timestamp(date.getTime());
        } catch (Exception e) {
            e.printStackTrace();

        }
        return timestamp;
    }

    public static Timestamp parseDate(String time) {
        return parseTime(time, "dd.MM.yyyy");

    }

    public static Timestamp parseTimeStamp(String time) {
        return parseTime(time, "dd.MM.yyyy HH:mm");

    }
    
    public static Timestamp parseWarningDate(Timestamp time){
        long day = 84600000;
        Timestamp temp = new Timestamp(time.getTime()-day*5);
        return temp;
    }

    public static Date getWarningDate() {
        GregorianCalendar cal = new GregorianCalendar();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        cal.add(GregorianCalendar.DAY_OF_MONTH, -6);   
        return cal.getTime();
    }
}