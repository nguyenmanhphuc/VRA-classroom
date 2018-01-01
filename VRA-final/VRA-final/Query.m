function result = QueryImageTest(fileName, dict_words, dict, inv_file, if_weight, if_norm, if_dist, verbose, files, top)
    inv = inv_file{1};

    I = im2single(rgb2gray(imread(fileName)));

    % compute SIFT features
    [frame, sift] = vl_covdet(I,'Method', 'HarrisLaplace', 'estimateAffineShape', true);
     %  Compute Root SIFT
%
    for k = 1:nFeatures
          S = sum(sift(:,k));
          sift(:, k) = sqrt(sift(:, k) / S);
    end

    result = cell(1, top);
    % Test on an image
    q_words = cell(1,1);
    q_words{1} = ccvBowGetWords(dict_words, double(sift), [], dict);
 
    [ids, dists] = ccvInvFileSearch(inv, q_words(1), if_weight, if_norm, if_dist, top);

    for i=1:top

            if(ids(i)>=1)
                result{i} = files(ids(i)).name;
            else
                result{i} = 'none';
            end

    end
     fclose(fid);

end

