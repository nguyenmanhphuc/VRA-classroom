function [frame, sift] = ComputeRootSIFTFeatures(I)
    [frame, sift]= vl_covdet(I, 'Method', 'HarrisLaplace', 'estimateAffineShape', true);
    nFeatures= size(sift, 2);
    for k = 1:nFeatures
          S = norm(sift(:,k), 1);
          sift(:, k) = sqrt(sift(:, k) / S);
    end

end

