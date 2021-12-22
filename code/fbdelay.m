function run
in = [1 ; -1 ; 2 ; -2 ; zeros(6,1)]; % Input signal
% Longer buffer than delay length to demonstrate
% delay doesn't just have to be the "end" of buffer
buffer = zeros(20,1);
% Number of samples of delay
delay = 5;
% Feedback gain coefficient
fbGain = 0.5;
% Initialize output vector
N = length(in);
out = zeros(N,1);
% Series delay
for n = 1:N
% Pass "buffer" into feedbackDelay function
[out(n,1),buffer] = feedbackDelay(in(n,1),buffer,delay,fbGain);
% Return updated "buffer" for next loop iteration
end
% Print and compare input and output signals
disp('Feed–back Delay: 5 samples');
disp('The orig. input signal was: ')
in
disp('The final output signal is: ');
out
endfunction

% FEEDBACKDELAY
% This function performs feedback delay by processing an
% individual input sample and updating a delay buffer
% used in a loop to index each sample in a signal
%
% Additional input variables
% delay : samples of delay
% fbGain : feedback gain (linear scale)
function [out,buffer] = feedbackDelay(inx,buffer,delay,fbGain)
out = inx + fbGain*buffer(delay,1);
% Store the current output in appropriate index
buffer = [out ; buffer(1:end -1,1)];
endfunction





