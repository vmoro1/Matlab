x = [0, 0.5, 1, 1.5, 2, 2.99, 3];
y = [0, 0.52, 1.09, 1.75, 2.45, 3.5, 4.0];
A = zeros(7,2);

for row=1:size(A, 1)
    A(row, 1) = x(row);
    A(row, 2) = x(row)^2;
end

b = A \ y';  % Mk lösningen koefficienter

X = zeros(7,7);
X(:,1) = ones(7,1);  % Vandermonede-matrisen
for i=1:7
    for j=2:7
        X(i,j) = x(i)^(j-1);
    end
end
        
a = X \ y';  % koefficienter till interpolation

    
% fplot(poly2sym(a))
% t = linspace(-10,10);  %adjust as needed
% plot(t, polyval(a, t));
% z=-5:.1:5;
% plot(z,polyval(a,z))

hold on
fplot(poly2sym(a))
scatter(x,y)
fplot(@(x) b(1)*x+ b(2)*(x .^2))
hold off