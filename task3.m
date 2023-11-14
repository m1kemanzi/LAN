% Define the range of K values and p values
K_values = [1, 5, 15, 50, 100];
p_values = 0:0.01:0.99; % p ranging from 0 to just before 1 in steps of 0.01
N = 1000; % Number of iterations for each simulation

% Initialize a matrix to store the simulation results
results = zeros(length(K_values), length(p_values));

% Loop over each K value
for k_idx = 1:length(K_values)
    K = K_values(k_idx);

    % Loop over each p value
    for p_idx = 1:length(p_values)
        p = p_values(p_idx);

        % Run the simulation and store the result
        results(k_idx, p_idx) = runTwoParallelLinkSim(K, p, N);
    end

    % Plot the result for each K value in a separate figure
    figure;
    semilogy(p_values, results(k_idx, :), 'o');
    title(sprintf('Simulation Results for K = %d', K));
    xlabel('Probability of Failure (p)');
    ylabel('Average Number of Transmissions');
    grid on;
end

% Plot all K values in a single figure with logarithmic y-scale
figure;
colors = ['b', 'g', 'r', 'c', 'm']; % Different colors for different K values
for k_idx = 1:length(K_values)
    semilogy(p_values, results(k_idx, :), 'o', 'Color', colors(k_idx));
    hold on;
end
title('Simulation Results for All K Values');
xlabel('Probability of Failure (p)');
ylabel('Average Number of Transmissions');
legend(string(K_values), 'Location', 'best');
grid on;
