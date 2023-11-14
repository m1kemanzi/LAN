% Assumed runSingleLinkSim function signature:
% function result = runSingleLinkSim(K, p, N)

% Define the range of K and probability p
K_values = [1, 5, 15, 50, 100];
p_values = 0:0.01:0.9;  % Probability of failure from 0 to 0.9 with increment of 0.01
N = 1000;  % Number of iterations for each simulation

% Preallocate matrices to store the simulation and calculated results
simulated_results = zeros(length(K_values), length(p_values));
calculated_results = zeros(length(K_values), length(p_values));

disp('Starting simulations...');

% Main simulation loop
for i = 1:length(K_values)
    K = K_values(i);
    disp(['Simulating for K = ' num2str(K) '...']);
    for j = 1:length(p_values)
        p = p_values(j);
        % Run the simulation
        simulated_results(i, j) = runSingleLinkSim(K, p, N);
        % Replace the placeholder with the actual formula for calculated result
        calculated_results(i, j) = K / (1 - p);  % For K packets
    end
end

disp('Simulations completed. Starting to plot results...');

% Plotting the results
% ... [Previous code for running simulations]

% Initialize figure for combined plot
combined_figure = figure;
hold on;

% Plotting the results
for i = 1:length(K_values)
    K = K_values(i);

    % Individual figure for each K value
    figure;
    plot(p_values, calculated_results(i, :), 'k-', 'LineWidth', 2); hold on;
    plot(p_values, simulated_results(i, :), 'ko', 'MarkerFaceColor', 'w');
    set(gca, 'YScale', 'log');
    title(sprintf('Average Number of Transmissions for K = %d', K));
    xlabel('Probability of Failure (p)');
    ylabel('Average Number of Transmissions');
    legend('Calculated Results', 'Simulated Results');
    grid on; hold off;

    % Add to combined plot
    figure(combined_figure);
    plot(p_values, calculated_results(i, :), '-', 'LineWidth', 2, 'DisplayName', ['Calculated K = ' num2str(K)]);
    plot(p_values, simulated_results(i, :), 'o', 'MarkerFaceColor', 'w', 'DisplayName', ['Simulated K = ' num2str(K)]);
end

% Finalize combined plot
set(gca, 'YScale', 'log');
title('Combined Results for Different K Values');
xlabel('Probability of Failure (p)');
ylabel('Average Number of Transmissions');
legend show;
grid on;

disp('All processes completed.');
