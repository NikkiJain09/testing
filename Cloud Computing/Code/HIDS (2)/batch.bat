cd C:\Users\abc\Desktop\cloud\
call :sub >cpuutil.txt

:sub
typeperf "\processor(_Total)\%% Processor Time"