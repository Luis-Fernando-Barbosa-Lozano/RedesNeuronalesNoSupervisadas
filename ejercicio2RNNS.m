clc;

% Definición del patrón original P1 (las cuatro esquinas y el centro en negro)
P1 = [-1  1 -1;
       1 -1  1;
      -1  1 -1];

% Definición del patrón de entrada P2 (esquina superior derecha y el centro en negro)
P2 = [1  1  -1;
      1  -1  1;
      1   1  1];

% Calcular la matriz de pesos autoasociativos para P1 de forma manual
W1 = zeros(9, 9); % Inicializamos una matriz de 9x9 con ceros

% Convertimos P1 en un vector columna
P1_vec = [P1(1,1); P1(1,2); P1(1,3);
          P1(2,1); P1(2,2); P1(2,3);
          P1(3,1); P1(3,2); P1(3,3)];

% Multiplicación de vectores para obtener la matriz de pesos
for i = 1:9
    for j = 1:9
        W1(i,j) = P1_vec(i) * P1_vec(j);
    end
end

% Mostrar la matriz de pesos para P1
disp('Matriz de pesos para P1:');
disp(W1);

% Convertimos P2 en un vector columna
P2_vec = [P2(1,1); P2(1,2); P2(1,3);
          P2(2,1); P2(2,2); P2(2,3);
          P2(3,1); P2(3,2); P2(3,3)];

% Realizar la recuperación del patrón de forma manual
output_vec = zeros(9, 1); % Inicializamos el vector de salida con ceros

% Multiplicación de la matriz de pesos por el vector de entrada
for i = 1:9
    sumatoria = 0;
    for j = 1:9
        sumatoria = sumatoria + W1(i,j) * P2_vec(j);
    end
    
    % Aplicamos la función de activación signo manualmente
    if sumatoria >= 0
        output_vec(i) = 1;
    else
        output_vec(i) = -1;
    end
end

% Reorganizar el vector de salida a una matriz 3x3 de forma manual
output = [output_vec(1) output_vec(2) output_vec(3);
          output_vec(4) output_vec(5) output_vec(6);
          output_vec(7) output_vec(8) output_vec(9)];

% Mostrar el patrón recuperado
disp('Patrón recuperado:');
disp(output);
