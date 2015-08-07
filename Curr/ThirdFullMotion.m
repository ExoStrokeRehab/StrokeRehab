clearvars -except m
%--------------------------------------------------------------------------
%Logging Data From Phone
m.AccelerationSensorEnabled = 1;
m.OrientationSensorEnabled = 1;
m.Logging = 1;
pause(10)
[a, time1] = accellog(m);
[o, time2] = orientlog(m);
m.Logging = 0;


%--------------------------------------------------------------------------
%For Unequal Acceleration and Orientation Logs
Size = min(length(time1),length(time2));

Phi_temp_1 = a(1:end, 2);
Theta_temp_1 = o(1:end, 1);

Phi_temp_2 = a(1:end, 2);
Theta_temp_2 = o(1:end, 1);

Phi_temp_3 = a(1:end, 2);
Theta_temp_3 = o(1:end, 1);

%Setting Matrices to equal sizes
Phi_temp_1 = Phi_temp_1(1:Size);
Theta_temp_1 = Theta_temp_1(1:Size);

Phi_temp_2 = Phi_temp_2(1:Size);
Theta_temp_2 = Theta_temp_2(1:Size);

Phi_temp_3 = Phi_temp_3(1:Size);
Theta_temp_3 = Theta_temp_3(1:Size);


%--------------------------------------------------------------------------
%Arm_1 Vector Length
Arm_L_1 = 2;
Arm_1 = Arm_L_1*ones(Size, 1);

%Arm_2 Vector Length
Arm_L_2 = 1.5;
Arm_2 = Arm_L_2*ones(Size, 1);

%Arm_3 Vector Length
Arm_L_3 = .5;
Arm_3 = Arm_L_3*ones(Size, 1);


%--------------------------------------------------------------------------

%Arm 1------------------------------------------
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

%Arm 2------------------------------------------
%Helpers for conversion of Accelerometer Data
Helper_2 = -1*ones(Size,1);
Helper2_2 = 9.81*ones(Size,1);

%Conversion into Phi angle 
Phi_2 = Helper_2.*Phi_temp_2 + Helper2_2;
Phi_2 = 9.1743*Phi_2;
Ang_Y_2 = Phi_2; %Storing Degree Angles
Phi_2 = pi/180*Phi_2;

%Conversion into Theta angle
Ang_X_2 = Theta_temp_2; %Storing Degree Angles
Theta_2 = pi/180*Theta_temp_2;

%Arm 3------------------------------------------
%Helpers for conversion of Accelerometer Data
Helper_3 = -1*ones(Size,1);
Helper2_3 = 9.81*ones(Size,1);

%Conversion into Phi angle 
Phi_3 = Helper_3.*Phi_temp_3 + Helper2_3;
Phi_3 = 9.1743*Phi_3;
Ang_Y_3 = Phi_3; %Storing Degree Angles
Phi_3 = pi/180*Phi_3;

%Conversion into Theta angle
Ang_X_3 = Theta_temp_3; %Storing Degree Angles
Theta_3 = pi/180*Theta_temp_3;





%--------------------------------------------------------------------------
%Conversion from Spherical to Rectangular Coordinates 
%Arm 1
x_1 = Arm_1.*sin(Phi_1).*cos(Theta_1);
y_1 = Arm_1.*sin(Phi_1).*sin(Theta_1);
z_1 = Arm_1.*cos(Phi_1);

%Arm 2
x_2 = Arm_2.*sin(Phi_2).*cos(Theta_2);
y_2 = Arm_2.*sin(Phi_2).*sin(Theta_2);
z_2 = Arm_2.*cos(Phi_2);

%Arm 3
x_3 = Arm_3.*sin(Phi_3).*cos(Theta_3);
y_3 = Arm_3.*sin(Phi_3).*sin(Theta_3);
z_3 = Arm_3.*cos(Phi_3);


%--------------------------------------------------------------------------
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

%--------------------------------------------------------------------------
%Graphing loop
for j = 1:Size
    %Plot Axes
    plot3(t1a, t1b, t1c);
    hold on
    plot3(t2a, t2b, t2c);
    hold on
    plot3(t3a, t3b, t3c);
    hold on
    
    %Coordinate Set
    %Arm 1
    x2_begin_1 = 0;
    y2_begin_1 = 0;
    z2_begin_1 = 0;
    
    x2_1 = x_1(j);
    y2_1 = y_1(j);
    z2_1 = z_1(j);
    
    %Arm_2
    x2_begin_2 = x2_1;
    y2_begin_2 = y2_1;
    z2_begin_2 = z2_1;
    
    x2_2 = x_2(j) + x2_begin_2;
    y2_2 = y_2(j) + y2_begin_2;
    z2_2 = z_2(j) + z2_begin_2;
    
    %Arm_3
    x2_begin_3 = x2_2;
    y2_begin_3 = y2_2;
    z2_begin_3 = z2_2;
    
    x2_3 = x_3(j) + x2_begin_3;
    y2_3 = y_3(j) + y2_begin_3;
    z2_3 = z_3(j) + z2_begin_3;
    
    %Arm_1
    q_1 = quiver3([x2_begin_1],[y2_begin_1],[z2_begin_1],[x2_1],[y2_1],[z2_1]);
    q_1.Color = 'black';
    q_1.LineWidth = 10;
    q_1.Marker = 'h';
    q_1.MarkerSize = 20;
    q_1.MarkerFaceColor = 'blue';
    q_1.MarkerEdgeColor = 'blue';
    q_1.ShowArrowHead = 'off';
    q_1.AlignVertexCenters = 'on';
    hold on
    
    %Arm_2
    q_2 = quiver3([x2_begin_2],[y2_begin_2],[z2_begin_2],[x2_2],[y2_2],[z2_2]);
    q_2.Color = 'black';
    q_2.LineWidth = 10;
    q_2.Marker = 'h';
    q_2.MarkerSize = 20;
    q_2.MarkerFaceColor = 'blue';
    q_2.MarkerEdgeColor = 'blue';
    q_2.ShowArrowHead = 'off';
    q_2.AlignVertexCenters = 'on';
    hold on
    
    %Arm_3
    q_3 = quiver3([x2_begin_3],[y2_begin_3],[z2_begin_3],[x2_3],[y2_3],[z2_3]);
    q_3.Color = 'black';
    q_3.LineWidth = 10;
    q_3.Marker = 'h';
    q_3.MarkerSize = 20;
    q_3.MarkerFaceColor = 'blue';
    q_3.MarkerEdgeColor = 'blue';
    q_3.ShowArrowHead = 'on';
    q_3.AlignVertexCenters = 'on';
    hold on
    
    axis([-5 5 -5 5 -5 5])
    drawnow
    pause(.03)
    hold off
end



%--------------------------------------------------------------------------
%Disable Sensors
m.AccelerationSensorEnabled = 0;
m.OrientationSensorEnabled = 0;

%Writing Data to table:

Time = time1(1:Size);
%Arm_1
Arm_Length_1 = Arm_1;
Phi_1 = Ang_Y_1;
Theta_1 = Ang_X_1;

%Arm_2
Arm_Length_2 = Arm_2;
Phi_2 = Ang_Y_2;
Theta_2 = Ang_X_2;

%Arm_3
Arm_Length_3 = Arm_3;
Phi_3 = Ang_Y_3;
Theta_3 = Ang_X_3;

%Write Table
T = table(Time, Arm_Length_1, Phi_1, Theta_1, Arm_Length_2, Phi_2, Theta_2, Arm_Length_3, Phi_3, Theta_3);
writetable(T, 'ArmMotionData.csv', 'WriteRowNames', true);

%Type out CSV file in Command Window
type 'ArmMotionData.csv'
clearvars -except m



