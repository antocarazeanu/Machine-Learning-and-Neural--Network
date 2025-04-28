function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
    % G - matricea sistemului
    % c - vectorul de termeni liberi
    % x0 - aproximația inițială a soluției
    % tol - eroarea relativă maximă acceptabilă pentru soluția aproximativă
    % max_steps - numărul maxim de pași

    % inițializăm variabilele de iterație
    x = x0;
    steps = 0;
    err = 1;

    % iterația Jacobi
    while err > tol && steps < max_steps
        x_prev = x;
        x = G * x_prev + c;
        err = norm(x - x_prev);
        steps = steps + 1;
    endwhile
endfunction
