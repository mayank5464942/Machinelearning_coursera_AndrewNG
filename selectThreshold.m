function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector

  


predictions = (pval < epsilon);

tp=0;
fp=0;
fn=0;
for i=1:size(yval,1)
    if(predictions(i,1)==1 && yval(i,1)==1)
        tp =tp+1;
    end
    if (predictions(i,1)==0 && yval(i,1)==1)
        fn=fn+1;
    end
    if(predictions(i,1)==1 && yval(i,1)==0)
        fp=fp+1;
    end
end
prec =tp/tp+fp;
rec =tp/tp+fn;
F1_score =2*prec*rec/(prec+rec);
F1=[F1,F1_score];
end












    % =============================================================

    [bestF1,Ind] = max(F1);
    bestEpsilon = min(pval)+(Ind - 1)*stepsize;
    

end
