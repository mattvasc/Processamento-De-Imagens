################################################
#redistribui os niveis de cinza de uma imagem, #
#bom para imagens com histograma concentrado.  #
################################################

close all # fechar todas as janelas
clear # limpar a memória
clc # limpa a tela da área de trabalho
A = imread('../imagens/moon.tif'); % Ler o arquivo
cte_brilho=50;
f_max=max(max(A)); # novidade !!!
f_min=min(min(A)); # novidade !!!
figure, subplot(imshow(A), imhist(A));
figure, imshow(A); # mostrar a imagem
title("Imagem Original");
figure, imhist(A);
title("Histograma da Imagem Original");
[lin col]=size(A); # obtém dimensões da imagem
for i=1:lin
    for j=1:col
        B(i,j)=(255/(f_max-f_min))*(A(i,j)-f_min); # novidade !!!
        if B(i,j)>255
            B(i,j)=255;
        else
            if B(i,j)<0
                B(i,j)=0;
            end
        end
    end
end
figure, imhist(B);
title("Histograma da imagem autoescalada");
figure, imshow(B);
title("Imagem autoescalada");