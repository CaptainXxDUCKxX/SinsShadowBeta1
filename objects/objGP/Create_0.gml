/// GRAPPLE POINT VARIABLES 

//fixtureGP is a variable where we create the Anchor Point as a fixture in physics
fixtureGP = physics_fixture_create();


/// This needs to be in  objAPH, because Amelia is the one creating the rope
/// This code will be split into two groups: the variables, going into objAPH's "Create"
/// and the functions, going into objAPH's "Step"

