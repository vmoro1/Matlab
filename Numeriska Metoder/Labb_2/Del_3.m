% Lösning med Gauss_Newton
alpha_tilde = [150 200 300 500 1000 2000 inf];
U = [2 3 4 5 6 7 8];

syms a b

f = sym(zeros(7, 1));
for i=1:7
    f(i,1) = 8 - a*(alpha_tilde(i)^b) - U(i);
end

J = jacobian(f', [a, b]);

x_0 = [150, -0.6]; % Vi gissar på MK-skattningen då den bör ligga nära
steps = 100;
current_x = x_0;

for i=1:steps
    J_current_x = subs(J, [a, b], current_x);
    f_current = subs(f, [a, b], current_x);
    h = eval(J_current_x) \ eval(f_current);
    x = current_x' - h;
    current_x = x';   
end

% Polynominterpolation av U(alpha_tilde)
X = zeros(6,6);
X(:,1) = ones(6,1);  % Vandermonede-matrisen
for i=1:6
    for j=2:6
        X(i,j) = alpha_tilde(i)^(j-1);
    end
end

c = X \ U(1,1:6)'; % Koefficienterna till polynomapproximation med hjälp av den naiva ansatsen
