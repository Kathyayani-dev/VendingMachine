# code for vendingm.v
  ...
     module vendingm(din,clk,rst,x,y);
        input [1:0]din;
        input clk,rst;
        output reg x,y;

        parameter
                s0=2'b00,
                s1=2'b01,
                s2=2'b10;

        reg [1:0]s,n_s;

        always@(posedge clk or posedge rst)
        begin
                if(rst)
                        s<=s0;
                else
                        s<=n_s;
        end

        always@(s,din)
        begin
                n_s=s0;
                case(s)
                        s0: if(din==2'b10)
                                n_s=s1;
                        else if (din==2'b11)
                                n_s=s2;
                        else
                                n_s=s0;

                        s1: if(din==2'b10)
                                n_s=s2;
                        else if (din==2'b11)
                                n_s=s0;
                        else
                                n_s=s1;

                        s2: if(din==2'b10)
                                n_s=s0;
                        else if (din==2'b11)
                                n_s=s0;
                        else
                                n_s=s2;
                        default: n_s=s0;
                endcase
        end

        always@(posedge clk or posedge rst)
        begin
                if(rst)
                begin
                        x<=1'b0;
                        y<=1'b0;
                end

                else
                begin
                   x<=1'b0;
                        y<=1'b0;
                        case(s)
                                s0: if(din==2'b11)
                        begin
                                x<=1'b0;
                                y<=1'b0;
                        end
                        else if(din==2'b10)
                        begin
                                x<=1'b0;
                                y<=1'b0;
                        end
                        else
                        begin
                                x<=1'b0;
                                y<=1'b0;
                        end
                        s1: if(din==2'b11)
                        begin
                                x<=1'b1;
                                y<=1'b0;
                        end
                        else if(din==2'b10)
                        begin
                                x<=1'b0;
                                y<=1'b0;
                         end
                         else
                         begin
                                x<=1'b0;
                                y<=1'b0;
                          end
                          
                        s2: if(din==2'b11)
                        begin
                                x<=1'b1;
                                y<=1'b1;
                        end
                        else if(din==2'b10)
                        begin
                                x<=1'b1;
                                y<=1'b0;
                        end
                        else
                        begin
                                x<=1'b0;
                                y<=1'b0;
                        end
                endcase
        end
end
endmodule
...
