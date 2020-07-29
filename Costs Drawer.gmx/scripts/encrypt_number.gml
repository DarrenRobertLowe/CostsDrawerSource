/// encrypt_number(string digit);
// returns STRING
// takes a number in string format and returns
// a modified string.

var combinedStr = argument0;

var total = 0;
var word  = "";


//2 0 2 0   1  0   1  0   : 6
//Z T Z T   Fi T   Fi T   : j

for(var i=0; i<8; i++)
{
    var num = string_char_at(combinedStr,1);
    num = real(num);
    combinedStr = string_delete(combinedStr,1,1);
    
    // 1st layer
    if (num == 0) then word += "T";
    if (num == 1) then word += "Fi";
    if (num == 2) then word += "Z";
    if (num == 3) then word += "Tp";
    if (num == 4) then word += "Fo";
    if (num == 5) then word += "O";
    if (num == 6) then word += "E";
    if (num == 7) then word += "N";
    if (num == 8) then word += "Si";
    if (num == 9) then word += "Se";

    total += num;
}
// e.g. word = ZTZTFiTFiTj
// ZTZT FiT FiT j
// 2020 10 10   6

word += encrypt_add_counter_char(total);
//show_message("Encrypting: word is now "+string(word)); // e.g. word = ZTZTFiTFiTj

var word = compress_encrypted(word);
//show_message("Encrypting: word is now compressed as "+string(word));

// e.g. word = RTFiTFiTj
//show_message("encrypted word is "+string(word));
word = base64_encode(word);
return word;
