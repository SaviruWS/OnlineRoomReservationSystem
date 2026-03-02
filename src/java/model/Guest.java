package model;

public class Guest {

    private int guest_id;
    private String guest_name;
    private String address;
    private String contact_number;
    private String email;

    public Guest() {}

    public Guest(int guest_id, String guest_name, String address,
                 String contact_number, String email) {
        this.guest_id = guest_id;
        this.guest_name = guest_name;
        this.address = address;
        this.contact_number = contact_number;
        this.email = email;
    }

    public int getGuest_id() {
        return guest_id;
    }

    public void setGuest_id(int guest_id) {
        this.guest_id = guest_id;
    }

    public String getGuest_name() {
        return guest_name;
    }

    public void setGuest_name(String guest_name) {
        this.guest_name = guest_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact_number() {
        return contact_number;
    }

    public void setContact_number(String contact_number) {
        this.contact_number = contact_number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}