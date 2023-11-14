function result = runTwoParallelLinkSim(K, p, N)
    simResults = zeros(1, N); % Initialize the simulation results array

    for i = 1:N
        txAttemptCount = 0; % Initialize the transmission attempt count
        pktSuccessCount = 0; % Initialize the packet success count

        % Loop until all K packets are successfully transmitted
        while pktSuccessCount < K
            txAttemptCount = txAttemptCount + 1; % Increment transmission attempt count

            % Calculate success probability for this transmission
            successProbability = 1 - p^2;

            % Check if the packet is successfully transmitted
            if rand() <= successProbability
                pktSuccessCount = pktSuccessCount + 1; % Increment success count if packet is successfully transmitted
            end
        end

        simResults(i) = txAttemptCount; % Record the total number of transmission attempts for this simulation
    end
    
    result = mean(simResults); % Calculate the average result over all simulations
end
