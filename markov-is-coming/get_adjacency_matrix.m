function [Adj] = get_adjacency_matrix(Labyrinth)
  [m, n] = size(Labyrinth); % determinăm dimensiunile matricei Labyrinth
  N = m * n; % numărul total de noduri din graful Markov
  Adj = sparse(N + 2, N + 2); % inițializăm matricea de adiacență cu 0

  % parcurgem matricea Labyrinth
  for i = 1:m
    for j = 1:n
      idx = (i - 1) * n + j; % determinăm indicele nodului din graful Markov

      % extragem cei 4 biți din numărul de pe poziția (i, j)
      b = bitget(Labyrinth(i, j), 1:4);

      % verificăm fiecare bit și actualizăm matricea de adiacență
      if b(1) == 0 && j > 1 % există o tranzitie spre stânga
        Adj(idx, idx - 1) = 1;
      endif

      if b(2) == 0 && j < n % există o tranzitie spre dreapta
        Adj(idx, idx + 1) = 1;
      endif

      if b(3) == 0 && i < m % există o tranzitie în jos
        Adj(idx, idx + n) = 1;
      endif

      if b(4) == 0 && i > 1 % există o tranzitie în sus
        Adj(idx, idx - n) = 1;
      endif

      % verificăm pozițiile de pe margini și le conectăm la stările de win și lose
      if i == 1 && b(4) == 0 % marginea de sus
        Adj(idx, N + 1) = 1; % conexiune către starea de win
      elseif i == m && b(3) == 0 % marginea de jos
        Adj(idx, N +1) = 1; % conexiune cătrestarea de win
      endif
      if j == 1 && b(1) == 0 % marginea din stânga
        Adj(idx, N +2) = 1; % conexiune către starea de lose
      elseif j == n && b(2) == 0 % marginea din dreapta
        Adj(idx, N + 2) = 1; % conexiune către starea de lose
      endif
    endfor
  endfor

  % actualizăm matricea de adiacență pentru stările de win și lose
  Adj(N + 1, N + 1) = 1; % starea de win este accesibilă doar prin marginea de sus
  Adj(N + 2, N + 2) = 1; % starea de lose este accesibilă doar prin marginile laterale

  % returnăm matricea de adiacență actualizată
  Adj;
endfunction
