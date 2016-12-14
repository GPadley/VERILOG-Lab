#  Experiment 7: Linear Feedback Shift Register (LFSR) and PRBS

In this experiment we looked into using shift registers with linear feedback to get a random sequence generator. Using the equation **1+X+X7** when we write the program we start off with 7'b1 and if there is a 1 in place [6:0] X, X[0] or X[6] then we add on 1 to the bottom, except when they both contain 1s. The first 10 expected outputs are:

| Entry   | Output [Bin]| Decimal | Hexadecimal |
| --------|------------|-------|-------|
| 1  | 0000001   | 1    | 01    |
| 2  | 0000011   | 3    | 03    |
| 3  | 0000111   | 7    | 07    |
| 4  | 0001111   | 15    | 0F    |
| 5  | 0011111   | 31    | 1F    |
| 6  | 0111111   | 63    | 3F    |
| 7  | 1111111   | 127    | 7F    |
| 8  | 1111110   | 126    | 7E    |
| 9  | 1111101   | 125    | 7D    |
| 10  | 1111010  | 122    | 7A    |

This is caused by when the clock edge comes in:

    count <= {count [5:0], count[6]^count[0]};
    
Which shifts the bottom 6 bits to the left and XORs the 6th and 0th bit together to get the output.
