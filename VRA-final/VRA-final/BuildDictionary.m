function dict_words = BuildDictionary(features, num_iterations, num_trees, num_words, dictPath )
dict_params =  {num_iterations, 'kdt', num_trees};
% build the dictionary
if exist(dictPath, 'file')
    load(dictPath);
else
    randIndex = randperm(size(features,2));
%     dict_words = ccvBowGetDict(features(:,randIndex(1:100000)), [], [], num_words, 'flat', 'akmeans', ...
%         [], dict_params);
    dict_words = ccvBowGetDict(features, [], [], num_words, 'flat', 'akmeans', ...
        [], dict_params);
    save(dictPath, 'dict_words');
end

end

