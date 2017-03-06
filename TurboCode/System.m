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

    global argN;
    global argK;
    global Pch;
    global Kadc;
    
    arg1 = arg(end - Kadc + 1: end);
    arg = arg(end - argK + 1: end);
    
    TEnc = comm.TurboEncoder('TrellisStructure',poly2trellis(4, [13, 15], 13),'InterleaverIndices',(argK:-1:1).');   
    TDec = comm.TurboDecoder('TrellisStructure',poly2trellis(4, [13, 15], 13),'InterleaverIndices',(argK:-1:1).', 'NumIterations', 6);

    encodedData = step(TEnc, arg);
    
    ndata = bsc(encodedData, Pch);
    
    for i = 1 : argN
        if (ndata(i) == 0)
            ndata(i) = -1;
        end
        
        if (ndata(i) == 1)
            ndata(i) = 3;
        end
    end
    
    decodedData = step(TDec, ndata);

    data2 = decodedData(end - 16 + 1: end);
    decodedData = decodedData(end - Kadc + 1: end);
    
    data1 = zeros(size(decodedData, 1), 1);
    for i = 1 : size(decodedData, 1)
        data1(i) = decodedData(i);
    end
      
    outdata = zeros(16, 1);
    for i = 1 : 16
        outdata(i) = data2(i);
    end
    
    p = 0;
    for i = 1 : size(decodedData, 1)
        p = p + xor(data1(i), arg1(i));
    end
    
    P = SystemSettings(p);
       
y = outdata;
