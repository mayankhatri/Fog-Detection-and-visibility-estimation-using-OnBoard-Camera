s="feature";
labels=[];
for m = 1:16129
    labels=[labels,strcat(s, num2str(m))];
end
CELL2CSV('Output.csv', , separator, excelYear, decimal)
%fid = fopen('Output.csv','wt');
%if fid>0
%     for k=1:16129
%         fprintf(fid,'%s,%f\n',labels(k));
%     end
%     fclose(fid);
%end  
out = zeros(66,16130,2);
for k = 1:66
	% Create an image filename, and read it in to a variable called imageData.
	if k<10
        %fogFileName = strcat('C:\Users\Mkiit\Downloads\frida3\U080-L00000', num2str(k), '.png');
        clearFileName = strcat('C:\Users\Mkiit\Downloads\frida3\RIma-00000', num2str(k), '.png');
    else 
        %fogFileName = strcat('C:\Users\Mkiit\Downloads\frida3\U080-L0000', num2str(k), '.png');
        clearFileName = strcat('C:\Users\Mkiit\Downloads\frida3\RIma-0000', num2str(k), '.png');
    end    
	if exist(clearFileName, 'file')

        i=imread(clearFileName);
        %i1=imread(fogFileName);
        i=rgb2gray(i);
        %i1=rgb2gray(i1);
        i=imresize(i,[256,256]);
        %i1=imresize(i1,[256,256]);
        %min=min(min(i));
        %max=max(max(i));
        y=mat2gray(i);
        %y1=mat2gray(i1);
        %y=im2double(i);
        %imshow(i);
        %figure,imshow(y);
        [r,c]=size(y);
        w=window2(r,c,@hann);
        f=fft2(y.*w);
        %[r1,c1]=size(y1);
        %w1=window2(r1,c1,@hann);
        %f1=fft2(y1.*w1);
        j=log10(abs(fftshift(f)).^2);
        %j1=log10(abs(fftshift(f1)).^2);
        mu=mean2(j);
        sigmainv=1/(std2(j));
        avg=ones(256,256);
        avg=mu.*avg;
        output=sigmainv.*(j-avg);
        %mu1=mean2(j1);
        %sigmainv1=1/(std2(j1));
        %avg1=ones(256,256);
        %avg1=mu1.*avg1;
        %output1=sigmainv1.*(j1-avg1);
        for i = 65:191
        for j = 65:191    
        out(k,(i-65)*127+j-64,1)=output(i,j);
        %out(k,(i-65)*127+j-64,2)=output1(i,j);
        end
        end
        out(k,(i-65)*127+j-64,1)=0;
        out(k,(i-65)*127+j-64,2)=1;
	else
		fprintf('File %s does not exist.\n', fogFileName);
    end
end
dlmwrite('Output.csv',out(:,:,1),'delimiter',',','-append');
%dlmwrite('Output.csv',out(:,:,2),'delimiter',',','-append');

