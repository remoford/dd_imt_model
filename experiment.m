function mycell = experiment(inheritedX, inheritedY, startI, generation, genLimit)
    
mycell.generation = uint16(generation);
[i, X, Y] = driftdiffusion(inheritedX, inheritedY, startI, mycell.generation);
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
    leftInheritX = mycell.xEnd*0.5;
    rightInheritX = mycell.xEnd*0.5;
    leftInheritY = mycell.yEnd*0.5;
    rightInheritY = mycell.yEnd*0.5;
    
    % run children
    leftdaughter = experiment(leftInheritX, leftInheritY, i, generation+1, genLimit);
    rightdaughter = experiment(rightInheritX, rightInheritY, i, generation+1, genLimit);
    
    mycell.progeny = {leftdaughter, rightdaughter};
else
    mycell.progeny = {};
end
end