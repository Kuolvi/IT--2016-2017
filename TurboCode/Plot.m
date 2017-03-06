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
ylabel(ax2, '׀מרס /Pמרך ' )
title(ax2, ' ' )
grid(ax2,'on')

plot(ax3, tser, dif, tser, plArrPch);
xlabel(ax3, ' t ' )
ylabel(ax3, ' \lambda  /Pמרך' )
title(ax3, ' ' )
grid(ax3,'on');

