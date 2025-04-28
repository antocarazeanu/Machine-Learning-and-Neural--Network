function [Link] = get_link_matrix(Labyrinth)
[m, n] = size(Labyrinth); % determinăm dimensiunile matricei Labyrinth
N = m * n; % numărul total de noduri din graful Markov
Link = sparse(N + 2, N + 2); % inițializăm matricea de link-uri cu 0

% parcurgem matricea Labyrinth
for i = 1:m
for j = 1:n
idx = (i - 1) * n + j; % determinăm indicele nodului din graful Markov
  % extragem cei 4 biți din numărul de pe poziția (i, j)
  b = bitget(Labyrinth(i, j), 1:4);

  % calculăm probabilitatea de tranziție
  p = 1 / sum(b == 0); % numărul de biți 0 din codificare

  % verificăm fiecare bit și actualizăm matricea de link-uri
  if b(1) == 0 && j > 1 % există o tranzitie spre stânga
    Link(idx, idx - 1) = p;
  end

  if b(2) == 0 && j < n % există o tranzitie spre dreapta
    Link(idx, idx + 1) = p;
  end

  if b(3) == 0 && i < m % există o tranzitie în jos
    Link(idx, idx + n) = p;
  end

  if b(4) == 0 && i > 1 % există o tranzitie în sus
    Link(idx, idx - n) = p;
  end

  % verificăm pozițiile de pe margini și le conectăm la stările de win și lose
      if i == 1 && b(4) == 0 % marginea de sus
        Link(idx, N + 1) = p; % conexiune către starea de win
      elseif i == m && b(3) == 0 % marginea de jos
        Link(idx, N +1) = p; % conexiune cătrestarea de win
      endif
      if j == 1 && b(1) == 0 % marginea din stânga
        Link(idx, N + 2) = p; % conexiune către starea de lose
      elseif j == n && b(2) == 0 % marginea din dreapta
        Link(idx, N + 2) = p; % conexiune către starea de lose
      endif
endfor
endfor

% actualizăm matricea de link-uri pentru stările de win și lose
Link(N +1, N + 1) = 1; % starea de win se conectează la ea însăși cu probabilitate 1
Link(N + 2, N + 2) = 1; % starea de lose se conectează la ea însăși cu probabilitate 1

% returnăm matricea de link-uri
Link;
endfunction