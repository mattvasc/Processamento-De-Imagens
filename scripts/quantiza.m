close all % fechar todas as janelas
clear % limpar a memória
clc % limpa a tela da área de trabalho
A=imread('../cacau_escuro.tif'); % Ler o arquivo
maior_cinza=max(max(A));
qtd_niveis=2;
passo=round(maior_cinza/qtd_niveis);
figure, imshow(A); % mostrar a imagem
figure, imhist(A);
[lin col]=size(A); % obtém dimensões da imagem
for i=1:lin
  for j=1:col
    B(i,j)=round(A(i,j)/passo)*passo;
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
figure, imshow(B);