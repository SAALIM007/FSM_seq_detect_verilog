//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// File: seq_detect.v
// Purpose: Implement a RTL level design of a sequence detector to detect pattern “10101011”. Including Repetation.  
// Concept: 1. The test-bench reads one bit at a time from an input file called “pattern.in” which contains a stream of 0’s and 1’s to be used as your input pattern. 
//          2. When the sequence detector detects the pattern, output signal “MATCH”, should go HIGH in the same clock cycle and remains high for 1-clock cycle. If “enable” (* active high) is not active then neither grant is generated, nor priorities updated.
//          3. output is written to a file “seq.out”..
// 
// Owner: Rohit Kumar Singh
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


`timescale 1ns / 1ns

module tb_seq_detect();
reg CLK, RST, D_IN;
wire MATCH;
integer output_file,file;

seq_detect dut (.D_IN(D_IN),.CLK(CLK),.RST(RST),.MATCH(MATCH));


always #1 CLK=~CLK;

 initial begin
 file = $fopen("pattern.in","r"); 
    //eof = $feof(file);
 //c = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp
 
 output_file = $fopen("seq.out","w"); // w = For writing
 $fwrite(output_file,"%0t << Starting the Simulation >> \n",$time);
 CLK=0;
 RST=1;
 //D_IN = 1;
 
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp

 
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #8;
 RST=0;
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp
 
 
 //D_IN = 1; //S1
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #1.4;
 
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp
 
 
 //D_IN = 0;
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #2.5;
 
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 1;
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #2.5;
 
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 0;
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #2;
  
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 1; 
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #2.01;
  
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 0; 
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #1.5;
  
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 1;  //Goes to S1
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #1.5;
  
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 // D_IN = 0;  
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #1.5;
  
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 1;
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #1.2;
  
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 0;
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #1.4;
  
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 1;
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);    //101
				 
				 
 #0.8;
  
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 0;
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #1.5;
  
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 1;
 #0.8;
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #1.5;
  
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 0;
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #1.5;
  
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 1;
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);






 #0.8;
  
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 1;
 #0.8;
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #1.5;
  
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 1;
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);
 #0.8;
 
 
 
  
 D_IN = $fgetc(file); //$fgetc returns EOF at the end of file is reached, Additionally : getc(fp) reads the next character from the stream fp 
 
 //D_IN = 1;
 $fwrite(output_file,"At time %0t ns, CLK=%d, RST=%d, D_IN=%d, MATCH=%d \n",
				 $time,CLK,RST, D_IN, MATCH);

 #5;
 $fwrite(output_file,"%0t << Ending the Simulation >> \n",$time);
 $fclose(output_file);
 $fclose(file);
 end
 
      
endmodule

