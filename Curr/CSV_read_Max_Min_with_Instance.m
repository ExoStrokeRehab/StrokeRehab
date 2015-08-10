clearvars -except m
Data = csvread('ArmMotionData.csv', 1,0);

Time = Data(1:end, 1);
Size = length(Time);
%--------------------------------------------------------------------------
%Arm_1 Vector Length
Arm_1 = Data(1:end, 2);

%Arm_2 Vector Length
Arm_2 = Data(1:end, 5);

%Arm_3 Vector Length
Arm_3 = Data(1:end, 8);


%--------------------------------------------------------------------------

%Arm 1------------------------------------------
%Phi Angle Setter
Upper_Arm_Phi = pi/180*Data(1:end, 3);
[UAPmax, Upper_Arm_Phi_max] = max(Upper_Arm_Phi);
[UAPmin, Upper_Arm_Phi_min] = min(Upper_Arm_Phi);

%Theta Angle Setter
Upper_Arm_Theta = pi/180*Data(1:end, 4);
[UATmax, Upper_Arm_Theta_max] = max(Upper_Arm_Theta);
[UATmin, Upper_Arm_Theta_min] = min(Upper_Arm_Theta);

%Arm 2------------------------------------------
%Phi Angle Setter
Forearm_Phi = pi/180*Data(1:end, 6);
[FPmax, Forearm_Phi_max] = max(Forearm_Phi);
[FPmin, Forearm_Phi_min] = min(Forearm_Phi);

%Theta Angle Setter
Forearm_Theta = pi/180*Data(1:end, 7);
[FTmax, Forearm_Theta_max] = max(Forearm_Theta);
[FTmin, Forearm_Theta_min] = min(Forearm_Theta);

%Arm 3------------------------------------------
%Phi Angle Setter
Hand_Phi = pi/180*Data(1:end, 9);
[HPmax, Hand_Phi_max] = max(Forearm_Theta);
[HPmin, Hand_Phi_min] = min(Forearm_Theta);

%Theta Angle Setter
Hand_Theta = pi/180*Data(1:end, 10);
[HTmax, Hand_Theta_max] = max(Forearm_Theta);
[HTmin, Hand_Theta_min] = min(Forearm_Theta);





%--------------------------------------------------------------------------
%Conversion from Spherical to Rectangular Coordinates 
%Arm 1
x_1 = Arm_1.*sin(Upper_Arm_Phi).*cos(Upper_Arm_Theta);
y_1 = Arm_1.*sin(Upper_Arm_Phi).*sin(Upper_Arm_Theta);
z_1 = Arm_1.*cos(Upper_Arm_Phi);

%Arm 2
x_2 = Arm_2.*sin(Forearm_Phi).*cos(Forearm_Theta);
y_2 = Arm_2.*sin(Forearm_Phi).*sin(Forearm_Theta);
z_2 = Arm_2.*cos(Forearm_Phi);

%Arm 3
x_3 = Arm_3.*sin(Hand_Phi).*cos(Hand_Theta);
y_3 = Arm_3.*sin(Hand_Phi).*sin(Hand_Theta);
z_3 = Arm_3.*cos(Hand_Phi);


%--------------------------------------------------------------------------
%Line/Axis Plots 
t1a = -8:.01:8;
t1b = 0*t1a;
t1c = 0*t1a;

t2b = -8:.01:8;
t2a = 0*t2b;
t2c = 0*t2b;

t3c = -8:.01:8;
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
    switch(j)
        case Upper_Arm_Phi_max
            q_1.Color = 'blue';
        case Upper_Arm_Phi_min
            q_1.Color = 'red';
        case Upper_Arm_Theta_max
            q_1.Color = 'green';
        case Upper_Arm_Theta_min
            q_1.Color = 'm';
        otherwise
            q_1.Color = 'black';
    end
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
    switch(j)
        case Forearm_Phi_max
            q_2.Color = 'blue';
        case Forearm_Phi_min
            q_2.Color = 'red';
        case Forearm_Theta_max
            q_2.Color = 'green';
        case Forearm_Theta_min
            q_2.Color = 'm';
        otherwise
            q_2.Color = 'black';
    end
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
    switch(j)
        case Hand_Phi_max
            q_3.Color = 'blue';
        case Hand_Phi_min
            q_3.Color = 'red';
        case Hand_Theta_max
            q_3.Color = 'green';
        case Hand_Theta_min
            q_3.Color = 'm';
        otherwise 
            q_3.Color = 'black';
    end
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
    pause(.005)
    hold on
end

%Table Var Names - for min and max export
Upper_Arm_Phi = [UAPmax; Upper_Arm_Phi_max; UAPmin; Upper_Arm_Phi_min];
Upper_Arm_Theta = [UATmax; Upper_Arm_Theta_max; UATmin; Upper_Arm_Theta_min];
Forearm_Phi = [FPmax;Forearm_Phi_max;FPmin; Forearm_Phi_min];
Forearm_Theta = [FTmax;Forearm_Theta_max; FTmin; Forearm_Theta_min];
Hand_Phi = [HPmax; Hand_Phi_max; HPmin; Hand_Phi_min];
Hand_Theta = [HTmax; Hand_Theta_max; HTmin; Hand_Theta_min];

RowNames = {'Max'; 'Time Index # at which Max occurred'; 'Min'; 'Time Index # at which Min occurred'};


%Make and export CSV file with Min and Max values
T = table(Upper_Arm_Phi, Upper_Arm_Theta, Forearm_Phi, Forearm_Theta, Hand_Phi, Hand_Theta, 'RowNames', RowNames);
writetable(T, 'ArmMotion_Min_Max_Data.csv', 'WriteRowNames', true);

%Type out CSV file in Command Window
type 'ArmMotion_Min_Max_Data.csv'
clearvars -except m
