function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
    % InitialMatrix -> the matrix that must be transformed

    % FeatureMatrix -> the matrix with all training examples

    [num_rows, num_cols] = size(InitialMatrix);

    % Creeaza o noua matrice cu aceeasi dimensiune ca matricea initiala
    FeatureMatrix = zeros(num_rows, num_cols+1);

    % Itereaza prin matricea initiala si transforma valorile
    for i = 1:num_rows
        x = 1;
        for j = 1:num_cols
            value = InitialMatrix{i,j};
            if strcmpi(value, 'yes')
                FeatureMatrix(i,x) = 1;
                x = x + 1;
            elseif strcmpi(value, 'no')
                FeatureMatrix(i,x) = 0;
                x = x + 1;
            elseif strcmpi(value, 'semi-furnished')
                FeatureMatrix(i,x) = 1;
                FeatureMatrix(i,x+1) = 0;
                x = x + 2;
            elseif strcmpi(value, 'unfurnished')
                FeatureMatrix(i,x) = 0;
                FeatureMatrix(i,x+1) = 1;
                x = x + 2;
            elseif strcmpi(value, 'furnished')
                FeatureMatrix(i,x) = 0;
                FeatureMatrix(i,x+1) = 0;
                x = x + 2;
            else
                FeatureMatrix(i,x) = str2double(InitialMatrix{i,j});
                x = x + 1;
            endif
        endfor
    endfor

    % Gaseste indicii de coloane care contin valori NaN
    nan_cols = find(any(isnan(FeatureMatrix)));

    % Elimina coloanele NaN
    FeatureMatrix(:, nan_cols) = [];

endfunction