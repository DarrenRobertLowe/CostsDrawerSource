/// count_folios()
/* Calculates and returns the number of folios (74 words)
*/
if  (MASTER.BILL_STARTED == true)
and (global.BILL_COURT == "Highcourt") // circuit court costs are set
{
    var wordCount = 0;
    wordCount = count_words();
    
    global.folios = round(wordCount / 74);
    show_debug_message("words counted = " +string(wordCount) + "#folios = " +string(global.folios) );
    
    
    
    // UPDATE Folios Cost
    if ( exists(lastPage_drawingCostsAndCopy) )
    {
        with(lastPage_drawingCostsAndCopy)
        {
            professional = (global.folios * global.costPerFolio);
            professionalText = formatQuantum(professional);
        }
    }
    else show_debug_message("!!!! ERROR in count_folios() !!!! - lastPage_drawingCostsAndCopy does not exist!");
}
