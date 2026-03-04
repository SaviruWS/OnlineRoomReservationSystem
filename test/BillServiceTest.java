import org.junit.Test;
import static org.junit.Assert.*;
import service.BillService;
import java.time.LocalDate;

public class BillServiceTest {

    @Test
    public void testCalculateNights() {
        BillService service = new BillService();

        LocalDate checkin = LocalDate.of(2026, 3, 1);
        LocalDate checkout = LocalDate.of(2026, 3, 4);

        long nights = service.calculateNights(checkin, checkout);

        assertEquals(3, nights);
    }

    @Test
    public void testCalculateTotal() {
        BillService service = new BillService();

        double total = service.calculateTotal(3, 10000);

        assertEquals(30000, total, 0.01);
    }

    @Test
    public void testZeroNights() {
        BillService service = new BillService();

        double total = service.calculateTotal(0, 10000);

        assertEquals(0, total, 0.01);
    }
}