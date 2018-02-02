function mycell = experiment(inheritedX, inheritedY, startI, generation, genLimit, thresholdX, thresholdY,diffuse_const)
    
mycell.generation = uint16(generation);
[i, X, Y] = driftdiffusion(inheritedX, inheritedY, startI, mycell.generation,thresholdX,thresholdY,diffuse_const);
mycell.xEnd = int16(X);
mycell.yEnd = int16(Y);
mycell.imt = uint16(i - startI);

percentKill = 0.5;
if rand < percentKill
    genLimit = 0;
end

if rand < 0.1
    drawnow;
end

if generation < genLimit
    % partitioning error
    
    %inheritance
    %leftInheritX = mycell.xEnd*0.3;
    %rightInheritX = mycell.xEnd*0.7;
    %leftInheritY = mycell.yEnd*0.3;
    %rightInheritY = mycell.yEnd*0.7;
    
    %perfect reset
    if rand < 0.2
        leftInheritX = thresholdX;
        rightInheritX = thresholdX;
    else
        leftInheritX = 0;
        rightInheritX = 0;
    end
    leftInheritY = 0;
    rightInheritY = 0;
    
    
    
    % run children
    leftdaughter = experiment(leftInheritX, leftInheritY, i, generation+1, genLimit,thresholdX,thresholdY,diffuse_const);
    rightdaughter = experiment(rightInheritX, rightInheritY, i, generation+1, genLimit,thresholdX,thresholdY,diffuse_const);
    
    mycell.progeny = {leftdaughter, rightdaughter};
else
    mycell.progeny = {};
end
end