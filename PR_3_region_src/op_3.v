`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pr_operation(pixel_clk,
    blank,hc,vc,dout,
    redx,greenx,bluex,reset
    );
    input pixel_clk;
    input blank;
    input [9:0] hc,vc;
    input [95:0] dout;
    input reset;
    
    reg [7:0] gray, left, right, up, down, leftup, leftdown, rightup, rightdown;       //different values in matrix
    reg[7:0] red_o, blue_o, green_o;            // variables used during calcultion
    reg [7:0] tred,tgreen,tblue;
    output reg [3:0] redx,greenx,bluex; 
    reg [15:0] r, b, g;                         // variables used during calcultion
    
    
    
 always @(posedge pixel_clk)
	begin		
            if(blank == 0 && hc >= 100 && hc < 260 && vc >= 100 && vc < 215)
            begin
              
                gray =  {dout[95], dout[94], dout[93], dout[92], dout[91], dout[90], dout[89], dout[88]};
                left = {dout[87], dout[86], dout[85], dout[84], dout[83], dout[82], dout[81], dout[80]};
                right = {dout[79], dout[78], dout[77], dout[76], dout[75], dout[74], dout[73], dout[72]};                             
                up =  {dout[71], dout[70], dout[69], dout[68], dout[67], dout[66], dout[65], dout[64]};
                down = {dout[63], dout[62], dout[61], dout[60], dout[59], dout[58], dout[57], dout[56]};
                leftup = {dout[55], dout[54], dout[53], dout[52], dout[51], dout[50], dout[49], dout[48]};
                leftdown =  {dout[47], dout[46], dout[45], dout[44], dout[43], dout[42], dout[41], dout[40]};
                rightup = {dout[39], dout[38], dout[37], dout[36], dout[35], dout[34], dout[33], dout[32]};
                rightdown = {dout[31], dout[30], dout[29], dout[28], dout[27], dout[26], dout[25], dout[24]};
                tblue =  {dout[23], dout[22], dout[21], dout[20], dout[19], dout[18], dout[17], dout[16]};
                tgreen = {dout[15], dout[14], dout[13], dout[12], dout[11], dout[10], dout[9], dout[8]};
                tred = {dout[7], dout[6], dout[5], dout[4], dout[3], dout[2], dout[1], dout[0]};
                
               

//   edge detection
                        if(reset) begin
                            redx = 0;
                            greenx = 0;
                            bluex = 0;                          
                        end else begin
                            r = ((8*gray) - left - right - up - down - leftup - leftdown - rightup - rightdown);
                            if(r > 2048)begin
                               red_o = 0;
                               blue_o = 0;
                               green_o = 0;
                            end else if(r > 255) begin
                                  red_o = 255;
                                  blue_o = 255;
                                  green_o = 255;
                            end else begin
                               red_o = r;
                               blue_o = r;
                               green_o = r;
                            end
                            
                            red_o = red_o/16;
                            blue_o = blue_o/16;
                            green_o = green_o/16;
                            redx = {red_o[3],red_o[2], red_o[1], red_o[0]};
                            greenx = {green_o[3],green_o[2], green_o[1], green_o[0]};
                            bluex = {blue_o[3],blue_o[2], blue_o[1], blue_o[0]};
                         end
                

            end
            
            else
            begin
            
                redx = 0;
                greenx = 0;
                bluex = 0;
                
            end
        end    
endmodule
