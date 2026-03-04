package model;

import java.sql.Date;
import java.time.LocalDate;

public class Reservation {

    private int resId;
    private int roomNo;
    private int guestId;
    private String guestName;
    private String address;
    private String contactNumber;
    private String roomType;
    private Date checkin;
    private Date checkout;

    public Reservation(int resId, int roomNo, int guestId,
                       String guestName, String address,
                       String contactNumber, String roomType,
                       Date checkin, Date checkout) {

        this.resId = resId;
        this.roomNo = roomNo;
        this.guestId = guestId;
        this.guestName = guestName;
        this.address = address;
        this.contactNumber = contactNumber;
        this.roomType = roomType;
        this.checkin = checkin;
        this.checkout = checkout;
    }

    public Reservation(int aInt, int aInt0, String string, String string0, String string1, int aInt1, LocalDate toLocalDate, LocalDate toLocalDate0) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    // Getters

    public int getResId() {
        return resId;
    }

    public int getRoomNo() {
        return roomNo;
    }

    public int getGuestId() {
        return guestId;
    }

    public String getGuestName() {
        return guestName;
    }

    public String getAddress() {
        return address;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public String getRoomType() {
        return roomType;
    }

    public Date getCheckin() {
        return checkin;
    }

    public Date getCheckout() {
        return checkout;
    }
}