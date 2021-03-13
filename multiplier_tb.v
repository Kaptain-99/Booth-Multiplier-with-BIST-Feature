`timescale 1ns / 1ps
module multiplier_tb;
// Inputs 
reg clk; 
reg [3:0] a; 
reg [3:0] b; 
reg start; 
 reg test;
 
// Outputs 
wire [7:0] product; 
wire busy; 
wire pass;

// Instantiate the Unit Under Test (UUT) 
multiplier uut ( 
                    .clk(clk), 
                    .a(a), 
                    .b(b), 
                    .start(start), 
                    .test(test), 
                    .product(product), 
                    .busy(busy), 
                    .pass(pass) ); 
                    
always #5 clk = ~clk; 

always @(posedge clk) $strobe("product: %d busy: %d at time=%t", $signed(product), busy, $stime);

initial begin 
// Initialize Inputs 
clk = 0; 
a = 0; 
b = 0; 
start = 0; 
test = 0; 

// Add stimulus here 
#10; 
test = 1;
#100; 
wait(product == 8'b1111_1111);
#10; 
if(pass == 1) 
$display("Test Passed!"); 
else 
$display("Test Failed!"); 
#30; 
test = 0; 
$finish;
end
endmodule