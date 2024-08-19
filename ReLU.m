classdef ReLU < Activation
    methods
        % Constructor
        function obj = ReLU()
            f = @(x) x.*(x>0);
            df = @(x) 1.*(x>0);
            obj = obj@Activation(f, df); % call constructor of the superclass from subclass
        end
    end
end