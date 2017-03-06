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