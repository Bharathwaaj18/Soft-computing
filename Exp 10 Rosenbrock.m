% Define the negative Rosenbrock function
rosenbrock = @(x,y) -(1-x).^2 - 100*(y-x.^2).^2;

% Create a grid of points
[x, y] = meshgrid(-2:0.1:2, -1:0.1:3);
z = rosenbrock(x,y);

% Plot the surface
figure;
surf(x, y, z, 'Edgecolor', 'none');
title('Negative Rosenbrock Function Surface');
xlabel('x1');
ylabel('x2');
zlabel('f(x1,x2)');
colorbar;

% Plot the contour
figure;
contour(x, y, z);
title('Negative Rosenbrock Function Contour');
xlabel('x1');
ylabel('x2');
colorbar;
