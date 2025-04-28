function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the tolerance level for convergence of the conjugate gradient method
  % iter -> the number of iterations

  % Theta -> the vector of weights
  Theta = zeros(size(FeatureMatrix, 2), 1); % initialize Theta with zeros
  
  % Calculează Theta folosind ecuația normală
  XTX = FeatureMatrix' * FeatureMatrix; % calculează produsul FeatureMatrix' * FeatureMatrix
  XTY = FeatureMatrix' * Y; % calculează produsul FeatureMatrix' * Y
  Theta = XTX \ XTY; % rezolvă sistemul de ecuații liniare XTX * Theta = XTY cu operatorul "\" (backslash)

  % Verifică dacă XTX este pozitiv definit și, dacă este, aplică metoda gradientului conjugat pentru a îmbunătăți Theta
  if all(eig(XTX) > tol)
    b = XTX * Theta - XTY; % calculează diferența dintre produsul XTX * Theta și XTY
    r = b; % setează r ca fiind diferența calculată
    p = r; % setează p la valoarea lui r inițial
    for i = 1:iter % pentru fiecare iterație
      Ap = XTX * p; % calculează produsul XTX * p
      alpha = (r'*r) / (p'*Ap); % calculează alpha
      Theta = Theta - alpha * p; % ajustează Theta
      r_old = r; % reține valoarea anterioară a lui r
      r = r - alpha * Ap; % calculează noua valoare a lui r
      beta = (r'*r) / (r_old'*r_old); % calculează beta
      p = r + beta * p; % calculează noua valoare a lui p
      if norm(r) < tol % dacă norma lui r este mai mică decât toleranța, ieși din buclă
        break
      endif
    endfor
  endif
  
  Theta = [0; Theta]; % adaugă o valoare de interceptare la vectorul Theta
endfunction