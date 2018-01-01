function result = QueryImage(fileName, numbers, dict_words, dict, inv_file, if_weight, if_norm, if_dist, verbose, files, top)
    x1 = numbers(1);
    y1 = numbers(2);
    x2 = numbers(3);
    y2 = numbers(4);
    inv = inv_file{1};


    I = im2single(rgb2gray(imread(fileName)));

    [frame, sift] = ComputeRootSIFTFeatures(I);

    sift = sift(:,(frame(1,:)<=x2) &  (frame(1,:) >= x1) & (frame(2,:) <= y2) & (frame(2,:) >= y1));
  
    % Test on an image
    q_words = cell(1,1);
    q_words{1} = ccvBowGetWords(dict_words, double(sift), [], dict);
 
    [ids, dists] = ccvInvFileSearch(inv, q_words(1), if_weight, if_norm, if_dist, top);
    
    result = cell(1, max(size(ids, 2), top));
    for i=1:size(result, 2)

            if(ids(i)>=1)
                result{i} = files(ids(i)).name;
            else
                result = result(1:i-1);
               break;
            end
%         fprintf(fid, '%s\n', files(ids{1}(i)).name(1:end-4));
    end
%     fclose(fid);

end

