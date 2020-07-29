/// decrypt_add_counter_char(char)) then 
// returns INT
// adds a character that determines what the numbers
// when taken individually, add up to.

var count = -1;
var str = argument0;

if (str == "d") then count = 0;
if (str == "e") then count = 1;
if (str == "H") then count = 2;
if (str == "a") then count = 3;
if (str == "z") then count = 4;
if (str == "i") then count = 5;
if (str == "j") then count = 6;
if (str == "f") then count = 7;
if (str == "h") then count = 8;
if (str == "c") then count = 9;
if (str == "q") then count = 10;
if (str == "o") then count = 11;
if (str == "C") then count = 12;
if (str == "p") then count = 13;
if (str == "l") then count = 14;
if (str == "n") then count = 15;
if (str == "k") then count = 16;
if (str == "r") then count = 17;
if (str == "m") then count = 18;
if (str == "t") then count = 19;
if (str == "A") then count = 20;
if (str == "v") then count = 21;
if (str == "w") then count = 22;
if (str == "G") then count = 23;
if (str == "F") then count = 24;
if (str == "b") then count = 25;
if (str == "E") then count = 26;
if (str == "B") then count = 27;
if (str == "s") then count = 28;
if (str == "D") then count = 29;
if (str == "u") then count = 30;
if (str == "y") then count = 31;
if (str == "x") then count = 32;
if (str == "g") then count = 33;

return count;
