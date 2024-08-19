classdef Dense %< Layer
    properties
        W
        b
        X
        Y
        dEdX
    end
    
    methods
        % Constructor
        function obj = Dense(X_size, Y_size)
            obj.W = randn(Y_size, X_size);
            obj.b = randn(Y_size, 1);
        end
        
        % Forward method
        function obj = forward(obj, X)
            obj.X = X;
            obj.Y = obj.W * X + obj.b;
        end
        
        % Backward method
        function obj = backward(obj, dEdY, alpha)
            dEdW = dEdY * obj.X';
            obj.dEdX = obj.W' * dEdY;
            obj.W = obj.W - alpha * dEdW;
            obj.b = obj.b - alpha * dEdY;
        end
    end
end
