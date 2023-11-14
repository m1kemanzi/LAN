%% Function runTwoSeriesLinkSim()
% Parameters
% K - the number of packets in the application message
% p - the probability of failure for each link
% N - the number of simulations to run
%
% Returns: the average number of transmissions across all simulations
function result = runTwoSeriesLinkSim(K,p,N)
 simResults = zeros(1,N); % Array to store the result of each simulation

 for i = 1:N
     txAttemptCount = 0; % Initialize transmission count
     pktSuccessCount = 0; % Initialize number of packets that have made it across both links
     
     while pktSuccessCount < K
         % Attempt to send a packet across the first link
         while rand < p
             txAttemptCount = txAttemptCount + 1; % Count each transmission attempt
         end
         txAttemptCount = txAttemptCount + 1; % Count the successful transmission
         
         % Attempt to send the same packet across the second link
         while rand < p
             txAttemptCount = txAttemptCount + 1; % Count each transmission attempt
         end
         txAttemptCount = txAttemptCount + 1; % Count the successful transmission
         
         pktSuccessCount = pktSuccessCount + 1; % Increment successful packet count after it crosses both links
     end
     
     simResults(i) = txAttemptCount; % Record the total number of transmission attempts for this simulation
 end

 result = mean(simResults); % Return the average result over all simulations
end
