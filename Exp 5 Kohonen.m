% Load and prepare the training image data
img_data = imread('red.jpg'); % Replace with actual image path
img_data = double(img_data) / 255; % Normalize
img_data = reshape(img_data, [], size(img_data, 3)); % Flatten the image for training

% Set parameters and initialize weights
n_neurons = 10; % Number of neurons
learning_rate = 0.1;
weights = rand(n_neurons, size(img_data, 2)); % Initialize weights randomly

% Train the Kohonen network
for epoch = 1:100
    for j = 1:size(img_data, 1)
        x = img_data(j, :); % Input vector

        % Calculate distances from input vector to all weight vectors
        distances = zeros(1, n_neurons);
        for k = 1:n_neurons
            y = weights(k, :);
            distances(k) = norm(x - y);
        end

        % Find the winning neuron (closest weight vector)
        [~, winner_index] = min(distances);

        % Update the winning neuron's weight vector
        weights(winner_index, :) = weights(winner_index, :) + learning_rate * (x - weights(winner_index, :));
    end

    % Reduce the learning rate over time
    learning_rate = learning_rate * 0.9;
end

% Print the training weights
fprintf('Final training weights:\n');
disp(weights);

% Test the Kohonen network
test_img = imread('red.jpg'); % Load test image
test_img = double(test_img) / 255; % Normalize
test_img = reshape(test_img, [], size(test_img, 3)); % Flatten

% Choose one test sample for classification (e.g., the first pixel/sample)
test_sample = test_img(1, :);

% Calculate distances from the test sample to all neurons
distances = zeros(1, n_neurons);
for i = 1:n_neurons
    y = weights(i, :);
    distances(i) = norm(test_sample - y);
end

% Find the winning neuron for the test sample
[~, winner_index] = min(distances);
fprintf('Test image belongs to neuron %d\n', winner_index);
