% MATLAB image processing
% SK1105 Exp Physics - Light Microscope Lab by Ying Fu fu@kth.se
%
% imread reads jpg image file 'a3.jpg' into matrix AJPG
% image file is commonly in binary coding
% im2double converts binary to decimal
%
% [M,N,L]=size(A) shows the size of A.
%
% MxN is the pixel number of the image
%
% normally the image is RGB so L=3
%
% A(M,N,1) is the red channel
% A(M,N,2) is the green channel
% A(M,N,3) is the blue channel
%
% the value of A(M,N,1/2/3) marks the R/G/B intensity at
% pixel position (M,N). 0 means no light, 1 means max
%
% if you see a lots of 1 clustered together, the image is over-exposure
% if you see most values close to 0, the image is under-exposure
%
% there are cases of A(M,N,1)=A(M,N,2)=A(M,N,3), i.e., R=G=B.
% in this case, the images are grey
%
% To analyze the resolution of the image, we normally convert
% the RGB image into a grey one

clear all, close all

AJPG=imread('6.jpeg');
A=im2double(AJPG);
[M,N,L]=size(A);

for Y=1:M
    for X=1:N
        B(Y,X)=0.21*A(Y,X,1)+0.72*A(Y,X,2)+0.07*A(Y,X,3);
    end
end

figure
imshow(B)
% in the MATLAB plot you use "Data Cursor" to choose two points
% of interest forming a line to assess resolution

for m=1:2
    [x,y] = ginput(1);
    if m==1
        X1=round(x);
        Y1=round(y);
    else
        X2=round(x);
        Y2=round(y);
    end
    hold on; % Prevent image from being blown away
    plot(x,y,'rx','MarkerSize',20);
end

% order (X1,Y1) and (X2,Y2) 

m=1+int64(abs(Y1-Y2));
n=1+int64(abs(X1-X2));
G=-1.0;
if (m < n) % switch X <> Y, i.e., work on a horizontal line
Z1=X1;
Z2=X2;
X1=Y1;
X2=Y2;
Y1=Z1;
Y2=Z2;
G=1.0;
end

if (Y2 > Y1) % switch (X1,Y1)<>(X2,Y2) so Y2<Y1
Z1=X1;
Z2=Y1;
X1=X2;
Y1=Y2;
X2=Z1;
Y2=Z2;
end

% find the line X=a*Y+b from (X2,Y2) to (X1,Y1)

a=(X1-X2)/(Y1-Y2);
b=X1-a*Y1;

m=1+int64(abs(Y1-Y2));
C=zeros(1,m);

K=0;
for Y=Y2:Y1
    K=K+1;
    X=int16(a*Y+b);
if (G < 0)
    C(1,K)=B(Y,X);
else
    C(1,K)=B(X,Y);
end
end

save('myfile1.dat','C','-ASCII')
figure(2)
plot(C)
axis([0 inf 0 1.0])