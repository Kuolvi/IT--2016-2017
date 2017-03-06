clear;
global Kadc;
global Pthr;
global Pch;
global RefKadc;

Pthr = 0.2;%заданная вероятность
Kadc = 40;
RefKadc = 40;
Pch = 0.5;%вероятность в канале

global CodePointer;
CodePointer = 1;

global argNSeries;
global PSeries;
global PchSeries;
argNSeries = containers.Map('KeyType','double', 'ValueType','double');
PSeries = containers.Map('KeyType','double', 'ValueType','double');
PchSeries = containers.Map('KeyType','double', 'ValueType','double');

indexSet = {1, 2, 3, 4, 5};
argNSet = {31, 63, 127, 255, 511};
argKSet = {{26, 21, 16}, {57, 51, 45, 39, 36, 30, 24, 18, 16}, {71, 64, 57, 50, 43, 36, 29, 22}, {47, 45, 37, 29, 21}, {49, 40, 31, 28, 19}};


mapIndexArgK = containers.Map(indexSet,argKSet);
mapIndexArgN = containers.Map(indexSet,argNSet);

global mapArgNArgK;
mapArgNArgK = containers.Map('KeyType','double', 'ValueType','any');

global tmpMapArgNArgK;
tmpMapArgNArgK = containers.Map('KeyType','double', 'ValueType','any');

global bufferMap;
bufferMap = containers.Map('KeyType', 'double', 'ValueType', 'double');
global bufferPointer;
bufferPointer = 1;


localItr = 1;
for i = 1:5
    curMapIndexArgK = mapIndexArgK(i);
    curmapIndexArgKSize = size(curMapIndexArgK, 2);
    for j = 1:curmapIndexArgKSize
        if (cell2mat(curMapIndexArgK(curmapIndexArgKSize + 1 - j)) >= Kadc)
            mapArgNArgK(localItr) = {mapIndexArgN(i), cell2mat(curMapIndexArgK(curmapIndexArgKSize + 1 - j))};
            localItr = localItr + 1;
            
            tmpMapArgNArgK(mapIndexArgN(i)) = mapIndexArgK(i);
            break;
        end
    end 
end


curMapArgNArgK = mapArgNArgK(1);
global argN;
argN = cell2mat(curMapArgNArgK(1));
global argK;
argK = cell2mat(curMapArgNArgK(2));