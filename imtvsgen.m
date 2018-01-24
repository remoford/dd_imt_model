function [imt gen] = imtvsgen(mycells)

imt = [];
gen = [];
for i=1:length(mycells)
    thiscell = mycells(i);
    imt = [imt thiscell.imt];
    gen = [gen thiscell.generation];
end
end