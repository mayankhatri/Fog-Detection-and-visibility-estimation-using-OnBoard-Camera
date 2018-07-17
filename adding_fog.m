for k = 1:66
	if k<10
        clearFileName = strcat('C:\Users\Mkiit\Downloads\frida3\LIma-00000', num2str(k), '.png');
    else
        clearFileName = strcat('C:\Users\Mkiit\Downloads\frida3\LIma-0000', num2str(k), '.png');
    end    
	if exist(clearFileName, 'file')

        grayImage=imread(clearFileName);
        grayImage=rgb2gray(grayImage);
        grayImage=imresize(grayImage,[256,256]);
        maxGL = max(grayImage(:));
        disp(size(grayImage));
        hazyImage = uint8(double(grayImage) + 240 - maxGL + 10 * rand(size(256,256)));
        figure;
        subplot(1, 2, 1);
        imshow(grayImage);
        subplot(1, 2, 2);
        imshow(hazyImage);
        
	else
		fprintf('File %s does not exist.\n', clearFileName);
    end
end







