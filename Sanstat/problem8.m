load poly.mat

%plot(x2,y2)
%plot(x2,y2)
%plot(x3,y3)

% X = [ones(1,length(x2))' x2 x2.^2 x2.^3];
% 
% beta_hat = regress(y2,X);
% 
% X_plot = -100:0.1:100;
% Y_plot = beta_hat(1) + beta_hat(2)*X_plot+beta_hat(3)*(X_plot.^2)+beta_hat(4)*(X_plot.^3); 
% 
% plot(X_plot, Y_plot)
% hold on
% plot(x2,y2)
% 
% res =  X*beta_hat - y2;
% subplot(211), normplot(res)
% subplot(212), hist(res)

X = [ones(1,length(x2))' x2 x2.^2];

beta_hat = regress(y2,X);

X_plot = -10:0.1:10;
Y_plot = beta_hat(1) + beta_hat(2)*X_plot+beta_hat(3)*(X_plot.^2); 

plot(X_plot, Y_plot)
hold on
plot(x2,y2)

res =  X*beta_hat - y2;
subplot(211), normplot(res)
subplot(212), hist(res)