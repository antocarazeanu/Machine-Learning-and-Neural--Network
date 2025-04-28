function [decoded_path] = decode_path(path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
	%                 corresponding to path states
	% hint: decoded_path does not contain indices for the WIN state

	decoded_path = []; % initializam matricea goala
	
	% transformam fiecare element din path in perechea corespunzatoare
	for i = 1:length(path)-1 % ignoram ultima stare, de castig
		 [col, row] = ind2sub([lines, cols], path(i));
		 decoded_path = [decoded_path; row, col]; % adaugam perechea la sfarsitul matricei
	end
	
end
