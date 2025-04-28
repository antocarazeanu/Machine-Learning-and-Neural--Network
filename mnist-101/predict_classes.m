function [classes] = predict_classes(X, weights, input_layer_size, hidden_layer_size, output_layer_size)
    % Transformăm parametrii modelului în matricele de ponderi ale fiecărui strat
    Theta1 = reshape(weights(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
    Theta2 = reshape(weights((1 + (hidden_layer_size * (input_layer_size + 1))):end), output_layer_size, (hidden_layer_size + 1));

    % Numărul de exemple din setul de test
    m = size(X, 1);

    % Adăugăm coloana de 1-uri la setul de date de test (pentru bias)
    X = [ones(m, 1) X];

    % Calculăm valorile din primul strat ascuns
    z2 = X * Theta1';
    a2 = sigmoid(z2);

    % Adăugăm coloana de 1-uri la stratul ascuns (pentru bias)
    a2 = [ones(m, 1) a2];

    % Calculăm valorile din stratul de ieșire
    z3 = a2 * Theta2';
    a3 = sigmoid(z3);

    % Determinăm clasa prezisă pentru fiecare exemplu din setul de test
    [~, classes] = max(a3, [], 2);
end
