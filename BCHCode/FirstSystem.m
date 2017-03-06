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

function y = FirstSystem(arg)

    global argN;
    global argK;
    global Pch;
    global Kadc;
    
    arg1 = arg(end - Kadc + 1: end);
    arg = arg(end - argK + 1: end);
    
    msg = gf(arg');
    code = bchenc(msg, argN, argK);
    code = code.x;
    
    data = zeros(argN, 1);
    for i = 1 : argN
        data(i) = code(i);
    end
    
    ndata = bsc(data, Pch);
    
    msg1 = gf(ndata');
    decoded = bchdec(msg1, argN, argK); 
    decoded = decoded.x;
    
    decoded = decoded(end - Kadc + 1: end);
    
    data1 = zeros(size(decoded, 2), 1);
    for i = 1 : size(decoded, 2)
        data1(i) = decoded(i);
    end
      
    x = 0;
    for i = 1 : size(decoded, 2)
        x = x + xor(data1(i), arg1(i));
    end
    
    P = SystemSettings(x);
       
y = P;
