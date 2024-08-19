classdef Activation %< Layer
    properties
        f
        df
        X
        Y
        dEdX
        dEdY
    end
    
    methods
        % Constructor
        function obj = Activation(f, df)
            obj.f = f;
            obj.df = df;
        end
        
        % Forward method
        function obj = forward(obj, X)
            obj.X = X;
            obj.Y = obj.f(X);
        end
        
        % Backward method
        function obj = backward(obj, dEdY,alpha)
            obj.dEdX = dEdY .* obj.df(obj.X);
        end
    end
end
