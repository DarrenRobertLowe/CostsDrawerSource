/// ds_list_swap(list,index1,index2)

var lis  = argument0;
var ind1 = argument1;
var ind2 = argument2;

var vala  = ds_list_find_value(list,ind1);
var valb  = ds_list_find_value(list,ind2);

ds_list_delete(lis,ind1);       // delete the first index
ds_list_insert(lis,ind1,valb);  // replace it with value b

ds_list_delete(lis,ind2);       // delete the 2nd index
ds_list_insert(list,ind2,vala); // replace it with value a
