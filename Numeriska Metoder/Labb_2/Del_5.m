N = 100000; % Indelning av tidsintervallet
x_0 = 1;
X = zeros(1, N+1);  %Lagrar tapital vid tidpunkterna 0,delta_t,....,N*delta_t med given strartgissning
X(:) = x_0; % Startgissning
X_iter = zeros(1, N+1);  %Kapitalvektor som förändras under iterationen för samtliga t
lambda = zeros(1, N);  % Lagrangemultiplikatorn vid tiden delta_t,....,N*delta_t
X_iter(:) = x_0;
delta_t = 1/N; % Ty tiden är T=1

for i=1:100
% while true
    for n=N:-1:1
        if n==N
            lambda(n) = 1/sqrt(X_iter(N+1));
        else
           lambda(n) = lambda(n+1) + delta_t*(1+X_iter(n)/5)*lambda(n+1);
        end
    end
    for n=1:N
        if n==1
            X_iter(n+1) = x_0 + delta_t*(x_0 + (x_0^2)/10 - lambda(2)^(-3/5));
        else
            X_iter(n+1) = X_iter(n) + delta_t*(X_iter(n) + (X_iter(n)^2)/10 - lambda(n)^(-3/5));
        end
    end
    difference = norm(X - X_iter);
    X = X_iter;
    if difference < 0.001
        disp('bröt på')
        i
        break
    end
end

% tid = 0:delta_t:1;
% plot(tid, X)
        
