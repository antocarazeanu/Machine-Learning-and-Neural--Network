function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples
  
  % Se amesteca exemplele
  idx = randperm(size(X, 1));
  
  % Determinăm numărul de exemple care trebuie folosite pentru antrenament
  num_train = floor(size(X, 1) * percent);
  
  % Împărțim exemplele amestecate în seturi de antrenament și testare
  X_train = X(idx(1:num_train), :);
  y_train = y(idx(1:num_train));
  
  X_test = X(idx(num_train+1:end), :);
  y_test = y(idx(num_train+1:end));
endfunction
