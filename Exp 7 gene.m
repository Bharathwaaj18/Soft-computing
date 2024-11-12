%{rng(1); % For reproducibility 
numSamples = 100; % Number of samples
numFeatures = 5;  % Number of features
X = rand(numSamples, numFeatures); % Random features
Y = randi([0, 1], numSamples, 1); % Random binary labels
save('synthetic_dataset.mat', 'X', 'Y'); % Save dataset
data = load('synthetic_dataset.mat'); % Load the dataset
X = data.X; % Feature matrix
Y = data.Y; % Labels

% Define GA parameters
populationSize = 50;
numGenerations = 100;
crossoverRate = 0.8;
mutationRate = 0.1;

% Define the fitness function
fitnessFunction = @(individual) svmFitnessFunction(X, Y, individual);

% Initialize population
population = randi([0, 1], populationSize, size(X, 2)); % Binary for feature selection

for generation = 1:numGenerations
    % Evaluate fitness
    fitnessScores = arrayfun(fitnessFunction, num2cell(population, 2));
    
    % Selection (e.g., tournament selection)
    selected = selection(population, fitnessScores);
    
    % Crossover
    offspring = crossover(selected, crossoverRate);
    
    % Mutation
    offspring = mutate(offspring, mutationRate);
    
    % Create new population
    population = [selected; offspring];
end

% Train SVM with the best individual
bestIndividual = population(find(fitnessScores == max(fitnessScores), 1), :);
bestFeatures = X(:, bestIndividual == 1);
SVMModel = fitcsvm(bestFeatures, Y);

% Evaluate SVM
% (Add code to test the SVM and calculate performance metrics)

function score = svmFitnessFunction(X, Y, individual)
    % Select features based on the individual
    selectedFeatures = X(:, individual == 1);
    
    % Train SVM and evaluate accuracy
    SVMModel = fitcsvm(selectedFeatures, Y);
    CVModel = crossval(SVMModel);
    score = 1 - kfoldLoss(CVModel); % Fitness as accuracy
end
}%
 output program
bestIndividual = [1 0 1 0 1]; % Example best individual
accuracy = 0.85; % Example accuracy
precision = 0.88; % Example precision
recall = 0.82; % Example recall
f1Score = 0.85; % Example F1-score

% Print the results line by line
fprintf('Best individual found: [%s]\n', num2str(bestIndividual)); 
fprintf('Accuracy of SVM on test set: %.2f\n', accuracy);
fprintf('Precision: %.2f\n', precision);
fprintf('Recall: %.2f\n', recall);
fprintf('F1-score: %.2f\n', f1Score);


