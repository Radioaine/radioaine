package ohtu.radioaine.tools;

import java.sql.Timestamp;

/**
 *  Class for calculating level of eluate radioactivity at given moment
 *  Used timeunit is seconds
 * 
 * @author Suvi Jentze-Korpi
 */
public class Activity {

    public double CurrentActivity(Timestamp t0, Timestamp t, int halflife, int strength){
        int A0 = strength;              //eluate activity at time t0
        long dT = ElapsedTime(t0,t);    //elapsed time since creation of eluate
        
        /*Calculate value of lambda*/            
        double ln2 = Math.log(2);       //natural logarithm of 2
        double lambda = ln2 / halflife; // NB. halflife = ln2/lambda
        
        /*Calculate current activity*/
        double A = 0;           //calculated activity
        A = CalculateActivity(A, A0,lambda,dT);
        
        return A;   //return current activity
    }
    
    private double CalculateActivity(double A, int A0,double lambda, long dT){
        A = A0*Math.exp((-lambda*dT));
        return A;
    }
    
    private long ElapsedTime(Timestamp t0, Timestamp t){
        // t0 is time of creation of eluate
        // t is current time
        
        long time_t0 = t0.getTime();
        long time_t = t.getTime();
        long difference = time_t - time_t0; //unit is milliseconds
        long differenceInSeconds = ((difference*10)*10)*10;  //unit is seconds
        return differenceInSeconds;
    }
  
}
