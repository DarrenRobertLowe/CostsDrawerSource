/// encrypt_add_counter_char(encryptStr);
// returns STRING
// adds a character that determines what the numbers
// when taken individually, add up to.
// max date   2040 12 27
// max value  2039 09 19 = 33;

var count = argument0;
var str = "";

if (count == 0)  then str = "d";
if (count == 1)  then str = "e";
if (count == 2)  then str = "H";
if (count == 3)  then str = "a";
if (count == 4)  then str = "z";
if (count == 5)  then str = "i";
if (count == 6)  then str = "j";
if (count == 7)  then str = "f";
if (count == 8)  then str = "h";
if (count == 9)  then str = "c";
if (count == 10) then str = "q";
if (count == 11) then str = "o";
if (count == 12) then str = "C";
if (count == 13) then str = "p";
if (count == 14) then str = "l";
if (count == 15) then str = "n";
if (count == 16) then str = "k";
if (count == 17) then str = "r";
if (count == 18) then str = "m";
if (count == 19) then str = "t";
if (count == 20) then str = "A";
if (count == 21) then str = "v";
if (count == 22) then str = "w";
if (count == 23) then str = "G";
if (count == 24) then str = "F";
if (count == 25) then str = "b";
if (count == 26) then str = "E";
if (count == 27) then str = "B";
if (count == 28) then str = "s";
if (count == 29) then str = "D";
if (count == 30) then str = "u";
if (count == 31) then str = "y";
if (count == 32) then str = "x";
if (count == 33) then str = "g";

return str;
