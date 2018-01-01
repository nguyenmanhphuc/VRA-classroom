function words = ComputeWords(dict_words, features, features_per_image, wordsPath, dict )
    num_images = size(features_per_image, 2);

    if exist(wordsPath, 'file')
        load(wordsPath);
    else
        words = cell(1, num_images);
        for i=1:num_images
            fprintf('Quantizing %d/%d images\n', i, num_images);
            if i==1
                bIndex = 1;
            else
                bIndex = sum(features_per_image(1:i-1))+1;
            end
            eIndex = bIndex + features_per_image(i)-1;
            words{i} = ccvBowGetWords(dict_words, features(:, bIndex:eIndex), [], dict);
        end
        save(wordsPath, 'words');
    end
end

