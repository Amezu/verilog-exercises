### Detector with counter

Synchronous system with the clock `clk`. After detecting positive edge on the input `in`, generates a pulse with a length of `N` clock periods. `N` is changed to `length` during `wr` rising edge. Reseted asynchronously by the `rst`.

### Timer

Model of the synchronous system with the asynchronous reset, measuring a duration of the pulse given to the input `in`. End of the measurment is sygnalised by the output `ready` and value of time is given on the `data` until finish of next measurment.
