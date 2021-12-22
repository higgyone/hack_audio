clear;clc;
% Horizontal for displaying in Command Window
in = [1, -1, 2 , -2, zeros(1,6)];
% Buffer should be initialized without any value
% Length of buffer = 5, output is indexed from end of buffer
% Therefore, a delay of 5 samples is created
buffer = zeros(1,5);
N = length(in);
out = zeros(1,N);
for n = 1:N
% Read the output at the current time sample
% from the end of the delay buffer
out(1,n) = buffer(1,end);
disp(['For sample ', num2str(n),' the output is: ', ...
num2str(out(1,n))]);
% Shift each value in the buffer by one element
% to make room for the current sample to be stored
% in the first element
buffer = [in(1,n) buffer(1,1:end-1)];
disp(['For sample ', num2str(n),' the buffer is: ', ...
num2str(buffer)]);
% Press <ENTER> in the Command Window to continue
pause;
disp([' ']); % Blank line
end
% Compare the input & output signals
disp(['The orig. input signal was: ', num2str(in)]);
disp(['The final output signal is: ', num2str(out)]);
