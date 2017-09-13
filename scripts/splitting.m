close all % fechar todas as janelas
clear % limpar a memória
clc % limpa a tela da área de trabalho
pkg load image
A=imread('../cacau_escuro.tif'); % Ler o arquivo

maior_cinza=max(max(A));
menor_cinza=min(min(A));
limiar=(maior_cinza+menor_cinza)/2;
printf("Limiar escolhido foi: %d\n", limiar);
split=15;
split1 = menor_cinza;
split2 = 255 - maior_cinza;
figure, imshow(A); % mostrar a imagem
title("Imagem Original");

figure, imhist(A);
title("Histograma Original");
[lin col]=size(A); % obtém dimensões da imagem

for i=1:lin
  for j=1:col
    if A(i,j) <= limiar
      B(i,j)=A(i,j)- split1;
      C(i,j)=A(i,j)- split;
    else
      B(i,j)=A(i,j)+split2;
      C(i,j)=A(i,j)+ split;
    end
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
title("Histograma da Figura esplitada");
figure, imshow(B);
title("Figura esplitada");

figure, imhist(C);
title("Histograma da Figura esplitada 2");
figure, imshow(C);
title("Figura esplitada 2");