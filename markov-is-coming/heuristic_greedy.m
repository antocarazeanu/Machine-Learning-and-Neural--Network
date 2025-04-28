function [path] = heuristic_greedy(start_position, probabilities, adjacency_matrix)
    % Initializeaza matricea path si visited
    path = [start_position];
    visited = false(size(probabilities));
    visited(start_position) = true;

    % Executa in bucla pana cand matricea path este vida sau este atinsa starea WIN
    while ~isempty(path)
        % Obține poziția curentă din varful matricei path
        position = path(end);
        % Verifică dacă starea WIN a fost atinsă
        if position == length(probabilities)-1
            return
        endif

        % Găsește vecinul nevizitat cu cea mai mare probabilitate de a ajunge în starea WIN
        neighbors = find(adjacency_matrix(position,:));
        unvisited_neighbors = neighbors(~visited(neighbors));
        if isempty(unvisited_neighbors)
            % Șterge poziția curentă din capătul matricei path dacă nu există vecini nevizitați
            path = path(1:end-1);
        else
            % Selectează vecinul nevizitat cu cea mai mare probabilitate de a ajunge în starea WIN
            [~, max_prob_neighbor] = max(probabilities(unvisited_neighbors));
            neighbor = unvisited_neighbors(max_prob_neighbor);
            
            % Marchează vecinul ca vizitat și adaugă-l la matricea path
            visited(neighbor) = true;
            path = [path, neighbor];
        endif
    endwhile

    % Dacă matricea path este goală, nu există o cale către starea WIN
    path = [];
endfunction
