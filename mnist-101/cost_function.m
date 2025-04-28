function [J, grad] = cost_function(params, X, y, lambda, input_layer_size, hidden_layer_size, output_layer_size)

    % Redimensionare greutati
    theta1 = reshape(params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, input_layer_size + 1);
    theta2 = reshape(params(hidden_layer_size * (input_layer_size + 1) + 1:end), output_layer_size, hidden_layer_size + 1);

    % Numarul de exemple de antrenamet
    m = size(X, 1);

    % Initializare
    J = 0;
    theta1_grad = zeros(size(theta1));
    theta2_grad = zeros(size(theta2));

    % Calculam propagarea inainte si functia de cost
    a1 = [ones(m, 1) X];
    z2 = a1 * theta1';
    a2 = [ones(size(z2, 1), 1) 1./(1 + exp(-z2))];
    z3 = a2 * theta2';
    h = 1./(1 + exp(-z3));
    y_matrix = eye(output_layer_size)(y, :);
    J = (-1/m) * sum(sum(y_matrix .* log(h) + (1-y_matrix) .* log(1-h))) + ...
        (lambda/(2*m)) * (sum(sum(theta1(:, 2:end) .^ 2)) + sum(sum(theta2(:, 2:end) .^ 2)));

    % Calculam backpropagation si gradientii
    d3 = h - y_matrix;
    d2 = (d3 * theta2(:, 2:end)) .* (a2(:, 2:end) .* (1-a2(:, 2:end)));
    delta1 = d2' * a1;
    delta2 = d3' * a2;
    theta1_grad = delta1 ./ m + (lambda/m) * [zeros(size(theta1, 1), 1) theta1(:, 2:end)];
    theta2_grad = delta2 ./ m + (lambda/m) * [zeros(size(theta2, 1), 1) theta2(:, 2:end)];

    % Unroll gradients
    grad = [theta1_grad(:); theta2_grad(:)];

end
