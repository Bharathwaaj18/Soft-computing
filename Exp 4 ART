n_inputs = 7;
n_clusters = 3;
% Initialize the weights and vigilance parameter
weights = rand(n_inputs, n_clusters);
vigilance = 0.5;
% Define the input data
input_data = rand(n_inputs, 10);
% Train the ART 1 network
for i = 1:n_clusters
   for j = 1:size(input_data, 2)
        x = input_data(:, j);
        y = weights(:, i);
        match = dot(x, y) / (norm(x) * norm(y));
        if match > vigilance
            weights(:, i) = weights(:, i) + 0.1 * (x - weights(:, i));
        end
    end
end

% Test the ART 1 network
test_data = rand(n_inputs, 5);
for i = 1:size(test_data, 2)
    x = test_data(:, i);
    distances = zeros(1, n_clusters);
    for j = 1:n_clusters
        y = weights(:, j);
        distances(j) = norm(x - y);
    end
    [min_distance, cluster_index] = min(distances);
    fprintf('Input %d belongs to cluster %d\n', i, cluster_index);
end
