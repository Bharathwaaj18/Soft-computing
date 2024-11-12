% Define two fuzzy sets A and B
A = [0.2 0.4 0.6 0.8 1.0];
B = [0.1 0.3 0.5 0.7 0.9];
C = [0.3 0.5 0.7 0.9 1.0];

% Union of A and B
union_AB = max(A, B);

% Intersection of A and B
intersection_AB = min(A, B);
intersection_BA = min(B, A);

% Complement of A
complement_A = 1 - A;

% Difference of A and B
difference_AB = max(A, 1 - B);

% Cartesian product of A and B
cartesian_product_AB = zeros(size(A, 2), size(B, 2));
for i = 1:size(A, 2)
    for j = 1:size(B, 2)
        cartesian_product_AB(i, j) = min(A(i), B(j));
    end
end

% Properties of fuzzy sets
% 1. Reflexivity
reflexive_A = all(A == 1 - (1 - A));

% 2. Symmetry
symmetric_AB = all(intersection_AB == intersection_BA);

% 3. Transitivity
transitive_ABC = all((A >= B) & (B >= C));

% 4. Distributivity
distributive_A_B_C = all((A & (B | C)) == ((A & B) | (A & C)));

% Print the results
fprintf('Union of A and B: ');
disp(union_AB);

fprintf('Intersection of A and B: ');
disp(intersection_AB);

fprintf('Complement of A: ');
disp(complement_A);

fprintf('Difference of A and B: ');
disp(difference_AB);

fprintf('Cartesian product of A and B: ');
disp(cartesian_product_AB);

fprintf('Reflexivity of A: %d\n', reflexive_A);
fprintf('Symmetry of A and B: %d\n', symmetric_AB);
fprintf('Transitivity of A, B, and C: %d\n', transitive_ABC);
fprintf('Distributivity of A, B, and C: %d\n', distributive_A_B_C);
