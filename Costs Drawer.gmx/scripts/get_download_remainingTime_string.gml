///get_download_remainingTime_string(contentLength, sizeDownloaded, transferSpeed)
/* returns string
 *
*/
var contentLength   = argument0;
var sizeDownloaded  = argument1;
var transferSpeed   = argument2;


if  ( !is_undefined(sizeDownloaded) )
and ( !is_undefined(contentLength)  )
and ( !is_undefined(transferSpeed)  )
and ( sizeDownloaded > 0 )
and ( contentLength > 0 )
and ( transferSpeed > 0 )
{
    var calcVal         = 0;
    var returnString    = "";
    var seconds = ((contentLength - sizeDownloaded) / transferSpeed);
    
    var minutes = ((seconds / 60) );
    var hours   = ((seconds / 60) /60);
    
    
    
    if (hours >= 1)
    {
        calcVal      = floor(hours)
        returnString = (string(calcVal) + "h ");
    }
    if (minutes >= 1)
    {
        calcVal      = floor(minutes % 60);
        returnString += (string(calcVal) + "m ");
    }
    // seconds
    calcVal      =  floor(seconds % 60);
    returnString += (string(calcVal) + "s ")
    
    
    return returnString;
}
