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
function [y] = SystemSettings(arg)
    global Kadc;	
    P = arg/Kadc;	
    global Pthr;    
    global argN;
    global argK;
    global Pch;
    
    global argNSeries;
    global PSeries;
    global time;
    global PchSeries;

    global CodePointer;
    
    global mapArgNArgK;
    
    if (P > Pthr && CodePointer < size(mapArgNArgK, 1))
        CodePointer = CodePointer + 1;
    end
    
    if (P < Pthr && CodePointer > 1)
        CodePointer = CodePointer - 1;
    end
    
    curMapArgNArgK = mapArgNArgK(CodePointer);
    argN = cell2mat(curMapArgNArgK(1));
    argK = cell2mat(curMapArgNArgK(2));
      
    argNSeries(time) = argN;
    PSeries(time) = P;
    PchSeries(time) = Pch;

y = P;
