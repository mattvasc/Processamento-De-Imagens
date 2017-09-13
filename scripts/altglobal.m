close all # fechar todas as janelas
clear # limpar a memória
clc # limpa a tela da área de trabalho
A=imread('../cacau_escuro.tif'); # Ler o arquivo
cte_brilho=150;
figure, imshow(A); # mostrar a imagem
figure, imhist(A);
[lin col]=size(A); # obtém dimensões da imagem
for i=1:lin
    for j=1:col
        B(i,j)=A(i,j)+cte_brilho;
        if B(i,j)>255
            printf("Deu overflow!\n");
            B(i,j)=255;
        else
            printf("%d ", B(i,j));
            if B(i,j)<0
                B(i,j)=0;
            end
        end
    end
end
figure, imhist(B);
figure, imshow(B);

