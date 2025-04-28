function [Y, InitialMatrix] = parse_data_set_file(file_path)
    fid = fopen(file_path, 'r');
    
    % citim prima linie pentru a afla m și n
    line = fgetl(fid);
    [m, n] = sscanf(line, '%d %d');

    % prealocam matricea Y și matricea InitialMatrix
    Y = sparse(m, 1);
    InitialMatrix = cell(m, n+1);

    % citim liniile rămase
    for i = 1:m
        line = fgetl(fid);
        C = strsplit(line);
        Y(i) = str2double(C{1});
        for j = 1:n
            InitialMatrix{i,j} = C{j+1};
        endfor
        % stocam fiecare element ca string
        for j = n+2:length(C)
            InitialMatrix{i,j} = C{j};
        endfor
    endfor

    fclose(fid);
endfunction
