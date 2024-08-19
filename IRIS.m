clear;
close all;

load fisheriris;
features = meas;  % Features (measurements)
labels = species; % Labels (species)

%%


for i = 1:length(labels)
switch labels{i}
    case 'setosa'
        num_labels(i) = -1;
    case 'versicolor'
        num_labels(i) = 0;
    case 'virginica'
        num_labels(i) = 1;
end

end

features = features';
ind = randperm(length(labels));

X_train = features(:,ind(1:100));
Y_train = num_labels(:,ind(1:100));

X_test = features(:,ind(101:150));
Y_test = num_labels(:,ind(101:150));


%%


X_train = num2cell(X_train,1);
Y_train = num2cell(Y_train);




%%
network = {
    Dense(4, 3),
    Tanh(),
    Dense(3, 5),
    Tanh(),
    Dense(5, 4),
    ReLU();
    Dense(4,6),
    Tanh(),
    Dense(6, 1),

}

cost_functions;
E = mse;
dE = mse_prime;

%% Train
network = train(network, E, dE, X_train, Y_train, 1000, 0.01, 1);
% load('iris_network.mat');

%% Test


for i = 1:max(size(X_test))  % randperm(length(x_train))
X0 = X_test(:,i);
FF(i) = F(network,X0);
end




%%

h1 = figure;
h1.Color='k';
hold on;
set(gca,'Color','k');
set(gca,'xcolor','[0.55 0.55 0.55]') 
set(gca,'ycolor','[0.55 0.55 0.55]') 
set(gcf, 'InvertHardCopy', 'off');
ax = gca;
ax.FontSize=16;
ax.LabelFontSizeMultiplier = 1.5;
ax.TickLabelInterpreter='latex';
ax.Box = 'on';


% xlabel('$N$','FontSize',30,'Interpreter','latex');
% ylabel('$a_1$','FontSize',30,'Interpreter','latex');
tit  = title('Iris dataset','FontSize',30,'Interpreter','latex');
tit.Color = [0.55 0.55 0.55];
hold on
plot(Y_test,'.-','LineWidth',3,'MarkerSize',20);
plot(round(FF),'o-','LineWidth',3,'MarkerSize',20)
ylim([-1.5 1.5])
leg = legend('true','predicted','FontSize',20,'Interpreter','latex');
set(leg,'TextColor','[0.55 0.55 0.55]');