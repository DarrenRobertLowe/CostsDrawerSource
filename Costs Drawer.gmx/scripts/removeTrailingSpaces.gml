var desc = argument0;

for(i=string_length(desc); i>0; i-=1){          // repeat through the whole string starting from the end
    if string_char_at(desc,i) = " "
        then desc = string_delete(desc,i,1);    // delete any spaces at the end
    else i=0;                                   // break if there's an actual character there instead of a space
}

return desc;
