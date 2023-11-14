% MATLAB program using runTwoSeriesLinkSim function
% Define K values and probability range for p
K_values = [1, 5, 15, 50, 100];
p_values = 0:0.01:0.9; % Avoiding p = 1 as it guarantees failure
N = 1000; % Number of simulations

% Preallocate matrices for storing results
simulated_results = zeros(length(K_values), length(p_values));
calculated_results = zeros(length(K_values), length(p_values));

% Run simulations and store results
for i = 1:length(K_values)
    for j = 1:length(p_values)
        simulated_results(i, j) = runTwoSeriesLinkSim(K_values(i), p_values(j), N);
        calculated_results(i, j) = K_values(i) / (1 - p_values(j))^2; % Adjusted for two series links
    end
end

% Initialize figure for combined results
combined_figure = figure;
hold on;

% Plot results for each K value
legend_entries = cell(1, length(K_values)*2); % Preallocate cell for legend entries
for i = 1:length(K_values)
    figure; % Create a figure for each K value
    semilogy(p_values, calculated_results(i, :), 'LineWidth', 2);
    hold on;
    semilogy(p_values, simulated_results(i, :), 'o', 'MarkerFaceColor', 'w');
    xlabel('Probability of Failure (p)');
    ylabel('Average Number of Transmissions');
    title(['K = ' num2str(K_values(i))]);
    legend('Calculated', 'Simulated');
    grid on;
    hold off;

    % Add results to combined figure
    figure(combined_figure);
    semilogy(p_values, calculated_results(i, :), 'LineWidth', 2);
    hold on;
    semilogy(p_values, simulated_results(i, :), 'o', 'MarkerFaceColor', 'w');

    % Prepare legend entries
    legend_entries{i*2-1} = ['Calculated K = ' num2str(K_values(i))];
    legend_entries{i*2} = ['Simulated K = ' num2str(K_values(i))];
end

% Finalize combined plot
figure(combined_figure);
xlabel('Probability of Failure (p)');
ylabel('Average Number of Transmissions');
title('Combined Results for Different K Values');
legend(legend_entries, 'Location', 'northwest');
set(gca, 'YScale', 'log'); % Use logarithmic scale
grid on;
hold off;
