clearvars -except m

%Logging Data From Phone
m.AccelerationSensorEnabled = 1;
m.OrientationSensorEnabled = 1;
m.Logging = 1;
pause(10)
[a, time1] = accellog(m);
[o, time2] = orientlog(m);
m.Logging = 0;



%For Unequal Acceleration and Orientation Logs
Size = min(length(time1),length(time2));
Phi_temp_1 = a(1:end, 2);
Theta_temp_1 = o(1:end, 1);

%Setting Matrices to equal sizes
Phi_temp_1 = Phi_temp_1(1:Size);
Theta_temp_1 = Theta_temp_1(1:Size);

%Arm Vector Length
Arm_L_1 = 1;
Arm_1 = Arm_L_1*ones(Size, 1);

%Helpers for conversion of Accelerometer Data
Helper_1 = -1*ones(Size,1);
Helper2_1 = 9.81*ones(Size,1);

%Conversion into Phi angle 
Phi_1 = Helper_1.*Phi_temp_1 + Helper2_1;
Phi_1 = 9.1743*Phi_1;
Ang_Y_1 = Phi_1; %Storing Degree Angles
Phi_1 = pi/180*Phi_1;

%Conversion into Theta angle
Ang_X_1 = Theta_temp_1; %Storing Degree Angles
Theta_1 = pi/180*Theta_temp_1;




%Conversion from Spherical to Rectangular Coordinates 
x = Arm_1.*sin(Phi_1).*cos(Theta_1);
y = Arm_1.*sin(Phi_1).*sin(Theta_1);
z = Arm_1.*cos(Phi_1);

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
    q = quiver3([0],[0],[0],[x2],[y2],[z2]);
    q.Color = 'black';
    q.LineWidth = 10;
    q.Marker = 'h';
    q.MarkerSize = 20;
    q.MarkerFaceColor = 'blue';
    q.MarkerEdgeColor = 'blue';
    q.ShowArrowHead = 'on';
    q.AlignVertexCenters = 'on';
    axis([-2 2 -2 2 -2 2])
    drawnow
    pause(.03)
    hold off
end



m.AccelerationSensorEnabled = 0;
m.OrientationSensorEnabled = 0;

%Writing Data to table:
Time = time1(1:Size);
Arm_Length = Arm_1;
Phi_1 = Ang_Y_1;
Theta_1 = Ang_X_1;

T = table(Time, Arm_Length, Phi_1, Theta_1);
writetable(T, 'ArmMotionData.csv', 'WriteRowNames', true);

type 'ArmMotionData.csv'
clearvars -except m



