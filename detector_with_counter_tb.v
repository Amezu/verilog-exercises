`include "detector_with_counter.v"

module detector_with_counter_tb ();

    reg CLK, IN, WR;
    integer LENGTH;
    wire OUT;

    detector_with_counter uut (.clk(CLK), .in(IN), .out(OUT), .length(LENGTH), .wr(WR));

    initial begin
        CLK = 1'b0;
        forever #5 begin
            CLK = ~CLK;
        end
    end

    initial begin
        IN = 1'b0;
        // should hold "out" high for 5 periods
        #2 IN = 1'b1; $display("#%0t in", $time);
        #5 IN = 1'b0; $display("#%0t ~in", $time);

        // should rise "out" only once
        #10 IN = 1'b1; $display("#%0t in", $time);
        #70 IN = 1'b0; $display("#%0t ~in", $time);
        
        // should hold "out" high for 8 periods
        LENGTH = 8;
        WR = 1'b1;
        #10 WR = 1'b0;
        $display("length = %0d", uut.length);
        #2 IN = 1'b1; $display("#%0t in", $time);
        #90;
        $finish;
    end
    
    initial begin
        $monitor("#%0t out = %b counter = %0d", $time, OUT, uut.counter);
    end

endmodule