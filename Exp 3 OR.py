import numpy as np

class Adaline:
    def __init__(self, learning_rate=0.1, max_iter=1000):
        self.learning_rate = learning_rate
        self.max_iter = max_iter
        self.weights = None
        self.bias = None

    def fit(self, X, y):
        n_samples, n_features = X.shape
        self.weights = np.zeros(n_features)
        self.bias = 0

        for _ in range(self.max_iter):
            for xi, yi in zip(X, y):
                output = self.predict(xi)
                error = yi - output
                self.weights += self.learning_rate * error * xi
                self.bias += self.learning_rate * error

    def predict(self, X):
        return np.where(np.dot(X, self.weights) + self.bias >= 0, 1, -1)

# Define the OR function with bipolar inputs and targets
X = np.array([[-1, -1], [-1, 1], [1, -1], [1, 1]])
y = np.array([-1, 1, 1, 1])

# Create an Adaline neural network
adaline = Adaline(learning_rate=0.1, max_iter=1000)

# Train the network
adaline.fit(X, y)

# Test the network
print("Predictions:")
for xi in X:
    output = adaline.predict(xi)
    print(f"Input: {xi}, Output: {output}")
