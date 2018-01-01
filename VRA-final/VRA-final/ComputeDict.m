function dict = ComputeDict(dict_words, num_iterations, num_trees)
    dict_params =  {num_iterations, 'kdt', num_trees};
    dict = ccvBowGetWordsInit(dict_words, 'flat', 'akmeans', [], dict_params);
end

