m.Logging = 1;
[o, t] = orientlog(m);
pause(15)
m.Logging = 0;
for j=1:1000
plot(o(1),t);
hold on
drawnow;
end