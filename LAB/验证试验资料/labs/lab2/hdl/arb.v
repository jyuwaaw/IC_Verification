/******************************************************************
 *                        Chronologic VCS (TM)                    *
 *              Copyright (c) 1991-2005 by Synopsys Inc.          *
 *                        ALL RIGHTS RESERVED                     *
 *                                                                *
 *    CONFIDENTIAL AND PROPRIETARY INFORMATION OF SYNOPSYS INC.   *
 ******************************************************************/

module arb (arb_if.DUT arbif, input bit clk);

  parameter IDLE = 2, GRANT0 = 0, GRANT1 = 1;

  reg  last_winner;
  reg winner;
  reg [1:0] next_grant;

  reg [1:0] state, nxState;
  
  always @(state or arbif.request or last_winner or arbif.grant)
  begin
     nxState = state;		// hold state by default  
     winner = last_winner;	// hold its value 
     next_grant = arbif.grant;

     case(state)
     IDLE: begin
	next_grant[0] = arbif.request[0] & ~(arbif.request[1] & ~last_winner);
	next_grant[1] = arbif.request[1] & ~(arbif.request[0] &  last_winner);
	if(next_grant[0])
	   winner = 1'b0;
	if(next_grant[1])
	   winner = 1'b1;
        if(next_grant[0] == 1'b1)
	   nxState = GRANT0;
	if(next_grant[1] == 1'b1)
	   nxState = GRANT1;
	if(next_grant[1:0] == 2'b11)
	   $display("ERROR: two grants asserted simultaneously");
     end      

     GRANT0: begin
	if(~arbif.request[0]) begin
	   next_grant[0] = 1'b0;
	   nxState = IDLE;
        end
     end

     GRANT1: begin
	if(~arbif.request[1]) begin
	   next_grant[1] = 1'b0;
	   nxState = IDLE;
	end
     end
     endcase
  end

  always @(posedge clk or posedge arbif.reset) begin
     if (arbif.reset) begin
        state <= IDLE;
	last_winner <= 1'b0;
	arbif.grant <= 2'b00;
     end
     else begin    
        state <= nxState;
        last_winner <= winner;
        arbif.grant <= next_grant;
     end
  end

endmodule
