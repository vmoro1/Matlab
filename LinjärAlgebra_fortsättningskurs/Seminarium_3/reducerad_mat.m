function A = reducerad_mat(r)
    X = load('JFSGIS');
    B = X.H;
    B = im2double(B);
    [Y, S, X] = svd(B);
    singular_values = svd(B);
    singular_values = nonzeros(singular_values);

    Z = zeros(660, 510);
    for i=1:r
        Z = Z + singular_values(i) * Y(:,i)* (X(:,i))';
    end
    
    A = Z;
end
    