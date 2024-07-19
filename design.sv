module vending_machine (
    input clk,
    input reset,
    input one_rupee,  // 1 Rupee
    input two_rupees, // 2 Rupees
    input five_rupees, // 5 Rupees
    output reg dispense,
    output reg [6:0] amount
);

    reg [6:0] total_amount;

    // Update amount based on coin insertion
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            total_amount <= 7'b0;
            dispense <= 0;
        end else begin
            if (one_rupee)
                total_amount <= total_amount + 1;
            if (two_rupees)
                total_amount <= total_amount + 2;
            if (five_rupees)
                total_amount <= total_amount + 5;
            
            // Check if total amount is 10 Rupees or more
            if (total_amount >= 10) begin
                dispense <= 1;
                total_amount <= total_amount - 10; // Deduct 10 Rupees after dispensing
            end else begin
                dispense <= 0;
            end
        end
    end

    // Assign total amount to output
    always @(*) begin
        amount = total_amount;
    end

endmodule
