load moore.mat

beta_1 = regress(log(y), xtime);

beta_0 = mean(log(y)) - beta_1*mean(xtime);

X = 0:0.0000001:100;
Y = beta_0 + beta_1*X;
plot(X,Y)