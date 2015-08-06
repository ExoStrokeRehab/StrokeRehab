
m.Logging = 1;
[o, t] = orientlog(m);
pause(15)
m.Logging = 0;
ang_Y = o(1:end, 1);
vel_Y = ones(length(o), 1);

ang_rad = ang_Y * pi/180;
[x,y] = pol2cart(ang_rad,vel_Y);

axis off, axis equal




for j = 1:length(vel_Y)
    %hold off
    %polar(0,1,'-k')
    hold on
    x2 = x(j);
    y2 = y(j);
    h1 = compass(x2,y2);
    refreshdata(h1,'caller');
    drawnow;
    pause(.05)
end