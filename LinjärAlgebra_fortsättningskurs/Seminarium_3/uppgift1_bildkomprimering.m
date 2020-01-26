A = importdata('JFSGIS.mat');
A = mat2gray(A);
A = double(A);
size_A = size(A);

%a)

[Y, S, X] = svd(A);
singular_values = svd(A);
figure;
plot(singular_values)
title('Singulärvärden')
ylabel('Singulärvärdets storlek')
xlabel('Positoin av sinhulärvärdet')

%b)

A_reducerad = zeros(size_A(1), size_A(2)); % Vi definerar en nollmatris med samma storlek som A
error = zeros(1,length(singular_values));  % Vektorn där vi kommer lagra felet
for i=1:length(singular_values)
    A_reducerad = A_reducerad + singular_values(i) * Y(:,i)* (X(:,i))'; 
    % Updaterar den reducerade matrisen när vi tar med ett ytterligare singulärvärde.
    error(i) = sum(sum(abs(A - A_reducerad))); % Felet i bildreduktionen defineras som summan 
    %av absolutbeloppet av alla element i differensen mellan den reducerade matrisen och 
    %orginalmatrisen med samtliga singulärvärden.  
end

% Här plottas felet
x = 1:length(singular_values);
figure; 
plot(x, error)
title('Fel i bildreduktionen');
ylabel('Felet mellan den den reducerade bilden och orginalet.');
xlabel('Antalet singulärvärden som användes');