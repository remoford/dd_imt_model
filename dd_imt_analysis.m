clear;
clf;
hold on;
frame(1:1500)=250;
plot(frame);

M=[];
D=[];
L=[];
R=[];

% for num starting cells
for k=1:100
    ancestor = experiment(100,100,0,0,2);

    pairs = mdpairs(ancestor);
    sizePairs = size(pairs,2);
    m = single(zeros(sizePairs,1));
    d = single(zeros(sizePairs,1));
    for i=1:sizePairs
       m(i) = single(pairs(i).mother.imt);
       d(i) = single(pairs(i).daughter.imt);
    end
    M=cat(2,m',M);
    D=cat(2,d',D);

    pairs = sspairs(ancestor);
    r = single(zeros(sizePairs,1));
    l = single(zeros(sizePairs,1));
    for i=1:size(pairs,2)
       l(i) = single(pairs(i).left.imt);
       r(i) = single(pairs(i).right.imt);
    end
    L=cat(2,l',L);
    R=cat(2,r',R);
end

plot(M,D,'o','MarkerSize', 5, 'linewidth', 2, 'color', [0.5,0,0,0.5]);
mdcorr = corr(M',D','type','Spearman')

plot(L,R,'*','MarkerSize', 7, 'linewidth', 1, 'color', [0,0,0.5,0.5]);
sscorr = corr(L',R','type','Spearman')





