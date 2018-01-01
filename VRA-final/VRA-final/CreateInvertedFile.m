function output = CreateInvertedFile(words, nWords, if_weight, if_norm)
   b = ccvInvFileInsert([], words, nWords);

    ccvInvFileCompStats(b, if_weight, if_norm);
     output = cell(1, 1);
    output{1} = b;
end

