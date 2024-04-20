/*
RAM with 1 read port and 1 write port
*/

module RAM (
    clk_write,
    address_write,
    data_write,
    write_enable,
    clk_read,
    address_read,
    data_read
);
 parameter D_WIDTH = 16;
 parameter A_WIDTH = 4;
 parameter A_MAX = 16; //2^A_WIDTH

 //write port
 input clk_write;
 input [A_WIDTH-1:0] address_write;
 input [D_WIDTH-1:0] data_write;
 input write_enable;


 //read port
 input clk_read;
 input [A_WIDTH-1:0] address_read;
 output [D_WIDTH-1:0] data_read;

 reg [D_WIDTH-1:0] data_read;

 //Memory as a multidemsional array
 reg [D_WIDTH-1:0] memory [A_MAX-1:0]  ;

 //Write data into memory
 always @(posedge clk_write) begin
    if(write_enable ==1)begin
        memory[address_write] <= data_write;
    end
 end

 //Read data from memory
 always @(posedge clk_read) begin
    data_read <= memory[address_read];
 end


    
endmodule