function RandomTestData(path)
   [images, labels] = loadData(path);
   trainData = uint8(zeros(320, size(images, 2)));
   trainLabels = uint8(zeros(320, 1));
   testData = uint8(zeros(80, size(images, 2)));
   testLabels = uint8(zeros(80,1));
    for i =1:40
        random = randperm(10);
        for j = 1: 8
            index = i * 10 + random(j)-10;
            trainData(i * 8 + j -8, :) = images(index, :);
            trainLabels(i * 8 + j -8) = i;
        end
        for j = 9: 10
            index = i * 10 + random(j)-10;
            testData(i * 2 - 10 + j, :) = images(index, :);
            testLabels(i * 2 - 10 + j) = i;
        end
    end
    
    save('Train.mat', 'trainData', 'trainLabels');
    save('Test.mat', 'testData', 'testLabels');
end

