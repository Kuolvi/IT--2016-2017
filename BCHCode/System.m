function y = System(arg)
    global time;
    global bufferMap;
    global bufferPointer;
    outdata = 0;
    if (time <= 0.014 * 350)
        outdata = FirstSystem(arg);
    end
    
    if (time > 0.014 * 350 && time <= 0.014 * (350 + bufferPointer))
        outdata = FirstSystem(arg);
    end     
y = outdata;