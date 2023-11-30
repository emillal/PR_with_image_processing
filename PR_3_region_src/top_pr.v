`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2023 12:21:50 PM
// Design Name: 
// Module Name: top_pr
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


module top_pr(
clock,reset,hsync,vsync,red,green,blue,sel
    );
    
 input clock; //100MHz clock
 input reset;
 input [1:0] sel; 
 output reg hsync,vsync;          // outputs fed to VGA input
 output reg [3:0] red,green,blue; // outputs fed to VGA input
 
 wire [3:0] red1,red2,red3,green1,green2,green3,blue1,blue2,blue3; //wires outputs from each PR modules
 
 //Block Ram variables
 reg read = 0;
 reg [14:0] addra;
 reg [95:0] in1 = 0;
 wire [95:0] dout;
	
 reg hblank=0,vblank=0;
 reg clk;
 reg [9:0] hc=0;      
 reg [9:0] vc=0;
  
   initial begin
   hsync =0;
   vsync=0;
   end
   initial begin
   addra =0;
   end
   initial begin
   clk = 0;
   end
   
   
   always@(posedge clock)
   begin
    clk<=~clk; //50 MHz clock 
   end
  
 //Block RAM where COE file of image is obtained 
    
 blk_mem_gen_0 image0 (
  .clka(clk),      // input wire clka
  .ena(1),         // input wire ena
  .wea(read),      // input wire [0 : 0] wea
  .addra(addra),   // input wire [14 : 0] addra
  .dina(in1),      // input wire [95 : 0] dina
  .douta(dout)     // output wire [95 : 0] douta
);

   
   wire pixel_clk;
   reg 		pcount = 0;
   wire 	ec = (pcount == 0);
   always @ (posedge clk) pcount <= ~pcount;
   assign 	pixel_clk = ec;     //25 MHz clock
   
   
   
   wire 	hsyncon,hsyncoff,hreset,hblankon;
   assign 	hblankon = ec & (hc == 639);    
   assign 	hsyncon = ec & (hc == 655);
   assign 	hsyncoff = ec & (hc == 751);
   assign 	hreset = ec & (hc == 799);
   
   wire 	blank =  (vblank | (hblank & ~hreset));    
   wire 	vsyncon,vsyncoff,vreset,vblankon;
   assign 	vblankon = hreset & (vc == 479);    
   assign 	vsyncon = hreset & (vc == 490);
   assign 	vsyncoff = hreset & (vc == 492);
   assign 	vreset = hreset & (vc == 523);

   always @(posedge clk) begin
   hc <= ec ? (hreset ? 0 : hc + 1) : hc;
   hblank <= hreset ? 0 : hblankon ? 1 : hblank;
   hsync <= hsyncon ? 0 : hsyncoff ? 1 : hsync; 
   
   vc <= hreset ? (vreset ? 0 : vc + 1) : vc;
   vblank <= vreset ? 0 : vblankon ? 1 : vblank;
   vsync <= vsyncon ? 0 : vsyncoff ? 1 : vsync;
end
 
 //Block RAM address increment for pixels to be displayed on Monitor  
 always @(posedge pixel_clk)
 begin
    if(blank == 0 && hc >= 100 && hc < 260 && vc >= 100 && vc < 215)
            begin
            if(addra <18399 && ~reset)
                    addra = addra + 1;
                else
                    addra = 0;
            end
 end
   
//  PR module 1 -  orginal image (RGB)
    pr_operation im1(.pixel_clk(pixel_clk),
    .blank(blank),.hc(hc),.vc(vc),.dout(dout),
    .redx(red1),.greenx(green1),.bluex(blue1),.reset(reset)
    );

// PR module 2 - Grayscale image    
   pr_operation im2(.pixel_clk(pixel_clk),
    .blank(blank),.hc(hc),.vc(vc),.dout(dout),
    .redx(red2),.greenx(green2),.bluex(blue2),.reset(reset)
    );
    
// PR module 3 - Edge detected image    
   pr_operation im3(.pixel_clk(pixel_clk),
    .blank(blank),.hc(hc),.vc(vc),.dout(dout),
    .redx(red3),.greenx(green3),.bluex(blue3),.reset(reset)
    );
    
    
    
    
// Mux logic       
  always @ (posedge clock) 
    begin
    if(sel == 2'b00) begin
        red = red1;
        blue = blue1;
        green = green1;
        end
    else if (sel == 2'b01)
    begin
        red = red2;
        blue = blue2;
        green = green2;
    end
    else if(sel == 2'b10)
    begin
    	red = red3;
    	blue = blue3;
    	green = green3;
    end
    else
    begin
    	red = 0;
    	blue = 0;
    	green = 0;
    end
  end
  
 
endmodule
