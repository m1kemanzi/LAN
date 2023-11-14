%% Script plotCompoundNetwork()
% Goal:
% graphs the number of retransmissions for a Compound Network
% using 5 different values of K

K_values = [1, 5, 15, 50, 100];
N = 1000;
p_values = linspace(0, 1, 100);

% FIVE FIGURES: 1, 5, 15, 50, 100
% -----------------------------------------------
% - repeats 5 times because there are 5 figures
for i = 1:5

    % goes in order by K in array
    K = K_values(i);

    % initialize with zeros for speed
    sim_results = zeros(1, 5);
    
    % finds the results based on every probability
    for j = 1:99
        p = p_values(j);
        sim_results(j) = runCompoundNetworkSim(K,j./100,N);
    end
    
    %GRAPH FIGURE

    figure;
    semilogy(sim_results, 'bo', 'LineWidth', 1, 'MarkerFaceColor', 'none');

    %ADD LABELS ON GRAPH
    xlabel('Probability of failure (p)');
    ylabel('Number of transmissions (log scale)');
    title(sprintf('Compound Network: Results for K = %d', K));
    set(gca, 'YScale', 'log');
end

% PLOT EVERYTHING ON ONE FIGURE
% -----------------------------------------------

% re-fill with zeros
sim_results = zeros(1, 5);

%single figure
figure;
hold on;

%run five times for all values of K
for i = 1:5
    K = K_values(i);
    
    for j = 1:99
        p = p_values(j);
        sim_results(j) = runCompoundNetworkSim(K,j./100,N);
    end
    semilogy(sim_results, 'bo', 'LineWidth', 1, 'MarkerFaceColor', 'none');
end

%ADD LABELS ON GRAPH
xlabel('Probability of failure (p)');
ylabel('Number of transmissions (log scale)');
title('Compound Network: Results for K = 1, 5, 15, 50, 100');
set(gca, 'YScale', 'log');