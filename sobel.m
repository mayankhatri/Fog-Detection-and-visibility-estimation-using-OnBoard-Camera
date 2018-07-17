i=imread('C:\Users\Siddhartha\Desktop\nfog1.jpg');
i=rgb2gray(i);
i=imresize(i,[256,256]);
c=edge(I,'Sobel',0.1);
imshow(c);