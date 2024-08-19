function F = F(network,X)
% network: cell with layers 
% X test 


        output = X;
        for j = 1:length(network)
            network{j} = network{j}.forward(output); % to update input we have to return a new object
            output = network{j}.Y;
        end  
        F = output;
end




