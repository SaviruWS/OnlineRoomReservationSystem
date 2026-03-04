package service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class BillService {

    // Calculate number of nights between two dates
    public long calculateNights(LocalDate checkin, LocalDate checkout) {
        return ChronoUnit.DAYS.between(checkin, checkout);
    }

    // Calculate total bill amount
    public double calculateTotal(long nights, double pricePerNight) {
        return nights * pricePerNight;
    }
}