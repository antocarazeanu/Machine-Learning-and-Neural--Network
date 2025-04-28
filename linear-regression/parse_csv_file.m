function [Y, InitialMatrix] = parse_csv_file(file_path)
    fid = fopen(file_path, 'r');
    
    % citeste prima linie si preia dimensiunea ei, n
    header = fgetl(fid);
    C = strsplit(header, ',');
    n = length(C) - 1;

    % definesc Y si InitialMatrix
    Y = sparse(0, 1);
    InitialMatrix = cell(0, n);

    % se citesc liniile ramase
    while true
        line = fgetl(fid);
        if line == -1
            break;
        endif
        C = strsplit(line, ',');
        row = cell(1, n);
        for j = 1:n
            row{j} = C{j+1};
        endfor

        % stocheaza prima coloana iin Y
        Y = [Y; str2double(C{1})];
        
        % stocheaza restul valorilor in InitialMatrix ca string-uri
        InitialMatrix = [InitialMatrix; row];
    endwhile

    fclose(fid);
endfunction
