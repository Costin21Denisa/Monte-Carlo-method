clear all
close all
clc

function result = MonteCarloMultidimensional(f, a, b, n) %f- functia de integrat, a/b vector cu limite inferioare/superioare ale domeniului, n- nr de puncte integrate
    d = length(a); % Numărul de dimensiuni
    V = prod(b - a); % Volumul domeniului de integrare
    % Generarea de puncte aleatoare în domeniul de integrare pentru fiecare dimensiune
    x = zeros(d, n);
    for i = 1:d
        x(i, :) = rand(1, n) * (b(i) - a(i)) + a(i); 
    end
    result = V * mean(f(x(1, :), x(2, :))); % Calculul aproximării integrale pentru funcția f
    
    % Afișarea graficului în puncte
    figure;
    if d == 1
        scatter(x(1, :), f(x(1, :)), '.');
        title('Metoda Monte Carlo pentru integrare multidimensionala');
        xlabel('x');
        ylabel('f(x)');
    elseif d == 2
        scatter3(x(1, :), x(2, :), f(x(1, :), x(2, :)), '.');
        title('Metoda Monte Carlo pentru integrare multidimensionala');
        xlabel('x');
        ylabel('y');
        zlabel('f(x, y)');
    end
end


% Definirea funcției de integrat
f = @(x, y) x.^2 + y.^2; % Funcția primește doi param
% 
% etri și returnează x.^2 + y.^2

% Definirea limitelor inferioare și superioare ale domeniului de integrare
a = [0, 0];
b = [1, 1];

% Numărul de puncte pentru aproximare
n = 1000;

% Apelarea funcției MonteCarloMultidimensional
resultMonteCarlo = MonteCarloMultidimensional(f, a, b, n);
disp(['Aproximarea integrala folosind metoda Monte Carlo: ', num2str(resultMonteCarlo)]);
