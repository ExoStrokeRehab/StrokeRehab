function Regular_Both_NoInstance_CSVRead()

Data = csvread('RightArmMotionData.csv', 1,0);
Data2 = csvread('LeftArmMotionData.csv', 1,0);

Time = Data(1:end, 1);
Time2 = Data(1:end, 1);

Size = min(length(Time), length(Time2));

%Right Arm Data
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

%Theta Angle Setter
Upper_Arm_Theta = pi/180*Data(1:end, 4);

%Arm 2------------------------------------------
%Phi Angle Setter
Forearm_Phi = pi/180*Data(1:end, 6);

%Theta Angle Setter
Forearm_Theta = pi/180*Data(1:end, 7);

%Arm 3------------------------------------------
%Phi Angle Setter
Hand_Phi = pi/180*Data(1:end, 9);

%Theta Angle Setter
Hand_Theta = pi/180*Data(1:end, 10);





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
Upper_Arm_Phi_2 = pi/180*Data2(1:end, 3);

%Theta Angle Setter
Upper_Arm_Theta_2 = pi/180*Data2(1:end, 4);

%Arm 2------------------------------------------
%Phi Angle Setter
Forearm_Phi_2 = pi/180*Data2(1:end, 6);

%Theta Angle Setter
Forearm_Theta_2 = pi/180*Data2(1:end, 7);

%Arm 3------------------------------------------
%Phi Angle Setter
Hand_Phi_2 = pi/180*Data2(1:end, 9);

%Theta Angle Setter
Hand_Theta_2 = pi/180*Data2(1:end, 10);





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
    
    %Coordinate Set for Right Arm -----------------------------------------
    %Arm_1
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
    
    
    
    
    
    %Right Arm Plotting----------------------------------------------------
    %Arm_1
    Cylinder(xyz_begin_1,xyz_end_1,r_1,n,cyl_color_1,closed,lines)
    hold on
    
    %Arm_2
    Cylinder(xyz_begin_2,xyz_end_2,r_2,n,cyl_color_2,closed,lines)
    hold on
    
    %Arm_3
    Cylinder(xyz_begin_3,xyz_end_3,r_3,n,cyl_color_3,closed,lines)
    hold on
    
    %Left Arm Plotting-----------------------------------------------------
    %Arm_1
    Cylinder(xyz_begin_2_1,xyz_end_2_1,r_2_1,n,cyl_color_2_1,closed,lines)
    hold on
    
    %Arm_2
    Cylinder(xyz_begin_2_2,xyz_end_2_2,r_2_2,n,cyl_color_2_2,closed,lines)
    hold on
    
    %Arm_3
    Cylinder(xyz_begin_2_3,xyz_end_2_3,r_2_3,n,cyl_color_2_3,closed,lines)
    hold on
    
    %End Plot--------------------------------------------------------------
    axis([-5 5 -5 5 -5 5])
    drawnow
    pause(.03)
    hold off
end

