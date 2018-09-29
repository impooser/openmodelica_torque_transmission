model Thruster_Assumption
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute_base(phi(fixed = true, start = 0.785398))  annotation(
    Placement(visible = true, transformation(origin = {-26, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(g = 0)  annotation(
    Placement(visible = true, transformation(origin = {-68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder arm(diameter = 0.05, length = 1, lengthDirection = {0, 1, 0}, r = {0, 1, 0})  annotation(
    Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(n = {0,  0,1})  annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder Thruster_part1(diameter = 0.05, length = 0.5, lengthDirection = {-1, 0, 0}, r = {-0.5, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {60, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder Thruster_part2(diameter = 0.05, length = 0.5, lengthDirection = {1, 0, 0}, r = {0.5, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {60, -18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass1(m = 5)  annotation(
    Placement(visible = true, transformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass2(m = 0)  annotation(
    Placement(visible = true, transformation(origin = {60, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.WorldTorque torque annotation(
    Placement(visible = true, transformation(origin = {-38, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const[3](k = {0, 0, 5})  annotation(
    Placement(visible = true, transformation(origin = {-74, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(torque.frame_b, revolute_base.frame_b) annotation(
    Line(points = {{-28, 40}, {-16, 40}, {-16, 0}, {-16, 0}}, color = {95, 95, 95}));
  connect(const.y, torque.torque) annotation(
    Line(points = {{-63, 40}, {-50, 40}}, color = {0, 0, 127}));
  connect(Thruster_part2.frame_b, pointMass2.frame_a) annotation(
    Line(points = {{60, -28}, {60, -28}, {60, -38}, {60, -38}}, color = {95, 95, 95}));
  connect(Thruster_part1.frame_b, pointMass1.frame_a) annotation(
    Line(points = {{60, 28}, {60, 28}, {60, 40}, {60, 40}}, color = {95, 95, 95}));
  connect(revolute1.frame_b, Thruster_part1.frame_a) annotation(
    Line(points = {{40, 0}, {60, 0}, {60, 8}}, color = {95, 95, 95}));
  connect(revolute1.frame_b, Thruster_part2.frame_a) annotation(
    Line(points = {{40, 0}, {60, 0}, {60, -8}}, color = {95, 95, 95}));
  connect(arm.frame_b, revolute1.frame_a) annotation(
    Line(points = {{12, 0}, {20, 0}}, color = {95, 95, 95}));
  connect(world.frame_b, revolute_base.frame_a) annotation(
    Line(points = {{-58, 0}, {-36, 0}}, color = {95, 95, 95}));
  connect(revolute_base.frame_b, arm.frame_a) annotation(
    Line(points = {{-16, 0}, {-8, 0}}, color = {95, 95, 95}));
  annotation(
    uses(Modelica(version = "3.2.2")));end Thruster_Assumption;