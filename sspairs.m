function [l, r] = sspairs(mycells)
    l=[];
    r=[];

    k = 0;
    for i=1:length(mycells)
        parent = mycells(i);
        
        if size(parent.progeny,2) == 2
            k = k + 1;
            
            leftchild = parent.progeny{1};
            rightchild = parent.progeny{2};
            
            l(k) = leftchild.imt;
            r(k) = rightchild.imt;
        end
    end
end