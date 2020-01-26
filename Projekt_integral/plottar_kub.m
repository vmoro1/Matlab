sidaorigo_x=3;
sidaorigo_y=3;
sidaorigo_z=3;
axellangd_origo=4.5;

a = -pi : pi/2 : pi;                                
ph = pi/4;                                          
x = [cos(a+ph); cos(a+ph)]/cos(ph);
y = [sin(a+ph); sin(a+ph)]/sin(ph);
z = [-ones(size(a)); ones(size(a))];
figure
plot3(sidaorigo_x*x, sidaorigo_y*y, sidaorigo_z*z)                                 
hold on
plot3(sidaorigo_x*x', sidaorigo_y*y', sidaorigo_z*z')                              
hold off
axis([ -1  1    -1  1    -1  1]*axellangd_origo)
grid on