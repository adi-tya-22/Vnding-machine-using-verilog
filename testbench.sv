module tb_vending_machine;

    // Inputs
    reg clk;
    reg reset;
    reg one_rupee;
    reg two_rupees;
    reg five_rupees;

    // Outputs
    wire dispense;
    wire [6:0] amount;

    // Instantiate the vending machine
    vending_machine uut (
        .clk(clk),
        .reset(reset),
        .one_rupee(one_rupee),
        .two_rupees(two_rupees),
        .five_rupees(five_rupees),
        .dispense(dispense),
        .amount(amount)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Clock period of 10 time units
    end

    // Test sequence
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 0;
        one_rupee = 0;
        two_rupees = 0;
        five_rupees = 0;

        // Apply reset
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Test case 1: Insert 1 Rupee
        one_rupee = 1;
        #10;
        one_rupee = 0;
        #10;

        // Check amount and dispense
        $display("Time: %0t | Amount: %d, Dispense: %b", $time, amount, dispense);

        // Test case 2: Insert 2 Rupees
        two_rupees = 1;
        #10;
        two_rupees = 0;
        #10;

        // Check amount and dispense
        $display("Time: %0t | Amount: %d, Dispense: %b", $time, amount, dispense);

        // Test case 3: Insert 5 Rupees
        five_rupees = 1;
        #10;
        five_rupees = 0;
        #10;

        // Check amount and dispense
        $display("Time: %0t | Amount: %d, Dispense: %b", $time, amount, dispense);

        // Test case 4: Insert more coins to reach 10 Rupees
        one_rupee = 1;
        #10;
        one_rupee = 0;
        #10;

        // Check amount and dispense
        $display("Time: %0t | Amount: %d, Dispense: %b", $time, amount, dispense);

        // Insert another 5 Rupees to reset the amount and test dispensing
        five_rupees = 1;
        #10;
        five_rupees = 0;
        #10;

        // Check amount and dispense
        $display("Time: %0t | Amount: %d, Dispense: %b", $time, amount, dispense);

        // End simulation
        $stop;
    end

endmodule
