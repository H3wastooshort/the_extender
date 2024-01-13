/*battery=[60,55,25];

wall_thickness=3;

module __Customizer_Limit__ () {}*/

board=[52,52,7];

translate([0,0,-(board.z+battery.z)]) union() {
difference() {
union() {
	translate([-board.x/2 -wall_thickness/2, 0,0]) cube([board.x+wall_thickness*2,board.y+wall_thickness*2,board.z+wall_thickness]);

	translate([-battery.x/2 -wall_thickness/2, 0,board.z]) 
		difference() {
			cube([battery.x+wall_thickness*2,battery.y+wall_thickness*2,battery.z+wall_thickness]);
			translate([wall_thickness,wall_thickness,wall_thickness+0.001]) cube(battery);
	}
}
union() {
	translate([-board.x/2, wall_thickness, wall_thickness]) cube([board.x,board.y-wall_thickness,board.z+wall_thickness*2]);
	translate([-board.x/2, 0, wall_thickness]) cube([board.x,wall_thickness, board.z]);
}
}


//connector fill here 
}