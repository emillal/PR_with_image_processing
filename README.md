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

## Schematic

Below given is the post implementation schematic.It has been done of 3 Partial reconfigurations.<br />

![Post_Imp_schematic](https://github.com/mrdunker/PR_with_image_processing/assets/38190245/5c5a2e99-736e-4e80-be11-be7d4d3dc3f5)
<br />
![Screenshot from 2023-11-30 16-55-46](https://github.com/mrdunker/PR_with_image_processing/assets/75561390/4afd5c53-ad8b-4bed-98d4-84be9435a967)

### The project files are uploaded in the Drive [here](https://iiitbac-my.sharepoint.com/personal/akul_sinha_iiitb_ac_in/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fakul%5Fsinha%5Fiiitb%5Fac%5Fin%2FDocuments%2FFPGA%5FProject&ct=1701364478724&or=OWA%2DNT&cid=94e259e6%2D3e0b%2Da64f%2D4c96%2D7a0535d866c1&fromShare=true&ga=1)
