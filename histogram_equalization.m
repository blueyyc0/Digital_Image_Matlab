%��ɫͼ���ֱ��ͼ���⻯����ͨ��
clear all  
I=imread('C:\Users\Administrator\desktop\images\lena.jpg');                 %�����ɫͼ���ļ�  
imshow(I)                                  %��ʾ����   
title('����Ĳ�ɫͼ��')  
I_gray = rgb2gray(I); %�ҶȻ�������ݴ�������  
imwrite(I_gray,'1_gray.bmp'); %����Ҷ�ͼ��  
figure,imshow(I_gray);  
title('�Ҷ�ͼ')  

[height,width]=size(I_gray);  %����ͼ��ߴ����  
p=zeros(1,256);                            %Ԥ������ŻҶȳ��ָ��ʵ�����  
for i=1:height  
    for j=1:width  
     p(I_gray(i,j) + 1) = p(I_gray(i,j) + 1)  + 1;  %��Ӧ�Ҷ�ֵ���ص���������һ 
    end  
end  
%%����Ҷȷֲ��ܶ�
s=zeros(1,256);  
s(1)=p(1);  
for i=2:256  
     s(i)=p(i) + s(i-1); %ͳ��ͼ����<ÿ���Ҷȼ����ص��ۻ�������s(i):0,1,```,i-1  
end  
  
for i=1:256  
    s(i) = s(i)*256/(width*height); %��Ҷ�ӳ�亯��  
    if s(i) > 256  
        s(i) = 256;  
    end  
end  
  
%ͼ����⻯  
I_equal = I;  
for i=1:height  
    for j=1:width  
     I_equal(i,j) = s( I(i,j) + 1);  
    end  
end  
figure,imshow(I_equal)                           %��ʾ���⻯���ͼ��   
title('���⻯��ͼ��')  
imwrite(I_equal,'1_equal.bmp'); 