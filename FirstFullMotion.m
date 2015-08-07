clearvars -except m
%Logging Data From Phone
m.AccelerationSensorEnabled = 1;
m.OrientationSensorEnabled = 1;
m.Logging = 1;
pause(5)
[a, time1] = accellog(m);
[o, time2] = orientlog(m);
m.Logging = 0;



%For Unequal Acceleration and Orientation Logs
Size = min(length(time1),length(time2));
Phi_temp = a(1:end, 2);
Theta_temp = o(1:end, 1);

%Setting Matrices to equal sizes
Phi_temp = Phi_temp(1:Size);
Theta_temp = Theta_temp(1:Size);

%Arm Vector Length
Arm_L = 1;
Arm = Arm_L*ones(Size, 1);

%Helpers for conversion of Accelerometer Data
Helper = -1*ones(Size,1);
Helper2 = 9.81*ones(Size,1);

%Conversion into Phi angle 
Phi = Helper.*Phi_temp + Helper2;
Phi = 9.1743*Phi;
Ang_Y = Phi; %Storing Degree Angles
Phi = pi/180*Phi;

%Conversion into Theta angle
Ang_X = Theta_temp; %Storing Degree Angles
Theta = pi/180*Theta_temp;




%Conversion from Spherical to Rectangular Coordinates 
x = Arm.*sin(Phi).*cos(Theta);
y = Arm.*sin(Phi).*sin(Theta);
z = Arm.*cos(Phi);

%Line/Axis Plots 
t1a = -2:.01:2;
t1b = 0*t1a;
t1c = 0*t1a;

t2b = -2:.01:2;
t2a = 0*t2b;
t2c = 0*t2b;

t3c = -2:.01:2;
t3a = 0*t3c;
t3b = 0*t3c;

%Graphing loop
for j = 1:Size
    plot3(t1a, t1b, t1c);
    hold on
    plot3(t2a, t2b, t2c);
    hold on
    plot3(t3a, t3b, t3c);
    hold on
    x2 = x(j);
    y2 = y(j);
    z2 = z(j);
    quiver3([0],[0],[0],[x2],[y2],[z2]);
    axis([-Arm_L Arm_L -Arm_L Arm_L -Arm_L Arm_L])
    drawnow
    pause(.03)
    hold off
end



m.AccelerationSensorEnabled = 0;
m.OrientationSensorEnabled = 0;

%Writing Data to table:
Time = time1(1:Size);
Arm_Length = Arm;
Phi = Ang_Y;
Theta = Ang_X;

T = table(Time, Arm_Length, Phi, Theta);
writetable(T, 'ArmMotionData.csv', 'WriteRowNames', true);

type 'ArmMotionData.csv'
clearvars -except m



