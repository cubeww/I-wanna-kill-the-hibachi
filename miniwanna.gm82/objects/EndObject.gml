#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f=file_text_open_write('data/save/save')
file_text_write_string(f, string(World.death))
file_text_writeln(f)
file_text_write_string(f, string(World.time))
file_text_writeln(f)
file_text_write_string(f, 'clear')
file_text_close(f)
