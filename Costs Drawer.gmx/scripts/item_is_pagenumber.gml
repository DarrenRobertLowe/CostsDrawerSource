/// item_is_pagenumber(id)


var item = argument0;


if  !(is_undefined(item))
and (instance_exists(item))
and (item.object_index == PAGE_NUMBER)
{
    return true;
}
else return false;
