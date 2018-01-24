function [m, d] = mdpairs(mycells)
    m=[];
    d=[];

    k = 0;
    for i=1:length(mycells)
        parent = mycells(i);
        
        if size(parent.progeny,2) == 2
            k = k + 1;
            
            leftchild = parent.progeny{1};
            rightchild = parent.progeny{2};
            
            m(k) = parent.imt;
            d(k) = leftchild.imt;
            
            k = k + 1;
            
            m(k) = parent.imt;
            d(k) = rightchild.imt;
        end
    end
end