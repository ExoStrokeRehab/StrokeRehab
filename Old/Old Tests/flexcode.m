clear all; clc; close all; 
delete(instrfindall);

mega = serial('/dev/cu.usbmodem1411');
fopen(mega);
set(mega, 'BaudRate', 115200);

n = 100;                         %Number of test cases

%We identify each sensor by the color of its heatshrink tubing

red = zeros(n,1);       %Red   - right thumb
green = zeros(n,1);     %Green - index right / ring left
blue = zeros(n,1);      %Blue  - ring right / index left
white = zeros(n,1);     %White - thumb left

i = 1;
while i < (n + 1)
    test = fscanf(mega,'%u');
    red(i,1) = test(1);
    green(i,1) = test(2);
    blue(i,1) = test(3);
    white(i,1) = test(4);
    i = i + 1; 
end 

%Red Green are middle fingers
%Blue White are thumbs







fclose(mega);
delete(instrfindall);                         