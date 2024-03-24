#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !directory_exists("data") {
    set_working_directory(directory_previous(working_directory))
    if !directory_exists("data") {
        show_error("Data folder not found.", true)
    }
}

sound_add_directory('data/music', '.ogg', 1, 1)
sound_add_directory('data/sfx', '.wav', 0, 1)

clear = 0
death = 0
time = 0
if file_exists('data/save/save') {
    f=file_text_open_read('data/save/save')
    death=real(file_text_read_string(f))
    file_text_readln(f)
    time=real(file_text_read_string(f))
    file_text_readln(f)
    if !file_text_eof(f) {
        clear = 1
    }
    file_text_close(f)
}

if !clear start_room = rmStart
else start_room = rmEnd
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time += 1

var t;
t = floor(time / 50);

roomCaption = "Death: " + string(death) + " - " + "Time: "

roomCaption += string(t div 3600) + ":";
t = t mod 3600;
roomCaption += string(t div 600);
t = t mod 600;
roomCaption += string(t div 60) + ":";
t = t mod 60;
roomCaption += string(t div 10);
t = t mod 10;
roomCaption += string(t);

room_caption = 'I wanna kill the hibachi - ' + roomCaption
#define Other_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_goto(start_room)
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f=file_text_open_write('data/save/save')
file_text_write_string(f, string(World.death))
file_text_writeln(f)
file_text_write_string(f, string(World.time))
if room == rmEnd {
    file_text_writeln(f)
    file_text_write_string(f, 'clear')
}
file_text_close(f)
#define KeyPress_82
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_goto(start_room)
