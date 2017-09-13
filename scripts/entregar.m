close all # fechar todas as janelas
clear # limpar a memória
clc # limpa a tela da área de trabalho
pkg load image; #carrega pacote de imagem 

[arroz,mapa_arroz]=imread('../imagens/rice.tif');
subplot(1,2,1),   imshow(arroz), title("arrozes");
subplot(1,2,2),   (imhist(arroz)), title("arrozes");

function autoescala
f_max=max(max(A)); # novidade !!!
f_min=min(min(A)); # novidade !!!
figure, subplot(imshow(A), imhist(A));
#figure, imshow(A); # mostrar a imagem
title("Imagem Original");
#figure, imhist(A);
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
endfunction


#Autoescala;
#ii. Quantização;
#iii. Spliting;
#iv. Equalização do histograma.