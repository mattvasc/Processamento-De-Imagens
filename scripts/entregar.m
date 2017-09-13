close all # fechar todas as janelas
clear # limpar a memória
clc # limpa a tela da área de trabalho
pkg load image; #carrega pacote de imagem 


#redistribui os niveis de cinza de uma imagem, bom para imagens com histograma concentrado.
function B = autoescala(A) 
  f_max=max(max(A)); # novidade !!! 
  f_min=min(min(A)); # novidade !!!
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

# Converte a imagem para N niveis de Cinza.
function B = quantiza(A, qtd_niveis)
  maior_cinza=max(max(A));
  passo=round(maior_cinza/qtd_niveis);
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
endfunction

#Aumenta o constraste de uma imagem, a partir de um certo linear
function B = split(A,offset)
  maior_cinza=max(max(A));
  menor_cinza=min(min(A));
  limiar=(maior_cinza+menor_cinza)/2;  
  [lin col]=size(A); % obtém dimensões da imagem
  for i=1:lin
    for j=1:col
      if A(i,j) <= limiar
        B(i,j)=A(i,j) - offset;
      else
        B(i,j)=A(i,j) + offset;
      end
      if B(i,j)>255
        B(i,j)=255;
      else
        if B(i,j)<0
          B(i,j) = 0;
        end
      end
    end
  end
endfunction
#criando variaveis:
[arroz,mapa_arroz]=imread('../imagens/rice.tif');
autoescalada = autoescala([arroz, mapa_arroz]);
quantizada = quantiza(arroz, 3);
splitada = split(arroz, 30);
#equalizada = equaliza(arroz);
#Mostrando na tela:
figure,
subplot(1,2,1),   imshow(arroz), title("Imagem Original"),
subplot(1,2,2),   (imhist(arroz)), title("Histograma da Original");

figure,
subplot(2,2,1), imshow(autoescalada), title("Autoescalada");
subplot(2,2,2),  imhist(autoescalada), title("Histograma da autoescala");
subplot(2,2,3), imshow(quantizada), title("Imagem Quantizada com 3 niveis de cinza"),
subplot(2,2,4), imhist(quantizada), title("Histograma dela Quantizada");

figure,
subplot(2,2,1), imshow(splitada), title("Splitada");
subplot(2,2,2),  imhist(splitada), title("Histograma dela splitada");
#subplot(2,2,3), imshow(equalizada), title("Imagem Quantizada com 3 niveis de cinza"),
#subplot(2,2,4), imhist(equalizada), title("Histograma dela Equalizada");

#i.   Autoescala;
#ii.  Quantização;
#iii. Spliting;
#iv.  Equalização do histograma.