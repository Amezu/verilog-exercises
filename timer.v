module timer (clk, rst, in, ready, data);

    input clk, rst, in;
    reg in_high;
    output reg ready;
    output reg [10:0] data;
    reg [10:0] counter;

    always @(posedge clk, posedge rst)
        if (rst)
            in_high <= 1'b0;
        else if (in)
            in_high <= 1'b1;
        else if (~in)
            in_high <= 1'b0;

    always @(posedge clk, posedge rst)
        if (rst)
            counter <= 11'b0;
        else if (in_high & in)
            counter <= counter + 11'b1;
        else if (in_high & ~in)
            counter <= 11'b0;

    always @(posedge clk, posedge rst)
        if (rst) begin
            data <= 11'b0;
            ready <= 1'b0;
        end
        else if (in_high & ~in) begin
            data <= counter;
            ready <= 1'b1;
        end
        else ready <= 1'b0;

endmodule