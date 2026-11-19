# code for vendingm_tb.v
  ...
     module vendingm_tb();
        reg [1:0]din;
        reg clk,rst;
        wire x,y;

        parameter CYCLE=10;

        vendingm DUT(din,clk,rst,x,y);

        always
        begin
                #(CYCLE/2);
                clk=1'b1;
                #(CYCLE/2);
                clk=1'b0;
        end

        task rst_dut();
                begin
                        delay(5);
                        rst=1'b1;
                        delay(10);
                        rst=1'b0;
                end
        endtask

        task initialize();
                begin
                        {din}=0;
                end
        endtask

        task delay(input integer i);
                begin
                        #i;
                end
        endtask

        task stimulus(input [1:0]a);
           begin
                @(negedge clk)
                        din=a;
                end
        endtask

        initial
        begin
                initialize;
                rst_dut;
                stimulus(2'b00);
                stimulus(2'b10);
                stimulus(2'b11);

                //rst_dut;
                stimulus(2'b11);
                stimulus(2'b11);

                //rst_dut;
                stimulus(2'b11);
                stimulus(2'b10);
                //delay(100);
                //$finish;
        end
        /*initial
                $monitor("Reset=%b, state=%b, Din=%b, Output x=%b,y=%b",rst,DUT.s,din,x,y);
        always@(DUT.s or x or y)
        begin
                if(DUT.s==2'b11 && x==1 && y==1)
                        $display("Correct output at state %b", DUT.s);
        end*/
        endmodule
...
