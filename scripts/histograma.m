pkg load image
close all
clc
IMAGEM = imread("../laranjas.bmp");
figure, imshow(IMAGEM);
title("Imagem Original");

#Histograma da imagem:
figure, imhist(IMAGEM);
title("Histograma da imagem 'original'");


#Mostrando a imagem binaria
figure, im2bw(IMAGEM, 0.3);
title("Mostrando a imagem binaria");

#figure, CINZA;
CINZA =  rgb2gray(IMAGEM);
figure, imshow(CINZA);

title("Imagem em escala de cinza");
#Histograma da imagem binaria
figure, imhist(im2bw(IMAGEM, 0.3));
title("Histograma da imagem binaria");

