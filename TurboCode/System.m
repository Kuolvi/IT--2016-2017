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