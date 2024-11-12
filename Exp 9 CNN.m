% Define the network architecture
layers = [
    imageInputLayer([28 28 1])
    convolution2dLayer(5,20)
    reluLayer
    maxPooling2dLayer(2, 'Stride', 2)
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer]; % Include the classification layer

% Load the MNIST dataset
digitDatasetPath = fullfile(toolboxdir('nnet'), 'nndemos', 'nndatasets', 'DigitDataset');
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders', true, 'LabelSource', 'foldernames');

% Split the data into training and validation sets
[imdsTrain, imdsValidation] = splitEachLabel(imds, 0.7, 'randomize');

% Define the training options (removed the 'Metrics' option)
options = trainingOptions("sgdm", ...
    'InitialLearnRate', 0.01, ...
    'MaxEpochs', 4, ...
    'Shuffle', "every-epoch", ...
    'ValidationData', imdsValidation, ...
    'ValidationFrequency', 30, ...
    'Plots', "training-progress", ...
    'Verbose', false);

% Train the network
net = trainNetwork(imdsTrain, layers, options);

% Make predictions on the validation set
YValidation = classify(net, imdsValidation);

% Get the true labels
TValidation = imdsValidation.Labels;

% Calculate the accuracy
accuracy = mean(YValidation == TValidation);

% Display the accuracy
disp(['Validation Accuracy: ', num2str(accuracy)]);
