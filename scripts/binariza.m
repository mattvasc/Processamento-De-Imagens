close all # fechar todas as janelas
clear # limpar a memória
clc # limpa a tela da área de trabalho
A=imread('../cacau_escuro.tif'); % Ler o arquivo
limiar=150;
figure, imshow(A); % mostrar a imagem
figure, imhist(A);
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
figure, imhist(B);
figure, imshow(B);