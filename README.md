### Detector with counter

Synchronous system with clock `clk`. After detecting positive edge on `in`, generates a pulse with a length of `N` clock periods. `N` can be changed to `length` during `wr` positive edge. Reseted asynchronously by `rst`.