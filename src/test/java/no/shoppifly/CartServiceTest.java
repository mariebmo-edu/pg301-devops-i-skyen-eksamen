package no.shoppifly;

public class CartServiceTest {

    /* Kommentert ut for å begynne på micrometer*/

    /*
    @Test
    public void shouldRemoveCartAfterCheckout() {

        CartService service = new NaiveCartImpl();
        Cart theCart = Cart.builder().build();
        service.update(theCart);
        assertEquals(1, service.getAllCarts().size());
        String orderId = service.checkout(theCart);
        assertNotNull(orderId);

        // Jim; This must be wrong, right? Shouldn't the cart be removed after checkout
        assertEquals(0, service.getAllCarts().size());
    }
     */

}
