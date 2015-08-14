clear; 
clc; close all; 
delete(instrfindall);

mega = serial('/dev/cu.usbmodem1411');
fopen(mega);
set(mega, 'BaudRate', 115200);

Size = 100;                       

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


Time_Indices = (1:Size)';
T = table(Time_Indices, Ring_Finger, Index_Finger, Thumb, Pinky);
writetable(T, 'LeftHandMotionData.csv', 'WriteRowNames', true);


fclose(mega);
delete(instrfindall);  
clear;