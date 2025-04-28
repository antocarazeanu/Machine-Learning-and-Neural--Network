function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  [m n] = size(FeatureMatrix);

  %Initializare celor 2 coloane de 0-uri
  H = zeros(m, 1);
  SquaredError = zeros(m, 1);

  % Calculeaza functia h(x)
  for i=1:m
    for j=1:n
        H(i) = H(i) + FeatureMatrix(i,j) * Theta(j+1);
    endfor
  endfor

  % Calculeaza vectorul eroare la patrat
  for i=1:m
    SquaredError(i) = (Y(i) - H(i)).^2;
  endfor

  % alculeaza norma L1 a coeficientilor
  L1Norm = 0;
  for i=2:n+1
    L1Norm = L1Norm + norm(Theta(i));
  endfor

  % Calculeaza funtia regularizata
  Error = sum(SquaredError) / m + lambda * L1Norm;
endfunction
