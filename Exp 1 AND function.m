% Training data (AND logic gate)
% Inputs (x1, x2) and corresponding output (y)
inputs = [0 0; 0 1; 1 0; 1 1];
outputs = [0; 0; 0; 1];
% Initialize weights and bias
weights = rand(2,1); % Random initialization
bias = rand();
% Learning rate
lr = 0.1;
% Number of epochs
epochs = 1000
% Training the perceptron
for epoch = 1:epochs
    for i = 1:size(inputs, 1)
        x = inputs(i, :)';
        y = outputs(i);
        % Calculate weighted sum
        weighted_sum = weights' * x + bias;
        % Activation (Step function)
        y_pred = double(weighted_sum >= 0);
        % Update weights and bias
        weights = weights + lr * (y - y_pred) * x;
        bias = bias + lr * (y - y_pred);
    end
end
% Test the perceptron
disp('Test Perceptron:');
test_inputs = [0 0; 0 1; 1 0; 1 1];
for i = 1:size(test_inputs, 1)
    x = test_inputs(i, :)';
    weighted_sum = weights' * x + bias;
    y_pred = double(weighted_sum >= 0);
    fprintf('Input: [%d %d], Output: %d\n', x(1), x(2), y_pred);
end
