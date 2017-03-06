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
clear;
global Kadc;
global Pthr;
global Pch;
Pthr = 0.3;%çàäàííàÿ âåðîÿòíîñòü
Kadc = 16;
Pch = 0.1;%âåðîÿòíîñòü â êàíàëå

global CodePointer;
CodePointer = 1;

global argNSeries;
global PSeries;
global PchSeries;
argNSeries = containers.Map('KeyType','double', 'ValueType','double');
PSeries = containers.Map('KeyType','double', 'ValueType','double');
PchSeries = containers.Map('KeyType','double', 'ValueType','double');

indexSet = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24};
argNSet = {60, 66, 69, 75, 78, 84, 90, 96, 99, 102, 105, 120, 123, 129, 132, 141, 147, 153, 159, 162, 165, 183, 204, 225};
argKSet = {16, 18, 19, 21, 22, 24, 26, 28, 29, 30, 31, 36, 37, 39, 40, 43, 45, 47, 49, 50, 51, 57, 64, 71};

mapIndexArgK = containers.Map(indexSet,argKSet);
mapIndexArgN = containers.Map(indexSet,argNSet);

global mapArgNArgK;
mapArgNArgK = containers.Map('KeyType','double', 'ValueType','any');

localItr = 1;
for i = 1:24
    if (mapIndexArgK(i) >= Kadc)
        mapArgNArgK(localItr) = {mapIndexArgN(i), mapIndexArgK(i)};
        localItr = localItr + 1;
    end 
end

curMapArgNArgK = mapArgNArgK(1);
global argN;
argN = cell2mat(curMapArgNArgK(1));
global argK;
argK = cell2mat(curMapArgNArgK(2));
