package no.shoppifly;

import io.micrometer.core.annotation.Timed;
import io.micrometer.core.instrument.Gauge;
import io.micrometer.core.instrument.MeterRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController()
public class ShoppingCartController implements ApplicationListener<ApplicationReadyEvent> {

    @Autowired
    private final CartService cartService;

    private final MeterRegistry meterRegistry;

    @Autowired
    public ShoppingCartController(CartService cartService, MeterRegistry meterRegistry) {
        this.cartService = cartService;
        this.meterRegistry = meterRegistry;
    }

    @GetMapping(path = "/cart/{id}")
    public Cart getCart(@PathVariable String id) {
        return cartService.getCart(id);
    }

    /**
     * Checks out a shopping cart. Removes the cart, and returns an order ID
     *
     * @return an order ID
     */
    @Timed(value = "checkout_latency_time", description = "Time latency for checkout")
    @PostMapping(path = "/cart/checkout")
    public String checkout(@RequestBody Cart cart) {
        meterRegistry.counter("checkouts").increment();
        return cartService.checkout(cart);
    }

    /**
     * This should be a PUT according to RESTful principles, but I'm keeping it as a post in case the Sensor is using pre-defined CURL/postman commands.
     * Updates a shopping cart, replacing it's contents if it already exists. If no cart exists (id is null)
     * a new cart is created.
     *
     * @return the updated cart
     */
    @PostMapping(path = "/cart")
    public Cart updateCart(@RequestBody Cart cart) {
        return cartService.update(cart);
    }

    /**
     * return all cart IDs
     *
     * @return the list of cart IDs
     */
    @GetMapping(path = "/carts")
    public List<String> getAllCarts() {
        return cartService.getAllCarts();
    }

    @Override
    public void onApplicationEvent(ApplicationReadyEvent applicationReadyEvent) {
        Gauge.builder("carts", cartService, c -> c.getAllCarts().size())
                .description("Total number of carts")
                .register(meterRegistry);

        Gauge.builder("carts_value", cartService, c -> c.getAllCarts().stream().map(this::getCart).mapToDouble(cart -> cart.getItems().stream().mapToDouble(item -> item.getQty() * item.getUnitPrice()).sum()).sum())
                .description("Total value of all items in carts")
                .register(meterRegistry);
    }

}