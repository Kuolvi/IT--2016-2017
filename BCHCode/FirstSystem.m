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