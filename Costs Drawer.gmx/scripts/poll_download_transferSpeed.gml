/// poll_download_transferSpeed(sizeDownloaded);
/* Note: unencapsulated - directly affects class variables
 * Calculates the transfer speed in bytes per second by
 * polling once a second and checking the difference between
 * the amount downloaded since the last polling.
*/

if  ((get_timer()/1000) >= poll_timer )
and (!is_undefined(sizeDownloaded) )
and (sizeDownloaded > 0)
{
    //sizeDownloaded += random_range(10000,11000); // DEBUG (simulates an internet connection)
    transferSpeed = (sizeDownloaded - prevSizeDownloaded);
    
    
    // calculate average
    transferSpeedResults[transferSpeedPollCount] = transferSpeed; // add to array
    transferSpeedPollCount++;
    if (transferSpeedPollCount == pollRate) // every few polls/seconds
    {
        averageTransferSpeed = 0;
        var size = array_length_1d(transferSpeedResults);
        
        for (var i=0; i<size; i++)
        {
            averageTransferSpeed += transferSpeedResults[i];
        }
        
        averageTransferSpeed /= size;
        reset_download_transferSpeed_array();
    }
    
    
    
    // setup for next polling
    poll_timer = ((get_timer()/1000) + 1000); // one second interval
    prevSizeDownloaded = sizeDownloaded;
}
