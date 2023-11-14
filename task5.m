% Define the range of failure probabilities and packet counts
failureProbs = 0.01:0.01:0.99; % From 1% to 99%
packetCounts = [1, 5, 10]; % K values
iterations = 1000; % Number of iterations for each simulation

% Define the six scenarios from the table
scenarios = {
    {0.1, 0.6, 'vary'}, % Scenario 1
    {0.6, 0.1, 'vary'}, % Scenario 2
    {0.1, 'vary', 0.6}, % Scenario 3
    {0.6, 'vary', 0.1}, % Scenario 4
    {'vary', 0.1, 0.6}, % Scenario 5
    {'vary', 0.6, 0.1}  % Scenario 6
};

% Loop through each scenario
for s = 1:length(scenarios)
    scenario = scenarios{s};
    figure; % Create a new figure for each scenario

    % Loop through each packet count
    for k = 1:length(packetCounts)
        packetCount = packetCounts(k);
        avgAttempts = zeros(length(failureProbs), 1); % Reset for each packet count

        % Loop through each failure probability
        for i = 1:length(failureProbs)
            p = failureProbs(i);
            if ischar(scenario{1})
                failureProb1 = p;
            else
                failureProb1 = scenario{1};
            end
            if ischar(scenario{2})
                failureProb2 = p;
            else
                failureProb2 = scenario{2};
            end
            if ischar(scenario{3})
                failureProb3 = p;
            else
                failureProb3 = scenario{3};
            end

            % Run the simulation
            avgAttempts(i) = runCustomCompoundNetworkSim(packetCount, failureProb1, failureProb2, failureProb3, iterations);
        end

        % Plot the results for this packet count
        semilogy(failureProbs, avgAttempts, 'DisplayName', sprintf('K = %d', packetCount));
        hold on; % Hold on to plot next lines in the same figure
    end

    % Configure the plot
    title(sprintf('Scenario %d', s));
    xlabel('Failure Probability');
    ylabel('Average Attempts (Log Scale)');
    legend show;
    grid on;
    hold off; % Release the plot
end
