close all # fechar todas as janelas
clear # limpar a memória
clc # limpa a tela da área de trabalho
pkg load image;
A=imread('../imagens/cacau_escuro.tif'); % Ler o arquivo
limiar=48;
figure, imshow(A); % mostrar a imagem
title("figura original")
figure, imhist(A);
title("histograma original")
[lin col]=size(A); % obtém dimensões da imagem
B=A;
for i=1:lin
  for j=1:col
    if B(i,j)>=limiar
      B(i,j)=255;
    else
      B(i,j)=0;
    end
  end
end
T = subplot(2,1,1);
plot( imhist(B));
T2 = subplot(2,1,2);
plot( (B));
title("Imagem Binaria");


#figure, imshow(T);
#figure, imhist(B);
#title("histograma apos binarizar");
#figure, imshow(B);
#title("Imagem apos binarizar");