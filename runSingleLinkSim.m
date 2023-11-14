% runCompoundNetworkSimulation - Calculates average transmission attempts
% for a given network scenario.
%
% Parameters:
%   K - Total packets in the message
%   p - Failure probability for links
%   N - Number of simulation iterations
%
% Returns:
%   Average number of transmission attempts across all simulations

function avgAttempts = runCompoundNetworkSimulation(packetCount, failureProb, iterations)
    attemptCounts = zeros(1, iterations); % Array to store attempts per simulation

    for sim = 1:iterations
        successfulPackets = 0; % Track successful packet transmissions
        totalAttempts = 0;      % Track total transmission attempts

        while successfulPackets < packetCount
            % Attempt transmission over parallel links
            rand1 = rand;
            rand2 = rand;
            if rand1 > failureProb || rand2 > failureProb
                successfulPackets = successfulPackets + 1;
            end
            totalAttempts = totalAttempts + 1;

            % Attempt transmission over a single link
            if rand > failureProb
                successfulPackets = successfulPackets + 1;
            end
            totalAttempts = totalAttempts + 1;
        end

        attemptCounts(sim) = totalAttempts; % Record attempts for this simulation
    end

    avgAttempts = mean(attemptCounts); % Compute the average attempts across simulations
end
