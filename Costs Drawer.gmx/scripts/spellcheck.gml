/// spellcheck(word)
/* @Return BOOL
 * @argument0 word  = the word we're currently checking.
 * 
 * Returns true  when the word is found in our dictionary.
 * Returns false when the word was not found and should be marked as incorrect.
*/

var str = argument0;
str = spellcheck_remove_ignored_chars(str);

if is_punctuation(str) then return true;

// if it contains ONLY numbers, we ignore it.
var digLength = (string_length(string_digits(str)));
if digLength = string_length(str) then return true;



// spellcheck
var pos     = -1;
var char    = string_lower(string_char_at(str, 1));                 // get the first letter

var cap     = string_upper(string_char_at(str,1));                  // grab the first letter as a capital
var strCap  = (cap + string_copy(str,2,string_length(str)))


if (char == "a")
{
    pos = ds_list_find_index(global.DICTIONARY_A, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_A, strCap);
}

if (char == "b")
{
    pos = ds_list_find_index(global.DICTIONARY_B, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_B, strCap);
}

if (char == "c")
{
    pos = ds_list_find_index(global.DICTIONARY_C, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_C, strCap);
}

if (char == "d")
{
    pos = ds_list_find_index(global.DICTIONARY_D, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_D, strCap);
}

if (char == "e")
{
    pos = ds_list_find_index(global.DICTIONARY_E, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_E, strCap);
}


if (char == "f")
{
    pos = ds_list_find_index(global.DICTIONARY_F, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_F, strCap);
}

if (char == "g")
{
    pos = ds_list_find_index(global.DICTIONARY_G, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_G, strCap);
}

if (char == "h")
{
    pos = ds_list_find_index(global.DICTIONARY_H, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_H, strCap);
}

if (char == "i")
{
    pos = ds_list_find_index(global.DICTIONARY_I, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_I, strCap);
}

if (char == "j")
{
    pos = ds_list_find_index(global.DICTIONARY_J, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_J, strCap);
}

if (char == "k")
{
    pos = ds_list_find_index(global.DICTIONARY_K, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_K, strCap);
}

if (char == "l")
{
    pos = ds_list_find_index(global.DICTIONARY_L, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_L, strCap);
}

if (char == "m")
{
    pos = ds_list_find_index(global.DICTIONARY_M, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_M, strCap);
}

if (char == "n")
{
    pos = ds_list_find_index(global.DICTIONARY_N, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_N, strCap);
}
if (char == "o")
{
    pos = ds_list_find_index(global.DICTIONARY_O, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_O, strCap);
}

if (char == "p")
{
    pos = ds_list_find_index(global.DICTIONARY_P, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_P, strCap);
}

if (char == "q")
{
    pos = ds_list_find_index(global.DICTIONARY_Q, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_Q, strCap);
}

if (char == "r")
{
    pos = ds_list_find_index(global.DICTIONARY_R, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_R, strCap);
}

if (char == "s")
{
    pos = ds_list_find_index(global.DICTIONARY_S, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_S, strCap);
}

if (char == "t")
{
    pos = ds_list_find_index(global.DICTIONARY_T, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_T, strCap);
}

if (char == "u")
{
    pos = ds_list_find_index(global.DICTIONARY_U, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_U, strCap);
}

if (char == "v")
{
    pos = ds_list_find_index(global.DICTIONARY_V, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_V, strCap);
}

if (char == "w")
{
    pos = ds_list_find_index(global.DICTIONARY_W, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_W, strCap);
}

if (char == "x")
{
    pos = ds_list_find_index(global.DICTIONARY_X, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_X, strCap);
}

if (char == "y")
{
    pos = ds_list_find_index(global.DICTIONARY_Y, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_Y, strCap);
}

if (char == "z")
{
    pos = ds_list_find_index(global.DICTIONARY_Z, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.DICTIONARY_Z, strCap);
}

// CHECK USER DICTIONARY
if pos == -1
{
    pos = ds_list_find_index(global.USER_DICTIONARY, string_lower(str));
    if (pos == -1) then pos = ds_list_find_index(global.USER_DICTIONARY, strCap);
}

/*
if (pos == -1)
{
    if char = "'" return true;
    if str = "'s" return true;
}
*/

if (pos > -1)
  then return true;
  else return false;

