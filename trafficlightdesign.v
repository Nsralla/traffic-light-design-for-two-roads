module trafficlightdesign(input clk,go,reset,output reg [1:0]H1,reg [1:0]H2,reg [1:0]F1,reg [1:0]F2); // the module is called traffic light design, we have 3 inputs,clk, go: when its 1 the traffic system work normal and when its 0 the system stops at the current state,reset: when it equals one, the system is returned to the first state
  //also we have 4 outputs, which represent the 4 traffic lights, each one of them is 2bits, to take one of the following status
`define Green 2'b00	//here iam defining the status of each traffic light, first one is green, and give it(00)
`define Red 2'b10//The second status is red, and given (10)
`define Yellow 2'b01// The third status is yellow,it occurs when changing from green to red,and given (01)  
`define Red_Yellow 2'b11 //The fourth status is red_yellow,it occurs when turning from red to green,and given(11) 

parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8,s9=9,s10=10,s11=11,s12=12,s13=13,s14=14,s15=15,s16=16,s17=17;// here we have 18 states, each one represents different status, will be explained oen by one later below.
reg [4:0] timer=0;  //here i defined 5 bits timer, which is a counter to count the delay, and i chose 4 bits matching with the maximum delay which is 30 second.
reg [4:0] current_state=s0;// this is  5 bit register to decide at wich state we are, and it's 5 bits matching with number of states(18),since 2^4=16 wich is not enough. Then initialize it to the first state.



always@(posedge clk or posedge go or posedge reset)begin  // always statement, it will be entered whenever posetive edge of clk,go, or reset happened, so the reset and go are asynchronous
	if(reset==1)//if reset equals one, return to the first state
		begin
			current_state<=s0; //make the current state equlas s0, and what is state zero? it's defined below.
			timer<=0;//make the counter starts from zero
		end	
		
	
	else// if reset doesn't equal 1:
	  begin
			case(current_state)	//case algorithem is used to solve:
				s0:	// if the current state is s0
				begin 
					if(timer==0&&go==1)	  // if the counter reached the maximum delay for the first state(s0), which is (1 second), move to the next state, and restart the counter.
						begin 
							current_state<=s1;
							timer<=0;
						end
					else if(go!=0)
						timer<=timer+1;
						 
				end
	
		
				
				s1://if the current state is (s1), (second state)
				 begin	 
					if(timer==1&&go==1)	   //if the timer reached it's maximum value, and go equal 1, move to the next state, and make the counter start from zero
						begin 
							current_state<=s2;
							timer<=0;
						end	
					else if(go!=0)
						timer<=timer+1;
					
				 end	 
				 
				 
			 s2:  //if the current state is (s2), (third state)
				begin
					if(timer==29&&go==1)//else if the counter reached the maximum delay for the second state(s2) , which is (30 seconds),and go equals one , move to the next state, and restart the counter.
						begin
							 current_state<=s3;
							timer<=0;
						end	
					else if(go!=0) 
						timer<=timer+1;
					
				end
				
	
			s3://if the current state is (s3), (fourth state)
				begin
					if(timer==1&&go==1) //else if the counter reached the maximum delay for the state(s3) , which is (2 seconds),and go equals one , move to the next state, and restart the counter.
						begin
							 current_state<=s4;
							timer<=0;
						end
					else if(go!=0)
						timer<=timer+1;
				
				end
				
						
			s4:	//if the current state is (s4), (fifth state)
				begin
					if(timer==9&&go==1)   //else if the counter reached the maximum delay for the state(s4) , which is (10 seconds),and go equals one , move to the next state, and restart the counter
						begin
							current_state<=s5;
							timer<=0;
						end
					else if(go!=0)
						timer<=timer+1;
					
				end
				
				
	
				s5://if the current state is (s5), (sith state)
					begin
						if(timer==1&& go==1)//else if the counter reached the maximum delay for the state(s5) , which is (2 seconds),and go equals one , move to the next state, and restart the counter
							begin
								 current_state<=s6;
								timer=0;
							end
								else if(go!=0)
								timer<=timer+1;// if go doesn't equal zero, and the counter didn't reach it's maximum value, increase the counter by one
					end	  
					
					
	
	
	s6:	//if the current state is (s6), (seventh state)
	begin
		if(timer==0&&go==1)//else if the counter reached the maximum delay for the state(s6) , which is (1 seconds),and go equals one , move to the next state, and restart the counter
		begin
			current_state<=s7;
			timer<=0;
		end
		else if(go!=0)
			timer<=timer+1;	// if go doesn't equal zero, and the counter didn't reach it's maximum value, increase the counter by one
	end
	
	
	
	s7://if the current state is (s7), (8 state)
	begin
		if(timer==1&&go==1)//else if the counter reached the maximum delay for the state(s7) , which is (2 seconds),and go equals one , move to the next state, and restart the counter
		begin
			current_state<=s8;
			timer<=0;
		end
		else if(go!=0)
			timer<=timer+1;// if go doesn't equal zero, and the counter didn't reach it's maximum value, increase the counter by one
	end
	
	
	
	s8://if the current state is (s8)
	begin
		if(timer==14&&go==1)//else if the counter reached the maximum delay for the state(s8) , which is (15 seconds),and (go) equals one , move to the next state, and restart the counter
		begin
			current_state<=s9;
			timer<=0;
		end
		else if(go!=0)
			timer<=timer+1;	// if go doesn't equal zero, and the counter didn't reach it's maximum value, increase the counter by one
	end
	
	
	
	s9://if the current state is (s9)
	begin
		if(timer==1&&go==1)//else if the counter reached the maximum delay for the state(s9) , which is (2 seconds),and go equals one , move to the next state, and restart the counter
		begin
			current_state<=s10;
			timer<=0;
		end
		else if(go!=0)
			timer<=timer+1;// if go doesn't equal zero, and the counter didn't reach it's maximum value, increase the counter by one
	end
	
	
	
	
	 s10://if the current state is (s10)
		begin
		if(timer==4&&go==1)//else if the counter reached the maximum delay for the state(s10) , which is (5 seconds),and go equals one , move to the next state, and restart the counter
		begin
			current_state<=s11;
			timer<=0;
		end
		else if(go!=0)
			timer<=timer+1;
	end 
	
	
	s11://if the current state is (s11)
		begin
		if(timer==1&&go==1)//else if the counter reached the maximum delay for the state(s11) , which is (2 seconds),and go equals one , move to the next state, and restart the counter
		begin
			current_state<=s12;
			timer<=0;
		end
		else if(go!=0)
			timer<=timer+1;	 // if go doesn't equal zero, and the counter didn't reach it's maximum value, increase the counter by one
	end	 
	
	
	
	
	s12://if the current state is (s12)
	begin
		if(timer==9&&go==1)//else if the counter reached the maximum delay for the state(s12) , which is (10 seconds),and go equals one , move to the next state, and restart the counter
		begin
			current_state<=s13;
			timer<=0;
		end
		else if(go!=0)
			timer<=timer+1;	  // if go doesn't equal zero, and the counter didn't reach it's maximum value, increase the counter by one
	end
	
	
	s13://if the current state is (s13)
	begin
		if(timer==1&&go==1)//else if the counter reached the maximum delay for the state(s13) , which is (2 seconds),and go equals one , move to the next state, and restart the counter
		begin
			current_state<=s14;
			timer<=0;
		end
		else if(go!=0)
			timer<=timer+1;	// if go doesn't equal zero, and the counter didn't reach it's maximum value, increase the counter by one
	end
	
	
	
	
	 
	s14://if the current state is (s14)
		begin
		if(timer==0&&go==1)//else if the counter reached the maximum delay for the state(s14) , which is (1 seconds),and go equals one , move to the next state, and restart the counter
		begin
			current_state<=s15;
			timer<=0;
		end
		else if(go!=0)
			timer<=timer+1;// if go doesn't equal zero, and the counter didn't reach it's maximum value, increase the counter by one
	end	
	
	
	
	
	s15://if the current state is (s15)
		begin
		if(timer==1&&go==1)//else if the counter reached the maximum delay for the state(s15) , which is (2 seconds),and go equals one , move to the next state, and restart the counter
		begin
			current_state<=s16;
			timer<=0;
		end
		else if(go!=0)
			timer<=timer+1;// if go doesn't equal zero, and the counter didn't reach it's maximum value, increase the counter by one
	end	 
	
	
	
	s16://if the current state is (s16)
	begin
		if(timer==14&&go==1)//else if the counter reached the maximum delay for the state(s15) , which is (15 seconds),and go equals one , move to the next state, and restart the counter
		begin
			current_state<=s17;
			timer<=0;
		end
		else if(go!=0)
			timer<=timer+1;// if go doesn't equal zero, and the counter didn't reach it's maximum value, increase the counter by one
	end  
	
	s17://if the current state is (s17)
	begin
		if(timer==2&&go==1)//else if the counter reached the maximum delay for the state(s17) , which is (3 seconds),and go equals one , go back to the first state, and restart the counter.
		begin
			current_state<=s0;
			timer<=0;
		end
		else if(go!=0)
			timer<=timer+1;// if go doesn't equal zero, and the counter didn't reach it's maximum value, increase the counter by one
	end
	



		endcase
	end

end



always@(posedge clk or posedge go or posedge reset)	//This always statement will work in parallel with the first one, and will be entered whenever posetive edge of clk,go,or reset. So Asynchronus method.
	begin
		case(current_state)	//using case algorithem
		s0:// if the current state is(s0)
		begin
		H1<=`Red;// make the first high way traffic light red
		H2<=`Red;// make the second high way traffic light red
		F1<=`Red;// make the first farm way traffic light red
		F2<=`Red;// make the second farm way traffic light red
		end	
	

	s1:
		begin
		H1<=`Red_Yellow;// make the first high way traffic light red_yellow	(read and yellow together)
		H2<=`Red_Yellow;// make the second high way traffic light red_yellow
		F1<=`Red; // make the first farm way traffic light red
		F2<=`Red;// make the second farm way traffic light red
		end

	s2:
		begin
		H1<=`Green;// make the first high way traffic light green
		H2<=`Green;// make the second high way traffic light green
		F1<=`Red;// make the first farm way traffic light red
		F2<=`Red;// make the second farm way traffic light red
		end

	s3:
		begin
		H1<=`Green;// make the first high way traffic light green
		H2<=`Yellow;// make the second high way traffic light yellow
		F1<=`Red; // make the first farm way traffic light red
		F2<=`Red; // make the second farm way traffic light red
		end

	s4:
		begin
		H1<=`Green;// make the first high way traffic light green
		H2<=`Red;// make the second high way traffic light red
		F1<=`Red; // make the first farm way traffic light red
		F2<=`Red;// make the second farm way traffic light red
		end

	s5:
		begin
		H1<=`Yellow;// make the first high way traffic light yellow
		H2<=`Red;// make the second high way traffic light red
		F1<=`Red;// make the first farm way traffic light red
		F2<=`Red;// make the second farm way traffic light red
		end

	s6:
		begin
		H1<=`Red;// make the first high way traffic light red
		H2<=`Red;// make the second high way traffic light red
		F1<=`Red;// make the first farm way traffic light red
		F2<=`Red;// make the second farm way traffic light red
		end


s7:
	begin
		H1<=`Red;// make the first high way traffic light red
		H2<=`Red;// make the second high way traffic light red
		F1<=`Red_Yellow;// make the first farm way traffic light yellow_red
		F2<=`Red_Yellow;// make the second farm way traffic light yellow_red
	end 
	

	s8:
	begin
		H1<=`Red;// make the first high way traffic light red
		H2<=`Red; // make the second high way traffic light red
		F1<=`Green;	// make the first farm way traffic light green
		F2<=`Green;	// make the second farm way traffic light green
	end	
	

	s9:
	begin
		H1<=`Red; // make the first high way traffic light red
		H2<=`Red;// make the second high way traffic light red
		F1<=`Green;	// make the first farm way traffic light green
		F2<=`Yellow;// make the second farm way traffic light yellow
	end
	
	
	s10:
	begin
		H1<=`Red;// make the first high way traffic light red
		H2<=`Red; // make the second high way traffic light red
		F1<=`Green;// make the first farm way traffic light green
		F2<=`Red; // make the second farm way traffic light red
	end  
	

	s11:
	begin
		H1<=`Red;// make the first high way traffic light red
		H2<=`Red; // make the second high way traffic light red
		F1<=`Yellow; // make the first farm way traffic light yellow
		F2<=`Red_Yellow;// make the second farm way traffic light red_yellow
	end

	s12:
	begin
		H1<=`Red;// make the first high way traffic light red
		H2<=`Red; // make the second high way traffic light red
		F1<=`Red;// make the first farm way traffic light red
		F2<=`Green;// make the second farm way traffic light green
	end

	s13:
	begin
		H1<=`Red;// make the first high way traffic light red
		H2<=`Red;// make the second high way traffic light red
		F1<=`Red;// make the first farm way traffic light red
		F2<=`Yellow;// make the second farm way traffic light yellow
	end

	s14:
	begin
		H1<=`Red;// make the first high way traffic light red
		H2<=`Red;// make the second high way traffic light red
		F1<=`Red; // make the first farm way traffic light red
		F2<=`Red;// make the second farm way traffic light red
	end

	s15:
	begin
		H1<=`Red;// make the first high way traffic light red
		H2<=`Red_Yellow;// make the second high way traffic light red_yellow
		F1<=`Red;  // make the first farm way traffic light red
		F2<=`Red;// make the second farm way traffic light red
	end  
	
	
	s16:
	begin
		H1<=`Red;// make the first high way traffic light red
		H2<=`Green;// make the second high way traffic light green
		F1<=`Red;// make the first farm way traffic light red
		F2<=`Red;// make the second farm way traffic light red
	end
	

	s17:
	begin
		H1<=`Red;// make the first high way traffic light red
		H2<=`Yellow;// make the second high way traffic light yellow
		F1<=`Red;// make the first farm way traffic light red
		F2<=`Red;// make the second farm way traffic light red
	end


	endcase
	end
endmodule  


 //////////////////////////////////////////////////////
		
//////////////////////////////////////////////////////////////////////		
//////////////////////////////////////////////////////////////	


module verification(); 
	reg clk,reset,go;
	reg global_clk=1;
	
	reg [7:0] result;	   //result from my code
	reg [7:0] expected_result;//the true result
	
	
	
	reg [1:0]H1; // the four traffic lights
	reg [1:0]H2;
	reg [1:0]F1;
	reg [1:0]F2;  
	
  assign result={H1,H2,F1,F2};	// concatenate them and assign them to result
	
	
	
  always #0.5s global_clk=~global_clk;	

		  
		test_generator tg(global_clk,clk,go,reset);	//instante of the test generator
		trafficlightdesign dat(clk,go,reset,H1,H2,F1,F2);	  //instant of the traffic light design
		refrence_model rm(global_clk,expected_result);	  //instance of the refernce model
		analyzer a(global_clk,expected_result,result);	//instance of the analyzer
	
		
	endmodule

//////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
module refrence_model(input global_clk,output reg [7:0] expected_result);  //will contain the true output
	
	initial begin
	expected_result=8'b10101010;   //initilize the expected result(true output)
	end
	reg [7:0] ram [17:0];	//array to save the true value
	initial begin
	ram[0]<=8'b10101010;	 
	ram[1]<=8'b11111010;
	ram[2]<=8'b00001010;	//assiging each cell to one of the 18 states
	ram[3]<=8'b00011010;
	ram[4]<=8'b00101010;
	ram[5]<=8'b01101010;
	ram[6]<=8'b10101010;
	ram[7]<=8'b10101111;
	ram[8]<=8'b10100000;
	ram[9]<=8'b10100001;
	ram[10]<=8'b10100010; 
	ram[11]<=8'b10100111;
	ram[12]<=8'b10101000;
	ram[13]<=8'b10101001;
	ram[14]<=8'b10101010;
	ram[15]<=8'b10111010;  
	ram[16]<=8'b10001010;
	ram[17]<=8'b10011010;
	end	
	always@(posedge global_clk)begin
		#0s assign expected_result=ram[0];
		#1s assign expected_result=ram[1]; 
		#2s assign expected_result=ram[2];
		#30s assign expected_result=ram[3];
		#2s assign expected_result=ram[4];		 // NOW THESE VALUES WHEN RESET =0, AND GO=1), 
		// BUT IF YOU WANT TO TRY RESET=1--> REMOVE COMMENTS, AND PUT COMMENTS TO THE CODE THAT DOESN'T HAVE COMMENTS
			// AND IF YOU WANT TI TRY GO=0, I HAVE WRITE THE PROPER CODE FOR THIS CASE AT THE REPORT AT SLIDE (((((((27))))))
		#10s assign expected_result=ram[5];		
		#2s assign expected_result=ram[6];	
		#1s assign expected_result=ram[7];
		#2s assign expected_result=ram[8];
		//#1s assign expected_result=ram[9];//for reset verification
		#15s assign expected_result=ram[9];
		#2s assign expected_result=ram[10];
		#5s assign expected_result=ram[11];
		#2s assign expected_result=ram[12];
		#10s assign expected_result=ram[13];
		#2s assign expected_result=ram[14];
		#1s assign expected_result=ram[15];
		#2s assign expected_result=ram[16];
		#15s assign expected_result=ram[17]; 
		#3s assign expected_result=8'b10011010;
		
		/*#0s assign expected_result=ram[0];	  //for reset verification
		#50s assign expected_result=ram[1]; 
		#2s assign expected_result=ram[2];
		#30s assign expected_result=ram[3];
		#2s assign expected_result=ram[4];	
		#10s assign expected_result=ram[5];		
		#2s assign expected_result=ram[6];	
		#1s assign expected_result=ram[7];
		#2s assign expected_result=ram[8];
		#1s assign expected_result=ram[9];*/
		end
endmodule 
//////////////////////////////////////////////////////
/////////////////////////////////////////////////////
module analyzer(input global_clk,input [7:0] expected_result,input [7:0] result); 	  // TO COMPARE BETWEEN MY RESULT, AND THE TRUE RESULT
	
	always@(posedge global_clk)
		begin
		asserts( expected_result,result);	//CALL THE TASK (ASSERT) WHICH WILL PRINT ERROR IF THEY AREN'T EQUAL, AND SUCCSESFULL IF THEY WERE
		end	
	
	
	 task asserts( input[7:0] expected_result,input[7:0] result);	//ASSERT TASK 
		 if(expected_result==result)
			 $display("running successfully");
		 else 
			 $display("error at %d",$time);
		 endtask
		 
	
	endmodule 
/////////////////////////////////////////////////
///////////////////////////////////////////////////
module test_generator(input global_clk,output reg clk,go,reset);	//TEST GENERATOR TO GENERATES INPUTS FOR THE DESIGN 
		initial begin 
		 clk=1'b0;
	     reset=0;
	     go=1;
	  
		end
			 
	
	always@(posedge global_clk or negedge global_clk)begin
		clk=~clk;
		
	end	
	//always #33s go=~go;	 // for go verification  
		//always #50s reset=~reset;	 //for reset verification
	
	
	endmodule  

		