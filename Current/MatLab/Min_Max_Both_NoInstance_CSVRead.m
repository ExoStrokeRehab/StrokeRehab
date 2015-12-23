function Min_Max_Both_NoInstance_CSVRead()
Data = csvread('RightArmMotionData.csv', 1,0);
Data2 = csvread('LeftArmMotionData.csv', 1,0);

Time = Data(1:end, 1);
Time2 = Data(1:end, 1);

Size = min(length(Time), length(Time2));

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
Upper_Arm_Phi = Data(1:end, 3);
[UAPmax, Upper_Arm_Phi_max] = max(Upper_Arm_Phi);
[UAPmin, Upper_Arm_Phi_min] = min(Upper_Arm_Phi);
Upper_Arm_Phi = pi/180*Upper_Arm_Phi;

%Theta Angle Setter
Upper_Arm_Theta = Data(1:end, 4);
[UATmax, Upper_Arm_Theta_max] = max(Upper_Arm_Theta);
[UATmin, Upper_Arm_Theta_min] = min(Upper_Arm_Theta);
Upper_Arm_Theta = pi/180*Upper_Arm_Theta;

%Arm 2------------------------------------------
%Phi Angle Setter
Forearm_Phi = Data(1:end, 6);
[FPmax, Forearm_Phi_max] = max(Forearm_Phi);
[FPmin, Forearm_Phi_min] = min(Forearm_Phi);
Forearm_Phi = pi/180*Forearm_Phi;

%Theta Angle Setter
Forearm_Theta = Data(1:end, 7);
[FTmax, Forearm_Theta_max] = max(Forearm_Theta);
[FTmin, Forearm_Theta_min] = min(Forearm_Theta);
Forearm_Theta = pi/180*Forearm_Theta;
%Arm 3------------------------------------------
%Phi Angle Setter
Hand_Phi = Data(1:end, 9);
[HPmax, Hand_Phi_max] = max(Hand_Phi);
[HPmin, Hand_Phi_min] = min(Hand_Phi);
Hand_Phi = pi/180*Hand_Phi;

%Theta Angle Setter
Hand_Theta = Data(1:end, 10);
[HTmax, Hand_Theta_max] = max(Hand_Theta);
[HTmin, Hand_Theta_min] = min(Hand_Theta);
Hand_Theta = pi/180*Hand_Theta;





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



%Left Arm Data
%--------------------------------------------------------------------------
%Arm_1 Vector Length
Arm_2_1 = Data2(1:end, 2);

%Arm_2 Vector Length
Arm_2_2 = Data2(1:end, 5);

%Arm_3 Vector Length
Arm_2_3 = Data2(1:end, 8);



%--------------------------------------------------------------------------

%Arm 1------------------------------------------
%Phi Angle Setter
Upper_Arm_Phi_2 = Data2(1:end, 3);
[UAPmax_2, Upper_Arm_Phi_max_2] = max(Upper_Arm_Phi_2);
[UAPmin_2, Upper_Arm_Phi_min_2] = min(Upper_Arm_Phi_2);
Upper_Arm_Phi_2 = pi/180*Upper_Arm_Phi_2;

%Theta Angle Setter
Upper_Arm_Theta_2 = Data2(1:end, 4);
[UATmax_2, Upper_Arm_Theta_max_2] = max(Upper_Arm_Theta_2);
[UATmin_2, Upper_Arm_Theta_min_2] = min(Upper_Arm_Theta_2);
Upper_Arm_Theta_2 = pi/180*Upper_Arm_Theta_2;

%Arm 2------------------------------------------
%Phi Angle Setter
Forearm_Phi_2 = Data2(1:end, 6);
[FPmax_2, Forearm_Phi_max_2] = max(Forearm_Phi_2);
[FPmin_2, Forearm_Phi_min_2] = min(Forearm_Phi_2);
Forearm_Phi_2 = pi/180*Forearm_Phi_2;

%Theta Angle Setter
Forearm_Theta_2 = Data2(1:end, 7);
[FTmax_2, Forearm_Theta_max_2] = max(Forearm_Theta_2);
[FTmin_2, Forearm_Theta_min_2] = min(Forearm_Theta_2);
Forearm_Theta_2 = pi/180*Forearm_Theta_2;

%Arm 3------------------------------------------
%Phi Angle Setter
Hand_Phi_2 = Data2(1:end, 9);
[HPmax_2, Hand_Phi_max_2] = max(Hand_Phi_2);
[HPmin_2, Hand_Phi_min_2] = min(Hand_Phi_2);
Hand_Phi_2 = pi/180*Hand_Phi_2;

%Theta Angle Setter
Hand_Theta_2 = Data2(1:end, 10);
[HTmax_2, Hand_Theta_max_2] = max(Hand_Theta_2);
[HTmin_2, Hand_Theta_min_2] = min(Hand_Theta_2);
Hand_Theta_2 = pi/180*Hand_Theta_2;





%--------------------------------------------------------------------------
%Conversion from Spherical to Rectangular Coordinates 
%Arm 1
x_2_1 = Arm_2_1.*sin(Upper_Arm_Phi_2).*cos(Upper_Arm_Theta_2);
y_2_1 = Arm_2_1.*sin(Upper_Arm_Phi_2).*sin(Upper_Arm_Theta_2);
z_2_1 = Arm_2_1.*cos(Upper_Arm_Phi_2);

%Arm 2
x_2_2 = Arm_2_2.*sin(Forearm_Phi_2).*cos(Forearm_Theta_2);
y_2_2 = Arm_2_2.*sin(Forearm_Phi_2).*sin(Forearm_Theta_2);
z_2_2 = Arm_2_2.*cos(Forearm_Phi_2);

%Arm 3
x_2_3 = Arm_2_3.*sin(Hand_Phi_2).*cos(Hand_Theta_2);
y_2_3 = Arm_2_3.*sin(Hand_Phi_2).*sin(Hand_Theta_2);
z_2_3 = Arm_2_3.*cos(Hand_Phi_2);




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
r_1 = .3;
r_2 = .2;
r_3 = .3;
r_2_1 = .3;
r_2_2 = .2;
r_2_3 = .3;
n = 20;
cyl_color_1 = 'k';
cyl_color_2 = 'k';
cyl_color_3 = 'k';
cyl_color_2_1 = 'yellow';
cyl_color_2_2 = 'yellow';
cyl_color_2_3 = 'yellow';
closed = 1;
lines = 0;

for j = 1:Size
    %Plot Axes
    plot3(t1a, t1b, t1c);
    hold on
    plot3(t2a, t2b, t2c);
    hold on
    plot3(t3a, t3b, t3c);
    hold on
    
    %Coordinate Set for Right Arm------------------------------------------
    %Arm 1
    xyz_begin_1 = [0 0 0];
    
    xyz_end_1 = [x_1(j) y_1(j) z_1(j)] + xyz_begin_1;
    
    %Arm_2
    xyz_begin_2 = xyz_end_1;
    
    xyz_end_2 = [x_2(j) y_2(j) z_2(j)] + xyz_begin_2;
    
    %Arm_3
    xyz_begin_3 = xyz_end_2;
    
    xyz_end_3 = [x_3(j) y_3(j) z_3(j)] + xyz_begin_3;
    
    %Coordinate Set for Left Arm ------------------------------------------
    %Arm_1
    
    xyz_begin_2_1 = [0 0 0];
    
    xyz_end_2_1 = [x_2_1(j) y_2_1(j) z_2_1(j)] + xyz_begin_2_1;
    
    %Arm_2
    xyz_begin_2_2 = xyz_end_2_1;
    
    xyz_end_2_2 = [x_2_2(j) y_2_2(j) z_2_2(j)] + xyz_begin_2_2;
    
    %Arm_3
    xyz_begin_2_3 = xyz_end_2_2;
    
    xyz_end_2_3 = [x_2_3(j) y_2_3(j) z_2_3(j)] + xyz_begin_2_3;
    
    
    %Plotting Right Arm----------------------------------------------------
    %Arm_1
    switch(j)
        case Upper_Arm_Phi_max
            cyl_color_1 = 'blue';
        case Upper_Arm_Phi_min
            cyl_color_1 = 'red';
        case Upper_Arm_Theta_max
            cyl_color_1 = 'green';
        case Upper_Arm_Theta_min
            cyl_color_1 = 'm';
        otherwise
            cyl_color_1 = 'black';
    end
    
    Cylinder(xyz_begin_1,xyz_end_1,r_1,n,cyl_color_1,closed,lines)
    hold on
    
    %Arm_2
    
    switch(j)
        case Upper_Arm_Phi_max
            cyl_color_2 = 'blue';
        case Upper_Arm_Phi_min
            cyl_color_2 = 'red';
        case Upper_Arm_Theta_max
            cyl_color_2 = 'green';
        case Upper_Arm_Theta_min
            cyl_color_2 = 'm';
        otherwise
            cyl_color_2 = 'black';
    end
    
    Cylinder(xyz_begin_2,xyz_end_2,r_2,n,cyl_color_2,closed,lines)
    hold on
    
    %Arm_3
    switch(j)
        case Upper_Arm_Phi_max
            cyl_color_3 = 'blue';
        case Upper_Arm_Phi_min
            cyl_color_3 = 'red';
        case Upper_Arm_Theta_max
            cyl_color_3 = 'green';
        case Upper_Arm_Theta_min
            cyl_color_3 = 'm';
        otherwise
            cyl_color_3 = 'black';
    end
    
    Cylinder(xyz_begin_3,xyz_end_3,r_3,n,cyl_color_3,closed,lines)
    hold on
    
    %Plotting Left Arm-----------------------------------------------------
    %Arm_1
    switch(j)
        case Upper_Arm_Phi_max_2
            cyl_color_2_1 = 'blue';
        case Upper_Arm_Phi_min_2
            cyl_color_2_1 = 'red';
        case Upper_Arm_Theta_max_2
            cyl_color_2_1 = 'green';
        case Upper_Arm_Theta_min_2
            cyl_color_2_1 = 'm';
        otherwise
            cyl_color_2_1 = 'yellow';
    end
    
    Cylinder(xyz_begin_2_1,xyz_end_2_1,r_2_1,n,cyl_color_2_1,closed,lines)
    hold on
    
    %Arm_2
    switch(j)
        case Upper_Arm_Phi_max_2
            cyl_color_2_2 = 'blue';
        case Upper_Arm_Phi_min_2
            cyl_color_2_2 = 'red';
        case Upper_Arm_Theta_max_2
            cyl_color_2_2 = 'green';
        case Upper_Arm_Theta_min_2
            cyl_color_2_2 = 'm';
        otherwise
            cyl_color_2_2 = 'yellow';
    end
    
    Cylinder(xyz_begin_2_2,xyz_end_2_2,r_2_2,n,cyl_color_2_2,closed,lines)
    hold on
    
    %Arm_3
    switch(j)
        case Upper_Arm_Phi_max_2
            cyl_color_2_3 = 'blue';
        case Upper_Arm_Phi_min_2
            cyl_color_2_3 = 'red';
        case Upper_Arm_Theta_max_2
            cyl_color_2_3 = 'green';
        case Upper_Arm_Theta_min_2
            cyl_color_2_3 = 'm';
        otherwise
            cyl_color_2_3 = 'yellow';
    end
    
    Cylinder(xyz_begin_2_3,xyz_end_2_3,r_2_3,n,cyl_color_2_3,closed,lines)
    hold on
    
    %End Plot--------------------------------------------------------------
    axis([-5 5 -5 5 -5 5])
    drawnow
    pause(.005)
    hold off
end

%Min and Max Values CSV Export---------------------------------------------
RowNames = {'Max'; 'Time Index # at which Max occurred'; 'Min'; 'Time Index # at which Min occurred'};

%Right Arm
%Table Var Names - for min and max export
Upper_Arm_Phi_Right = [UAPmax; Upper_Arm_Phi_max; UAPmin; Upper_Arm_Phi_min];
Upper_Arm_Theta_Right = [UATmax; Upper_Arm_Theta_max; UATmin; Upper_Arm_Theta_min];
Forearm_Phi_Right = [FPmax;Forearm_Phi_max;FPmin; Forearm_Phi_min];
Forearm_Theta_Right = [FTmax;Forearm_Theta_max; FTmin; Forearm_Theta_min];
Hand_Phi_Right = [HPmax; Hand_Phi_max; HPmin; Hand_Phi_min];
Hand_Theta_Right = [HTmax; Hand_Theta_max; HTmin; Hand_Theta_min];




%Make and export CSV file with Min and Max values
T = table(Upper_Arm_Phi_Right, Upper_Arm_Theta_Right, Forearm_Phi_Right, Forearm_Theta_Right, Hand_Phi_Right, Hand_Theta_Right, 'RowNames', RowNames);
writetable(T, 'RightArmMotion_Min_Max_Data.csv', 'WriteRowNames', true);




%Left Arm
%Table Var Names - for min and max export
Upper_Arm_Phi_Left = [UAPmax_2; Upper_Arm_Phi_max_2; UAPmin_2; Upper_Arm_Phi_min_2];
Upper_Arm_Theta_Left = [UATmax_2; Upper_Arm_Theta_max_2; UATmin_2; Upper_Arm_Theta_min_2];
Forearm_Phi_Left = [FPmax_2;Forearm_Phi_max_2;FPmin_2; Forearm_Phi_min_2];
Forearm_Theta_Left = [FTmax_2;Forearm_Theta_max_2; FTmin_2; Forearm_Theta_min_2];
Hand_Phi_Left = [HPmax_2; Hand_Phi_max_2; HPmin_2; Hand_Phi_min_2];
Hand_Theta_Left = [HTmax_2; Hand_Theta_max_2; HTmin_2; Hand_Theta_min_2];



%Make and export CSV file with Min and Max values
T2 = table(Upper_Arm_Phi_Left, Upper_Arm_Theta_Left, Forearm_Phi_Left, Forearm_Theta_Left, Hand_Phi_Left, Hand_Theta_Left, 'RowNames', RowNames);
writetable(T2, 'LeftArmMotion_Min_Max_Data.csv', 'WriteRowNames', true);