function BaiTap17()
 imgI = imread('cameraman.jpg');
 figure;
 imshow(imgI);
 points = detectSURFFeatures(imgI);
 hold on;
 subpoints = points.selectStrongest(20);
 plot(subpoints);
end

