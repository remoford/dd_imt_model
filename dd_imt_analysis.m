clear;
close all;
set(0,'DefaultFigureWindowStyle','docked');
hold on;

histogram_nbins=25;
num_starting_cells=100;
initial_protein_lvl_1=0;
initial_protein_lvl_2=0;
generation_cap=5;
thresholdX=50;
thresholdY=50;
diffuse_const=1;

ancestors=[];
for k=1:num_starting_cells
    ancestor = experiment(initial_protein_lvl_1, initial_protein_lvl_2,  0, 0, generation_cap,   thresholdX, thresholdY,diffuse_const);
    ancestors = [ancestors ancestor];
end

mycells = allcells(ancestors);
numcells = length(mycells)

figure;
imts = allimts(mycells);
histogram(imts, histogram_nbins);
xlabel("IMT");
ylabel("Count");
title("IMT Distribution");

figure;
[m, d] = mdpairs(mycells);
%plot(m, d, 'o', 'MarkerSize', 1, 'linewidth', 2, 'color', [0.5,0,0,0.5]);
histogram2(m,d,histogram_nbins);
mdcorr = corr(m', d', 'type', 'Spearman');
xlabel("Mother IMT");
ylabel("Daughter IMT");
title("M-D Correlation = "+string(mdcorr));

figure;
[l, r] = sspairs(mycells);
%plot(l,r,'*','MarkerSize', 1, 'linewidth', 1, 'color', [0,0,0.5,0.5]);
histogram2(l,r,histogram_nbins);
sscorr = corr(l',r','type','Spearman');
xlabel("Left sister IMT");
ylabel("Right sister IMT");
title("S-S Correlation = "+string(sscorr));

figure;
[imt gen] = imtvsgen(mycells);
%plot(gen, imt,'*');
histogram2(gen, imt,histogram_nbins);
gencorr = corr(double(gen)',double(imt)','type','Spearman');
ylabel("IMT");
xlabel("Generation");
title("IMT-Generation Correlation = "+string(gencorr));