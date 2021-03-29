function mse_calc = mse_test(x, net, inputs, targets)
% one given as input
net = setwb(net, x');
% To evaluate the ouputs based on the given
% weights and biases vector
y = net(inputs);
% Calculating the mean squared error
mse_calc = sum((y-targets).^2)/length(y);
% end

% INITIALIZE THE NEURAL NETWORK PROBLEM %
% inputs for the neural net
inputs = (1:10);
% targets for the neural net
targets = cos(inputs.^2);
% number of neurons
n = 2;
% create a neural network
net = feedforwardnet(n);
% configure the neural network for this dataset
net = configure(net, inputs, targets);
% create handle to the MSE_TEST function, that
% calculates MSE
h = @(x) mse_test(x, net, inputs, targets);

ga_opts = gaoptimset('TolFun', 1e-8,'display','iter');
[x_ga_opt, err_ga] = ga(h, 3*n+1, ga_opts);