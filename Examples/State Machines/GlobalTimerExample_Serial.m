% Example state matrix: A global timer ends an infinite loop. It is
% triggered in the first state, but begins measuring its 3-second Duration 
% after a 1.5s onset delay. When the timer begins measuring, it sends byte string
% #65 ('A' by default) to the module on Serial channel 2. When the timer's 3 second duration elapses, 
% byte string #66 ('B' by default) is sent to Serial2, and a GlobalTimer1_End event occurs 
% (handled in both cases by exiting the state machine).

sma = NewStateMatrix();
sma = SetGlobalTimer(sma, 'TimerID', 1, 'Duration', 3, 'OnsetDelay', 1.5, 'Channel', 'Serial2',...
    'OnMessage', 65, 'OffMessage', 66); 
sma = AddState(sma, 'Name', 'TimerTrig', ...
    'Timer', 0,...
    'StateChangeConditions', {'Tup', 'Port1Lit'},...
    'OutputActions', {'GlobalTimerTrig', 1});
sma = AddState(sma, 'Name', 'Port1Lit', ...
    'Timer', .25,...
    'StateChangeConditions', {'Tup', 'Port3Lit', 'GlobalTimer1_End', 'exit'},...
    'OutputActions', {'PWM1', 255});
sma = AddState(sma, 'Name', 'Port3Lit', ...
    'Timer', .25,...
    'StateChangeConditions', {'Tup', 'Port1Lit', 'GlobalTimer1_End', 'exit'},...
    'OutputActions', {'PWM3', 255});
