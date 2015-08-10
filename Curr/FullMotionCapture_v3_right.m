function FullMotionCapture_v3_right(LoggingTime)
clearvars -except m
%--------------------------------------------------------------------------
%Logging Data From Phone
m.AccelerationSensorEnabled = 1;
m.OrientationSensorEnabled = 1;
m.Logging = 1;
pause(LoggingTime)
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
%Since this is the right arm we will multiply all the Azimuth (Theta) 
%angles by -1 so that we can superimpose the left and right arm motions

%Helper for conversion of Accelerometer Data
Helper = 9.81*ones(Size,1);

%Arm 1------------------------------------------


%Conversion into Phi angle 
Upper_Arm_Phi = -1*Phi_temp_1 + Helper;
Upper_Arm_Phi = 9.1743*Upper_Arm_Phi;
Ang_Y_1 = Upper_Arm_Phi; %Storing Degree Angles
Upper_Arm_Phi = pi/180*Upper_Arm_Phi;

%Conversion into Theta angle
Ang_X_1 = -1*Theta_temp_1; %Storing Degree Angles
Upper_Arm_Theta = -1*pi/180*Theta_temp_1;


%Arm 2------------------------------------------


%Conversion into Phi angle 
Forearm_Phi = -1*Phi_temp_2 + Helper;
Forearm_Phi = 9.1743*Forearm_Phi;
Ang_Y_2 = Forearm_Phi; %Storing Degree Angles
Forearm_Phi = pi/180*Forearm_Phi;

%Conversion into Theta angle
Ang_X_2 = -1*Theta_temp_2; %Storing Degree Angles
Forearm_Theta = -1*pi/180*Theta_temp_2;

%Arm 3------------------------------------------


%Conversion into Phi angle 
Hand_Phi = -1*Phi_temp_3 + Helper;
Hand_Phi = 9.1743*Hand_Phi;
Ang_Y_3 = Hand_Phi; %Storing Degree Angles
Hand_Phi = pi/180*Hand_Phi;

%Conversion into Theta angle
Ang_X_3 = -1*Theta_temp_3; %Storing Degree Angles
Hand_Theta = -1*pi/180*Theta_temp_3;

%--------------------------------------------------------------------------
%Disable Sensors
m.AccelerationSensorEnabled = 0;
m.OrientationSensorEnabled = 0;

%Writing Data to table:

Time = time1(1:Size);
%Arm_1
Upper_Arm_Length = Arm_1;
Upper_Arm_Phi = Ang_Y_1;
Upper_Arm_Theta = Ang_X_1;

%Arm_2
Forearm_Arm_Length = Arm_2;
Forearm_Phi = Ang_Y_2;
Forearm_Theta = Ang_X_2;

%Arm_3
Hand_Arm_Length = Arm_3;
Hand_Phi = Ang_Y_3;
Hand_Theta = Ang_X_3;


%Write Table
T = table(Time, Upper_Arm_Length, Upper_Arm_Phi, Upper_Arm_Theta, Forearm_Arm_Length, Forearm_Phi, Forearm_Theta, Hand_Arm_Length, Hand_Phi, Hand_Theta);
writetable(T, 'ArmMotionData.csv', 'WriteRowNames', true);

%Type out CSV file in Command Window
type 'RightArmMotionData.csv'
clearvars -except m
end


