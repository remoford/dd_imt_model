function mycell = experiment(inheritedX, inheritedY, startI, generation, genLimit)
    
mycell.generation = uint16(generation);
%mycell.begin = startI;   
[i, X, Y] = driftdiffusion(inheritedX, inheritedY, startI, mycell.generation);
mycell.xEnd = int16(X);
mycell.yEnd = int16(Y);
mycell.imt = uint16(i - startI);
%mycell.end = i;

%if rand > 0.53-0.0001*generation
%    genLimit = 0;
%end

%percentKill = sin(generation/10)/128+0.49;
percentKill = 0.5;
if rand > percentKill
    genLimit = 0;
end

if rand < 1
    drawnow;
    %disp(percentKill);
end

if generation < genLimit
    % partition error
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