function network = train(network, loss, loss_prime, x_train, y_train, epochs, learning_rate, verbose)
% batch size = 1 as the weights are updated at once as the gradient is
% calculated for the given input parameter, included in backpropagation 
   

    for e = 1:epochs
        error = 0;
        for i = randperm(length(x_train))%1:length(x_train)  % randperm(length(x_train))
            X0 = x_train{i};
            Yhat = y_train{i};

            % Forward pass
            output = X0;
            for j = 1:length(network)
                network{j} = network{j}.forward(output); % to update input we have to return a new object
                output = network{j}.Y;
            end     

            error = error + loss(Yhat, output);

            % Backward pass
            grad = loss_prime(output,Yhat);
            for j = flip(1:length(network))
                network{j} = network{j}.backward(grad, learning_rate);
                grad = network{j}.dEdX;
            end

        end
        error = error / length(x_train);
        if verbose && ((mod(e,100)) ==0)
            disp(['Epoch ', num2str(e), '/', num2str(epochs), ', error=', num2str(error)]);
        end
    end
end



