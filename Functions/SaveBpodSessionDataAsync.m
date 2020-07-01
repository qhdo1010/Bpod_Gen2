%{
----------------------------------------------------------------------------

This file is part of the Sanworks Bpod repository
Copyright (C) 2019 Sanworks LLC, Stony Brook, New York, USA

----------------------------------------------------------------------------

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, version 3.

This program is distributed  WITHOUT ANY WARRANTY and without even the 
implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
%}
function retCode = SaveBpodSessionDataAsync(BpodSystem, pollableQueue, interval)
    

    while true
        
        %%% wait for new data %%%
        poll(pollableQueue, Inf);
        
        %%% update Bpod Data %%%
        
        
        
        
        %%% try to save %%%
        SessionData = BpodSystem.Data;
        save(BpodSystem.Path.CurrentDataFile, 'SessionData');

        
        
    SaveBpodSessionData;
    
    SessionData = BpodSystem.Data;
    save(BpodSystem.Path.CurrentDataFile, 'SessionData');
    retCode = 1;

end
    
