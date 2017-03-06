clear;
global Kadc;
global Pthr;
global Pch;
Pthr = 0.3;%заданная вероятность
Kadc = 16;
Pch = 0.1;%вероятность в канале

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