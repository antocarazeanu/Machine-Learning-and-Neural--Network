function [G, c] = get_Jacobi_parameters(Link)
    % Initializam variabilele de iesire
    G = Link(1:end-2,1:end-2);
    c = Link(1:end-2,end-1);

    % Calculam inversul matricei diagonale a lui G
    D = diag(sum(abs(G), 2));
    D_inv = diag(1 ./ diag(D));

    % Calculam matricea Jacobi Gj si vectorul c
    Gj = eye(size(G)) - D_inv * G;
    cj = D_inv * c;
end
