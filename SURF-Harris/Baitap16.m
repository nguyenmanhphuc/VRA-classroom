function Baitap16()
    imgI=imread('cameraman.tif');
%     imgI=rgb2gray(imgI);
    imwrite(imgI,'cameraman.jpg');
    imgI = imrotate(imgI,30);
    imwrite(imgI,'cameraman30.jpg');

end
		