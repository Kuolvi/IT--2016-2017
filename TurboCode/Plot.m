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
global argNSeries;
global PSeries;
global PchSeries;
global Pthr;

allValuesArgN = values(argNSeries);
allValuesP = values(PSeries);
allValuesPch = values(PchSeries);

plArrArgN = zeros(1, size(allValuesArgN, 2));
plArrP = zeros(1, size(allValuesP, 2));
dif = zeros(1, size(allValuesP, 2));
tser = zeros(1, size(allValuesP, 2));
plArrPch = zeros(1, size(allValuesPch, 2));
for i = 1 : size(allValuesArgN, 2)
    plArrArgN(i) = cell2mat(allValuesArgN(i));
    plArrP(i) = cell2mat(allValuesP(i));
    plArrPch(i) = cell2mat(allValuesPch(i));
    dif(i) = plArrP(i) - Pthr;
    tser(i)=i-1;
end

figure % new figure

ax1 = subplot(3,1,1); % top subplot

ax2 = subplot(3,1,2); % bottom subplot

ax3 = subplot(3,1,3);


plot(ax1, plArrArgN);
xlabel(ax1, ' t ' );
ylabel(ax1, ' N  ' );
title(ax1, ' ' );
grid(ax1,'on');

plot(ax2, tser, plArrP, tser, plArrPch);
xlabel(ax2, ' t ' )
ylabel(ax2, 'Ðîøñ /Pîøê ' )
title(ax2, ' ' )
grid(ax2,'on')

plot(ax3, tser, dif, tser, plArrPch);
xlabel(ax3, ' t ' )
ylabel(ax3, ' \lambda  /Pîøê' )
title(ax3, ' ' )
grid(ax3,'on');

