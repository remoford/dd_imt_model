function imts = allimts(mycells)

imts = [];
for i=1:length(mycells)
    thiscell = mycells(i);
    imts = [imts thiscell.imt];
end
end