/// xlsx_quantum();
if (current_row == qRow)
{
    if (item.forceNoQuantumText == false)
    {
        if (item.outlayText == NOQUANTUM)       then item.outlayText = " ";
        if (item.professionalText == NOQUANTUM) then item.professionalText = " ";
    }
    
    if  (item.object_index != VAT)
    and (item.object_index != TOTALS)
    and (item.object_index != PAGE_NUMBER)
    and (item.object_index != lastPage_SUBTOTAL)
    and (item.object_index != lastPage_ProVAT)
    and (item.object_index != lastPage_OutlayToTotal)
    and (item.object_index != lastPage_TOTAL)
    {
        xlsx_quantumRegularItem();
    }
    
    /// IRREGULAR QUANTUM
    if (item.object_index == VAT)
    {
        xlsx_VATquantum();
    }
    
    if (item.object_index == TOTALS)
    {
        xlsx_TOTALS_quantum();
    }
    
    if (item.object_index == PAGE_NUMBER)
    {
        xlsx_PAGE_NUMBER_quantum();
    }
    
    if (item.object_index == lastPage_SUBTOTAL)
    {
        xlsx_SUBTOTAL_quantum();
    }
    
    if (item.object_index == lastPage_ProVAT)
    {
        xlsx_proVATquantum();
    }
    
    if (item.object_index == lastPage_OutlayToTotal)
    {
        xlsx_outlayToTotalquantum();
    }
    
    if (item.object_index == lastPage_TOTAL)
    {
        xlsx_TOTALquantum();
    }
}
