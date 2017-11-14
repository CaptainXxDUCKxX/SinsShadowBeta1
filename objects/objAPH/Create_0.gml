/// THIS OBJECT IS A PLACEHOLDER FOR AMELIA 

//fixtureAmelia creates this object as a fixture in physics
//then, you give it a shape, and create a rope between the two objects

fixtureAmelia = physics_fixture_create();
physics_fixture_set_circle_shape(fixtureAmelia, 5);
physics_joint_rope_create(objAPH, objGP, objAPH.x, objAPH.y, objGP.x, objGP.y, 256, false);
