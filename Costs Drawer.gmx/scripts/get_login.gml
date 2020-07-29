///get_login();
//show_debug_message("get_login() and login "+string(login));
/*
if (usernameEntered == false)
{
    show_debug_message("usernameEntered = "+string(usernameEntered));
    usr = get_string_async("Enter Login Name", user);
}
else
{
    if (passwordEntered == false)
    {
        show_debug_message("passwordEntered = "+string(passwordEntered));
        cod = get_string_async("Enter Password", pass);
    }
    else
    {
        show_debug_message("usernameEntered = "+string(usernameEntered));
        show_debug_message("passwordEntered = "+string(passwordEntered));
        login = 1;
    }
}
*/


userpass = get_string("Enter validation code","");

if  (string(userpass) != "")
and (string(userpass) != -1)
{
    login = 1;
}

if (string(userpass) == "")
{
    show_message("Costs Drawer requires authentication to run. Please enter a valid passcode, or contact support at "+string(DEVELOPER_EMAIL));
    game_end();
}
