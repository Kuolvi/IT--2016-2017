function y = Time(arg)  
    global Pch;
    global time;
    time = arg;
    if (time <= 0.014 * 100 )
        Pch = 0.1;
    elseif (time >= 0.014 * 200 )
        Pch = 0.2;
    else
        Pch = 0.1;
    end
y = time;