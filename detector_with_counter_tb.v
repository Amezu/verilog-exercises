`include "detector_with_counter.v"

module detector_with_counter_tb ();

    reg CLK, IN;
    wire OUT;

    detector_with_counter uut (.clk(CLK), .in(IN), .out(OUT));

    initial begin
        CLK = 1'b0;
        forever #5 begin
            CLK = ~CLK;
        end
    end

    initial begin
        IN = 1'b0;
        #2 IN = 1'b1; $display("#%0t in", $time);
        #5 IN = 1'b0; $display("#%0t ~in", $time);
        #10 IN = 1'b1; $display("#%0t in", $time);
        #70 IN = 1'b0; $display("#%0t ~in", $time);
        $finish;
    end
    
    initial begin
        $monitor("#%0t out = %b counter = %0d", $time, OUT, uut.counter);
    end

endmodule