Data = csvread('RightHandMotionData.csv', 1, 0);
Time = Data(1:end, 1);
Size = length(Time);
red = Data(1:end, 2);
blue = Data(1:end, 5);
green = Data(1:end, 3);
white = Data(1:end, 4);

Helper = 90*ones(Size,1);
Helper2 = -pi/2*ones(Size,1);
red = Helper - red;
blue = Helper - blue;
green = Helper - green;
white = Helper - white;



red = pi/180*red; %Ring Finger
blue = pi/180*blue;
green = pi/180*green;%Index Finger
white = pi/180*white;%Thumb

red2 = 2*red;
green2 = 2*green;
blue2 = 2*blue;
white2= 2*white;

red2 = red2 + Helper2;
green2 = green2 + Helper2;
blue2 = blue2 + Helper2;
white2= white2 + Helper2;
scale = 2;
%------------------Spherical Coordinate Conversion-------------------------
Theta = pi/2*ones(Size, 1);
Theta_Thumb = -pi/4*ones(Size,1);
%Finger Length Matrix for lower half of finger
Finger_Lower_1 = scale*2*ones(Size,1);%Pinky
Finger_Lower_2 = scale*2*ones(Size,1);
Finger_Lower_3 = scale*2.5*ones(Size,1);
Finger_Lower_4 = scale*2*ones(Size,1);%Index Finger
Thumb_Lower = scale*2.5*ones(Size,1);
Finger_Upper_1 = scale*3.5*ones(Size,1);%Pinky
Finger_Upper_2 = scale*5*ones(Size,1);
Finger_Upper_3 = scale*5.5*ones(Size,1);
Finger_Upper_4 = scale*4.5*ones(Size,1);%Index Finger
Thumb_Upper = scale*2.5*ones(Size,1);

%Conversion from Spherical to Rectangular Coordinates 
%Pinky 1
x_1_1 = Finger_Lower_1.*sin(blue).*cos(Theta);
y_1_1 = Finger_Lower_1.*sin(blue).*sin(Theta);
z_1_1 = Finger_Lower_1.*cos(blue);

%Pinky 2
x_2_1 = Finger_Upper_1.*sin(blue2).*cos(Theta);
y_2_1 = Finger_Upper_1.*sin(blue2).*sin(Theta);
z_2_1 = Finger_Upper_1.*cos(blue2);

%Ring Finger 1
x_1_2 = Finger_Lower_2.*sin(red).*cos(Theta);
y_1_2 = Finger_Lower_2.*sin(red).*sin(Theta);
z_1_2 = Finger_Lower_2.*cos(red);

%Ring Finger 2
x_2_2 = Finger_Upper_2.*sin(red2).*cos(Theta);
y_2_2 = Finger_Upper_2.*sin(red2).*sin(Theta);
z_2_2 = Finger_Upper_2.*cos(red2);

%Middle Finger 1
x_1_3 = Finger_Lower_3.*sin(red).*cos(Theta);
y_1_3 = Finger_Lower_3.*sin(red).*sin(Theta);
z_1_3 = Finger_Lower_3.*cos(red);

%Middle Finger 2
x_2_3 = Finger_Upper_3.*sin(red2).*cos(Theta);
y_2_3 = Finger_Upper_3.*sin(red2).*sin(Theta);
z_2_3 = Finger_Upper_3.*cos(red2);

%Index Finger 1
x_1_4 = Finger_Lower_4.*sin(green).*cos(Theta);
y_1_4 = Finger_Lower_4.*sin(green).*sin(Theta);
z_1_4 = Finger_Lower_4.*cos(green);

%Index Finger 2
x_2_4 = Finger_Upper_4.*sin(green2).*cos(Theta);
y_2_4 = Finger_Upper_4.*sin(green2).*sin(Theta);
z_2_4 = Finger_Upper_4.*cos(green2);

%Thumb 1
x_1_5 = Thumb_Lower.*sin(white).*cos(Theta_Thumb);
y_1_5 = Thumb_Lower.*sin(white).*sin(Theta_Thumb);
z_1_5 = Thumb_Lower.*cos(white);

%Ihumb 2
x_2_5 = Thumb_Upper.*sin(white2).*cos(Theta_Thumb);
y_2_5 = Thumb_Upper.*sin(white2).*sin(Theta_Thumb);
z_2_5 = Thumb_Upper.*cos(white2);







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

finger_r = 1.5;
thumb_r = 1.6;
n = 20;
cyl_color = 'yellow';
closed = 1;
lines = 0;

for j = 1:Size
    %Axis Plots are necessary for instances not to show
    %Plot Axes
    plot3(t1a, t1b, t1c);
    hold on
    plot3(t2a, t2b, t2c);
    hold on
    plot3(t3a, t3b, t3c);
    hold on
    
    %Coordinate Set
    %Pinky 1
    xyz_begin_1_1 = [1.5 0 0];
    
    xyz_end_1_1 = [x_1_1(j) y_1_1(j) z_1_1(j)] + xyz_begin_1_1;
    
    %Pinky 2
    xyz_begin_2_1 = xyz_end_1_1;
    
    xyz_end_2_1 = [x_2_1(j) y_2_1(j) z_2_1(j)] + xyz_begin_2_1;
    
    %Ring 1
    xyz_begin_1_2 = [5 0 0];
    
    xyz_end_1_2 = [x_1_2(j) y_1_2(j) z_1_2(j)] + xyz_begin_1_2;
    
    %Ring 2
    xyz_begin_2_2 = xyz_end_1_2;
    
    xyz_end_2_2 = [x_2_2(j) y_2_2(j) z_2_2(j)] + xyz_begin_2_2;
    
    %Middle 1
    xyz_begin_1_3 = [8.5 0 0];
    
    xyz_end_1_3 = [x_1_3(j) y_1_3(j) z_1_3(j)] + xyz_begin_1_3;
    
    %Middle 2
    xyz_begin_2_3 = xyz_end_1_3;
    
    xyz_end_2_3 = [x_2_3(j) y_2_3(j) z_2_3(j)] + xyz_begin_2_3;
    
    %Index 1
    xyz_begin_1_4 = [13 0 0];
    
    xyz_end_1_4 = [x_1_4(j) y_1_4(j) z_1_4(j)] + xyz_begin_1_4;
    
    %Index 2
    xyz_begin_2_4 = xyz_end_1_4;
    
    xyz_end_2_4 = [x_2_4(j) y_2_4(j) z_2_4(j)] + xyz_begin_2_4;
    
    %Thumb 1
    xyz_begin_1_5 = [15 -10 0];
    
    xyz_end_1_5 = [x_1_5(j) y_1_5(j) z_1_5(j)] + xyz_begin_1_5;
    
    %Thumb 2
    xyz_begin_2_5 = xyz_end_1_5;
    
    xyz_end_2_5 = [x_2_5(j) y_2_5(j) z_2_5(j)] + xyz_begin_2_5;

    %Plot Rectangle Hand
    Cylinder([7.5 0 -7.5],[7.5 -10 -7.5],7.5,n,cyl_color,closed,lines)
    
    %Plotting Fingers -----------------------------------------------------
    %Pinky
    Cylinder(xyz_begin_1_1,xyz_end_1_1,finger_r,n,cyl_color,closed,lines)
    hold on
    Cylinder(xyz_begin_2_1,xyz_end_2_1,finger_r,n,cyl_color,closed,lines)
    hold on
    
    %Ring
    Cylinder(xyz_begin_1_2,xyz_end_1_2,finger_r,n,cyl_color,closed,lines)
    hold on
    Cylinder(xyz_begin_2_2,xyz_end_2_2,finger_r,n,cyl_color,closed,lines)
    hold on
    
    
    %Middle
    Cylinder(xyz_begin_1_3,xyz_end_1_3,finger_r,n,cyl_color,closed,lines)
    hold on
    Cylinder(xyz_begin_2_3,xyz_end_2_3,finger_r,n,cyl_color,closed,lines)
    hold on
    
    
    %Index
    Cylinder(xyz_begin_1_4,xyz_end_1_4,finger_r,n,cyl_color,closed,lines)
    hold on
    Cylinder(xyz_begin_2_4,xyz_end_2_4,finger_r,n,cyl_color,closed,lines)
    hold on
    
    
    %Thumb
    Cylinder(xyz_begin_1_5,xyz_end_1_5,thumb_r,n,cyl_color,closed,lines)
    hold on
    Cylinder(xyz_begin_2_5,xyz_end_2_5,thumb_r,n,cyl_color,closed,lines)
    hold on
   
    
    
    
    axis([-20 20 -20 20 -20 20])
    drawnow
    hold off
end


clear;