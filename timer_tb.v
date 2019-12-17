`include "timer.v"

module timer_tb ();

    reg CLK, IN, RST;
    wire [10:0] DATA;

    timer uut (.clk(CLK), .rst(RST), .in(IN), .ready(READY), .data(DATA));

    initial begin
        CLK = 1'b0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        RST = 1'b1;
        #5 RST = 1'b0;
    end

    initial begin
        IN = 1'b0;
        #15 IN = 1'b1; $display("#%0t in", $time);
        #50 IN = 1'b0; $display("#%0t ~in", $time);
        #10 IN = 1'b1; $display("#%0t in", $time);
        #63 IN = 1'b0; $display("#%0t ~in", $time);
        #10;
        $finish;
    end
    
    initial begin
        $monitor("#%0t ready=%b data=%0d counter=%0d", $time, READY, DATA, uut.counter);
    end

endmodule