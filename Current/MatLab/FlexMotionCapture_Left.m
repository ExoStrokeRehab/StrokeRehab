clear; 
clc; close all; 
delete(instrfindall);

mega = serial('/dev/cu.usbmodem1411');
fopen(mega);
set(mega, 'BaudRate', 115200);

Size = 1000;                       

red = zeros(Size,1);       %Red   - ring right / index left
green = zeros(Size,1);     %Green - index right / ring left
blue = zeros(Size,1);      %Blue  - thumb left / pinky right
white = zeros(Size,1);     %White - thumb right / pinky left

i = 1;
while i < (Size + 1)
    test = fscanf(mega,'%u');
    white(i,1) = test(1);
    green(i,1) = test(2);
    red(i,1) = test(3);
    blue(i,1) = test(4);
    i = i + 1; 
end 

%Angle Phi Conversion
Ring_Finger = green;
Index_Finger = red;
Thumb = blue;
Pinky = white;

[Ring_Max, RMax] = max(Ring_Finger);
[Ring_Min, RMin] = min(Ring_Finger);

[Index_Max, IMax] = max(Index_Finger);
[Index_Min, IMin] = min(Index_Finger);

[Thumb_Max, TMax] = max(Thumb);
[Thumb_Min, TMin] = min(Thumb);

[Pinky_Max, PMax] = max(Pinky);
[Pinky_Min, PMin] = min(Pinky);

RowNames = {'Max'; 'Time Index # at which Max occurred'; 'Min'; 'Time Index # at which Min occurred'};

Ring_Finger_Data = [Ring_Max, RMax, Ring_Min, RMin];
Index_Finger_Data = [Index_Max, IMax, Index_Min, IMin];
Thumb_Data = [Thumb_Max, TMax, Thumb_Min, TMin];
Pinky_Data = [Pinky_Max, PMax, Pinky_Min, PMin];

%Min Max Data Table
T2 = table(Ring_Finger_Data, Index_Finger_Data, Thumb_Data, Pinky_Data, 'RowNames', RowNames);
writetable(T2, 'LeftHandMotion_Min_Max_Data.csv', 'WriteRowNames', true);


%Regular Data Table
Time_Indices = (1:Size)';
T = table(Time_Indices, Ring_Finger, Index_Finger, Thumb, Pinky);
writetable(T, 'LeftHandMotionData.csv', 'WriteRowNames', true);


fclose(mega);
delete(instrfindall);  
clear;