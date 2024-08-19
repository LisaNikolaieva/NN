close all;
X = {[0; 0], [0; 1], [1; 0], [1; 1]}
Y = {[0], [1], [1], [0]}


network = {
    Dense(2, 3),
    ReLU(),
    Dense(3, 1),

}

cost_functions;
E = mse;
dE = mse_prime;
network = train(network, E, dE, X, Y, 10000, 0.1, 1);



%%
[XX,YY] = meshgrid(linspace(-2,2,100));
X_test = [XX(:)';YY(:)'];
for i = 1:max(size(X_test))  
X0 = X_test(:,i);
FF(i) = F(network,X0);
end

surf(XX,YY,reshape(FF,[100,100]))
