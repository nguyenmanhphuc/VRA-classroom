q_files = dir(fullfile('oxford\groundtruth', '*query.txt'));
% load query image
imageIndex = load('oxford\index.mat', 'imageIndex');
imageIndex = imageIndex.imageIndex;
for k=1:length(q_files)
    k
    fid = fopen(strcat('oxford\groundtruth\', q_files(k).name), 'r');
    str = fgetl(fid);
    [image_name, remain] = strtok(str, ' ');
    fclose(fid);
    numbers = str2num(remain);
    x1 = numbers(1);
    y1 = numbers(2);
    x2 = numbers(3);
    y2 = numbers(4);
    file = strcat('oxford\images\', image_name(6:end), '.jpg');
    I = im2single(rgb2gray(imread(file)));

    imageIDs = retrieveImages(I,imageIndex,'ROI', uint8([x1+1, y1+1, x2+1, y2+1]));
    fid = fopen('oxford\groundtruth\rank_list.txt', 'w');
    for i=1:size(imageIDs)
      path =  imageIndex.ImageLocation{imageIDs(i)};
      lastIndex = find(path == '\', 1, 'last');
      name = path(lastIndex+1:end-4);
        fprintf(fid, '%s\n', name);
    end
    fclose(fid);
    script = ['oxford\groundtruth\Test.exe oxford\groundtruth\', ...
        q_files(k).name(1:end-10), ...
        ' oxford\groundtruth\rank_list.txt',...
        ' >oxford\result\', image_name(6:end), '_result.txt']; %q_files(k).name(1:end-10)
    system(script);

end

r_files = dir(fullfile('oxford\result\', '*.txt'));
acc = [];
for i=1:length(r_files)
    file = ['oxford\result\' r_files(i).name];
    fid = fopen(file, 'r');
    acc = [acc fscanf(fid, '%f')];
    fclose(fid);
end
mean(acc)