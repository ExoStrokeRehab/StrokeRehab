%% CODE
figure;

% line function
f = @(x) x.^2;

% x intervals
xi = -5:0.1:5;

% plot
plot(xi,f(xi));

% motions
hold on;
for i=1:length(xi)
    h = plot(xi(i),f(xi(i)),'ro','MarkerFaceColor','r');
    pause(0.01);
    delete(h);
end

% END OF CODE