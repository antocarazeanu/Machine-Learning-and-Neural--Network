function [labyrinth] = parse_labyrinth(file_path)
    % Deschidere fisier pentru citire
    file = fopen(file_path, 'r');

    % Citire dimensiuni
    dims = fscanf(file, '%d', 2);
    m = dims(1); % numărul de rânduri
    n = dims(2); % numărul de coloane

    % Citire labirint
    labyrinth = fscanf(file, '%d', [n, m])'; % citim valorile și le transpunem

    % Închidere fisier
    fclose(file);
endfunction
