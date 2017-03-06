Development and research of models of data transmission systems with adaptation to communication channel status and implementation of “deferred precision” principle.
Copyright (C) 2016 Olga Kuprianova
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
function y = System(arg)
    global time;
    global bufferMap;
    global bufferPointer;
    outdata = 0;
    if (time <= 0.014 * 350)
        outdata = FirstSystem(arg);
    end
    
    if (time > 0.014 * 350 && time <= 0.014 * (350 + bufferPointer))
        outdata = FirstSystem(arg);
    end     
y = outdata;
