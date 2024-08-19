
mse = @(y, yhat) mean((y - yhat).^2);
mse_prime =  @(y, yhat) 2 * (y - yhat)./ max(size(yhat));
