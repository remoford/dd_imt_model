function [i, xEnd, yEnd] = driftdiffusion(xStart, yStart, startI, generation)

thresholdX = 200;
thresholdY = 200;
checkpoint = 0;
diffuse_const=0.5;
X(1,startI+1) = xStart;
Y(1,startI+1) = yStart;
for k=1:startI
     X(k) = 0;
     Y(k) = 0;
end
i= startI + 1;
stop = 0;

hold on;
while ~stop
    i=i+1;
    if checkpoint == 0
        X(i)= X(i-1) + diffuse_const + round(1*normrnd(0,1));
        Y(i)= Y(i-1) + round(normrnd(0,1));
    end
    if checkpoint == 1
        X(i)= X(i-1) + round(normrnd(0,1));
        Y(i)= Y(i-1) + diffuse_const + round(1*normrnd(0,1));
    end
    
    if checkpoint == 0 && X(i) > thresholdX
        checkpoint = 1;
        %Y(i)=0;
    end
    if checkpoint == 1 && Y(i) > thresholdY
       checkpoint = 0;
       plot(i,Y(i),'X','MarkerSize', 10, 'linewidth', 2);
       stop = 1;
    end
end
plot(X,'color', [1,0,0,0.2]);
plot(Y,'color', [0,1,0,0.2]);
%drawnow;
xEnd = X(end);
yEnd = Y(end);
end
