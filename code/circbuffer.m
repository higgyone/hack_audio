

function run
  clear;clc;
  in = [1 ; -1 ; 2 ; -2 ; 3 ; zeros(5,1)];
  buffer = zeros(6,1);
  % Number of samples of delay
  delay = 4;
  N = length(in);
  out = zeros(N,1);
  % Series delay
  for n = 1:N
  [out(n,1),buffer] = circularBuffer(in(n,1),buffer,delay,n);
  % Display current status values
  disp(['The current sample number is: ' , ...
  num2str(n)]);
  disp(['The current buffer index is: ' , ...
  num2str(mod(n-1,6) + 1)]);
  disp(['The current delay index is: ' , ...
  num2str(mod(n-delay-1,6) + 1)]);
  disp(['The input is: ' , num2str(in(n,1))]);
  disp(['The delay buffer is: [' , num2str(buffer.') , ']']);
  disp(['The output is: ' , num2str(out(n,1))]); disp(' ');
  pause;
  end
endfunction

function [out,bufferx] = circularBuffer(in,bufferx,delay,n)
% Determine indexes for circular buffer
len = length(bufferx);
indexC = mod(n-1,len) + 1; % Current index in circular buffer
indexD = mod(n-delay-1,len) + 1; % Delay index in circular buffer
out = bufferx(indexD,1);
% Store the current output in appropriate index
bufferx(indexC,1) = in;
endfunction