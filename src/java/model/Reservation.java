package model;

import java.sql.Date;

public class Reservation {

    private int resId;          // res_id
    private int roomNo;         // room_no
    private String guestName;   // guest_name
    private Date checkin;       // checkin
    private Date checkout;      // checkout

    public Reservation(int resId, int roomNo, String guestName, Date checkin, Date checkout) {
        this.resId = resId;
        this.roomNo = roomNo;
        this.guestName = guestName;
        this.checkin = checkin;
        this.checkout = checkout;
    }

    // Getters
    public int getResId() {
        return resId;
    }

    public int getRoomNo() {
        return roomNo;
    }

    public String getGuestName() {
        return guestName;
    }

    public Date getCheckin() {
        return checkin;
    }

    public Date getCheckout() {
        return checkout;
    }

}