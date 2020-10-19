///default_items_array_swap(source index, target index);


var source = argument0;
var target = argument1;

// grab the values from the array
var temp10 = array[source, 0];
var temp11 = array[source, 1];
var temp12 = array[source, 2];

var temp20 = array[target, 0];
var temp21 = array[target, 1];
var temp22 = array[target, 2];

// swap the values
array[source, 0] = temp20;
array[source, 1] = temp21;
array[source, 2] = temp22;

array[target, 0] = temp10;
array[target, 1] = temp11;
array[target, 2] = temp12;
