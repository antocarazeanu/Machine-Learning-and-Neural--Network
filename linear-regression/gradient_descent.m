function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights
  Theta = [0; zeros(n-1, 1)];

  % Executa gradientul descendnet pentru iter iteratii
  for i = 1:iter
    % Calculeaza hipoteza h(x) = X * Theta
    h = FeatureMatrix * Theta;

    % Calculeaza eroarea intre hipoteza si valorile reale
    error = h - Y;

    % Calculeaza gradientul (derivatele partiale)
    gradient = (1/m) * FeatureMatrix' * error;

    % Actualizeaza ponderile (Theta)
    Theta = Theta - alpha * gradient;

  endfor

  % Se adauga un 0 pe prima linie
  Theta = [0; Theta];

endfunction
