% Define fuzzy sets
x = 0:10;
y = 0:10;

% Define a custom trimf function
trimf = @(z, params) max(0, min((z - params(1)) / (params(2) - params(1)), ...
                                (params(3) - z) / (params(3) - params(2))));

% Create membership functions for the fuzzy sets
mx = arrayfun(@(z) trimf(z, [0 3 6]), x);
my = arrayfun(@(z) trimf(z, [0 3 6]), y);

% Define two fuzzy relations using the Cartesian product
R1 = min(mx', my); % Cartesian product across mx and my
R2 = min(mx', my);

% Perform max-min composition
R_max_min = max(min(R1, R2), [], 2); % Element-wise min, then max across columns

% Perform max-product composition
R_max_product = max(R1 .* R2, [], 2); % Element-wise product, then max across columns

% Perform bounded sum composition
R_bounded_sum = min(1, R1 + R2); % Bounded sum

% Print the results
fprintf('Max-Min Composition:\n');
disp(R_max_min);
fprintf('\nMax-Product Composition:\n');
disp(R_max_product);
fprintf('\nBounded Sum Composition:\n');
disp(R_bounded_sum);

