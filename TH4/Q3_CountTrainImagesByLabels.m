function Q3_CountTrainImagesByLabels()
    load('Train.mat','trainData', 'trainLabels');
    count = uint8(zeros(40, 1));
    n = size(trainLabels, 1);
    for i =1:n
        count(trainLabels(i))  = count(trainLabels(i)) + 1;
    end
    csvwrite('Q3_CountTrainImagesByLabels.csv', count);
end

