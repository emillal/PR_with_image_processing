# PR_with_image_processing

Partial reconfiguration done on Image Processing was implemeted using the **ZedBoard Zynq Evaluation and Development Kit** FPGA board.<br />

## ZedBoard Zynq Evaluation and Development Kit

The board shown below is the ZedBoard Zynq Evaluation and Development Kit(xc7z020clg484-1).<br />

![AES-Z7EV-7Z020-G_xlxlg (1) (1)](https://github.com/mrdunker/PR_with_image_processing/assets/38190245/8df072c7-77d7-45ab-b724-4284310991ac)

The documentation on the same can be obtained using the link given: <br />
https://digilent.com/reference/programmable-logic/zedboard/reference-manual?redirect=1

## Procedure

Here Dynamic Partial reconguration is done with different kinds of Image processing techniques made as different reconfigurable modules.<br /> 
The image is loaded into the RTL as a **.coe** file via a Block memory.The RTL codes process the data from the COE file and processes the image as per our needs and displays the same on a monitior Through the VGA port on our board.<br />

