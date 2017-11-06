function [images, labels] = loadData(path)
    images = uint8(zeros(10*40,112*92));
    labels = uint8(zeros(400, 1));
     for i = 1:40
        folder = [path,'\s', num2str(i)];
        for j = 1:10
            file = [folder, '\', num2str(j), '.pgm'];
            image = reshape(imread(file), 1, 112*92);
            images((i-1)*10+j, :) = image;
            labels((i-1)*10+j) = i;
        end
     end

end

