supply_width = 49.25;
supply_depth = 111.25;
base_height = 120;

plug_width = 48;
plug_height = 28;
plug_margin = 17;

margin = 4;

difference() {

  // basic cube
  cube([
    supply_width + 2*margin,
    supply_depth + 2*margin,
    base_height
  ]);


  // remove the inside of the cube
  translate([2*margin, 2*margin, margin]){
    cube([
      supply_width - 2*margin,
      supply_depth - 2*margin,
      base_height,
    ]);
  }

  translate([margin, margin, margin]){
    cube([
      supply_width,
      supply_depth,
      plug_height + 2*plug_margin,
    ]);
  }

  translate([margin, margin, plug_height + 2*plug_margin + 2*margin]) {
    cube([
      supply_width,
      supply_depth,
      base_height
    ]);
  }

  // remove the hole for the plug
  translate([supply_width + margin, 2*margin, plug_margin]) {
    cube([margin, plug_width, plug_height]);
  }

  // remove screw holes
  translate([0, 2*margin, 2*margin]) {
    cube([margin, 2, 2]);
  }
  translate([0, supply_depth, 2*margin]) {
    cube([margin, 2, 2]);
  }
}

