function Q4_CountTestImagesByLabels()
    load('Test.mat','testData', 'testLabels');
    count = uint8(zeros(40, 1));
    n = size(testData, 1);
    for i =1:n
        count(testLabels(i))  = count(testLabels(i)) + 1;
    end
    csvwrite('Q4_CountTestImagesByLabels.csv', count);
end

