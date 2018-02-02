function descendants = allcells(ancestors)

descendants = [];
for k=1:length(ancestors)
    ancestor = ancestors(k);
    
    if ancestor.generation > 1 % censor start of experiment noise
        descendants = [descendants ancestor];
    end
    
    for i=1:length(ancestor.progeny)
        child = ancestor.progeny(i);
        child = child{:};
        descendants = [descendants allcells(child)];
    end
end
end

