function [Error] = linear_regression_cost_function(Theta, y, X)
    % Theta -> the vector of weights
    % X -> the matrix with all training examples
    % Y -> the vector with all actual values
    % m -> the number of training examples

    [m n] = size(X);

    %Initializare celor 2 coloane de 0-uri
    H = zeros(m, 1);
    SquaredError = zeros(m, 1);

    % Calculeaza functia h(x)
    for i=1:m
        for j=1:n
            H(i) = H(i) + X(i,j) * Theta(j+1);
        end
    end

    % Calculeaza vectorul eroare la patrat
    for i=1:m
        SquaredError(i) = (H(i) - y(i)).^2;
    end
    
    % Calculeaza eroarea
    Error= sum(SquaredError) / (2 * m);
end