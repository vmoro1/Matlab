a=9;
b=9;
c=9;
[x, y, z]=ellipsoid(0,0,0,sqrt(a),sqrt(b),sqrt(c), 100);
h=surf(x,y,z);
set(h, 'FaceAlpha', 0.5)
shading interp