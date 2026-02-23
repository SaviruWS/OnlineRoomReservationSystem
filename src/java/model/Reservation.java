
package model;

import java.sql.Date;

public class Reservation {
    
    private String rno;
    private String name;
    private int age;
    private Date checkin;
    private Date checkout;
    
    
    public Reservation(String rno, String name, int age, Date checkin, Date checkout){
        
       this. rno = rno;
       this. name = name;
       this. age = age;
       this.checkin = checkin;
       this. checkout = checkout;
       
    }
    public String getRno(){
        return rno;
    }
    public String getName(){
        return name;
    }
    public int getAge(){
        return age;
    }
    public Date getCheckin(){
        return checkin;
    }
    public Date getCheckout(){
        return checkout;
    }
 
    
}
