function [matrix] = initialize_weights(L_prev, L_next)
  % initialize_weights - initialize the weights matrix for a given layer

  %   L_prev - number of neurons in the previous layer
  %   L_next - number of neurons in the next layer

  %   Returns a matrix of size (L_prev+1)xL_next with random values
  %   between (-eps, eps), where eps = sqrt(6)/sqrt(L_prev+L_next)

  eps = sqrt(6) / sqrt(L_prev + L_next);
  matrix = rand(L_next, L_prev + 1) * 2 * eps - eps;

endfunction
