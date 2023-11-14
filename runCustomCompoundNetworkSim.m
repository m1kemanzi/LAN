function avgAttempts = runCustomCompoundNetworkSim(packetCount, failureProb1, failureProb2, failureProb3, iterations)
    attemptCounts = zeros(1, iterations); % Array to store attempts per simulation

    for sim = 1:iterations
        successfulPackets = 0; % Track successful packet transmissions
        totalAttempts = 0;      % Track total transmission attempts

        while successfulPackets < packetCount
            % Attempt transmission over first parallel link
            if rand > failureProb1
                successfulPackets = successfulPackets + 1;
            end
            totalAttempts = totalAttempts + 1;

            % Attempt transmission over second parallel link
            if rand > failureProb2
                successfulPackets = successfulPackets + 1;
            end
            totalAttempts = totalAttempts + 1;

            % Attempt transmission over the single link
            if rand > failureProb3
                successfulPackets = successfulPackets + 1;
            end
            totalAttempts = totalAttempts + 1;
        end

        attemptCounts(sim) = totalAttempts; % Record attempts for this simulation
    end

    avgAttempts = mean(attemptCounts); % Compute the average attempts across simulations
end
