classdef Sigmoid < Activation
    methods
        % Constructor
        function obj = Sigmoid()
            f = @(x) 1 ./ (1 + exp(-x));
            df = @(x) f(x) .* (1 - f(x));
            obj = obj@Activation(f, df);
        end
    end
end