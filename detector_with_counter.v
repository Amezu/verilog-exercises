module detector_with_counter(clk, in, length, wr, rst, out);

    input clk, in, length, wr, rst;
    output out;

    integer N = 5;
    integer counter;
    reg out_reg = 1'b0;
    reg prev_in = 1'b0;
    reg curr_in = 1'b0;
    wire posedge_in;

    assign out = posedge_in | out_reg;

    // posedge detector
    always @(posedge clk, posedge rst)
        if (rst) begin
            prev_in <= 1'b0;
            curr_in <= 1'b0;
        end
        else begin
            prev_in <= curr_in;
            curr_in <= in;
        end

    assign posedge_in = curr_in & ~prev_in;

    // counter
    always @(posedge clk, posedge rst) begin
        if (rst)
            counter <= N;
        else if (out_reg & counter > 0 | posedge_in)
            counter <= counter - 1;
        else if (~out_reg)
            counter <= N;
    end

    // length register
    always @(posedge clk, posedge rst)
        if (rst)
            N <= 5;
        else if (wr)
            N <= length;

    // output flip-flop
    always @(posedge clk, posedge rst) 
        if (rst)
            out_reg <= 1'b0;
        else if (counter == 1)
            out_reg <= 1'b0;
        else if (posedge_in)
            out_reg <= 1'b1;

endmodule