%彩色图像的直方图均衡化，单通道
clear all  
I=imread('C:\Users\Administrator\desktop\images\lena.jpg');                 %读入彩色图像文件  
imshow(I)                                  %显示出来   
title('输入的彩色图像')  
I_gray = rgb2gray(I); %灰度化后的数据存入数组  
imwrite(I_gray,'1_gray.bmp'); %保存灰度图像  
figure,imshow(I_gray);  
title('灰度图')  

[height,width]=size(I_gray);  %测量图像尺寸参数  
p=zeros(1,256);                            %预创建存放灰度出现概率的向量  
for i=1:height  
    for j=1:width  
     p(I_gray(i,j) + 1) = p(I_gray(i,j) + 1)  + 1;  %对应灰度值像素点数量增加一 
    end  
end  
%%计算灰度分布密度
s=zeros(1,256);  
s(1)=p(1);  
for i=2:256  
     s(i)=p(i) + s(i-1); %统计图像中<每个灰度级像素的累积个数，s(i):0,1,```,i-1  
end  
  
for i=1:256  
    s(i) = s(i)*256/(width*height); %求灰度映射函数  
    if s(i) > 256  
        s(i) = 256;  
    end  
end  
  
%图像均衡化  
I_equal = I;  
for i=1:height  
    for j=1:width  
     I_equal(i,j) = s( I(i,j) + 1);  
    end  
end  
figure,imshow(I_equal)                           %显示均衡化后的图像   
title('均衡化后图像')  
imwrite(I_equal,'1_equal.bmp'); 