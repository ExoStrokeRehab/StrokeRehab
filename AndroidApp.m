delete(m)
connector on StrokeStuff;
m = mobiledev;
m.AngularVelocitySensorEnabled = 1;
m.Logging = 1;
pause(15);
m.Logging = 0;
[av, tav] = angvellog(m);
pause(0.2)
showLatestValues(m)
