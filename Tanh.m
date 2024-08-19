classdef Tanh < Activation
    methods
        % Constructor
        function obj = Tanh()
            f = @(x) tanh(x);
            df = @(x) 1 - tanh(x).^2;
            obj = obj@Activation(f, df);
        end
    end
end