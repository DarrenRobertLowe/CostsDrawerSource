/// editing_item(id)

var item = argument0;

if (item.editingDescription  == true)
or (item.editingOutlay       == true)
or (item.editingProfessional == true)
or (item.editingYear         == true)
or (item.editingMonth        == true)
or (item.editingDay          == true)
then return true
else return false
