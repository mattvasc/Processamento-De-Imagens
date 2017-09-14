close all # fechar todas as janelas
clear # limpar a memória
clc # limpar a tela da área de trabalho
pkg load image # carregar pacote de imagem 

# Carla Simões Gama 613843
# Mateus Vasconcelos 620580


#redistribui os niveis de cinza de uma imagem, bom para imagens com histograma concentrado.
function B = autoescala(A) 
  f_max = max(max(A)); 
  f_min = min(min(A)); 
  [lin col] = size(A); # obtém as dimensões da imagem
  for i=1:lin
      for j=1:col
          B(i,j) = (255/(f_max - f_min))*(A(i,j) - f_min); 
          if B(i,j) > 255
              B(i,j) = 255;
          else
              if B(i,j) < 0
                  B(i,j) = 0;
              end
          end
      end
  end
endfunction

# Converte a imagem para N niveis de Cinza.
function B = quantiza(A, qtd_niveis)
  maior_cinza = max(max(A));
  passo = round(maior_cinza/qtd_niveis);
  [lin col] = size(A); # obtém as dimensões da imagem
  for i=1:lin
    for j=1:col
      B(i,j) = round(A(i,j)/passo)*passo;
      if B(i,j) > 255
       B(i,j) = 255;
      else
       if B(i,j) < 0
        B(i,j) = 0;
        end
      end
    end
  end
endfunction

#Aumenta o constraste de uma imagem, a partir de um certo linear
function B = split(A,offset)
  maior_cinza = max(max(A));
  menor_cinza = min(min(A));
  limiar = (maior_cinza+menor_cinza)/2;  
  [lin col] = size(A); % obtém dimensões da imagem
  for i=1:lin
    for j=1:col
      if A(i,j) <= limiar
        B(i,j) = A(i,j) - offset;
      else
        B(i,j) = A(i,j) + offset;
      end
      if B(i,j) > 255
        B(i,j) = 255;
      else
        if B(i,j) < 0
          B(i,j) = 0;
        end
      end
    end
  end
endfunction

function B = equalizar_histograma(A)
  B = histeq(A);
endfunction

#criando variaveis:

[arroz,mapa_arroz] = imread('../imagens/rice.tif');
mamografia = imread('../imagens/mamografia.bmp');
[batatas, mapa_batatas] = imread('../imagens/batatas.tif');
solda = imread('../imagens/solda.bmp');
laranjas = rgb2gray(imread('../imagens/laranjas.bmp'));

arroz_autoescalada = autoescala([arroz, mapa_arroz]);
arroz_quantizada = quantiza(arroz, 3);
arroz_splitada = split(arroz, 30);
arroz_equalizada = equalizar_histograma(arroz);

mamografia_autoescalada = autoescala(mamografia);
mamografia_quantizada = quantiza(mamografia, 3);
mamografia_splitada = split(mamografia, 30);
mamografia_equalizada = equalizar_histograma(mamografia);

batatas_autoescalada = autoescala([batatas, mapa_batatas]);
batatas_quantizada = quantiza(batatas, 3);
batatas_splitada = split(batatas, 30);
batatas_equalizada = equalizar_histograma(batatas);

solda_autoescalada = autoescala(solda);
solda_quantizada = quantiza(solda, 3);
solda_splitada = split(solda, 30);
solda_equalizada = equalizar_histograma(solda);

laranjas_autoescalada = autoescala(laranjas);
laranjas_quantizada = quantiza(laranjas, 3);
laranjas_splitada = split(laranjas, 30);
laranjas_equalizada = equalizar_histograma(laranjas);



#Mostrando primeiramente a imagem original, logo em seguida:
#i.   Autoescala;
#ii.  Quantização;
#iii. Spliting;
#iv.  Equalização do histograma.

#   ARROZ
figure,
subplot(5,2,1),   imshow(arroz), title("Imagem original"),
subplot(5,2,2),   (imhist(arroz)), title("Histograma da imagem original");
subplot(5,2,3), imshow(arroz_autoescalada), title("Autoescalada");
subplot(5,2,4),  imhist(arroz_autoescalada), title("Histograma autoescala");
subplot(5,2,5), imshow(arroz_quantizada), title("Imagem Quantizada com 3 niveis de cinza"),
subplot(5,2,6), imhist(arroz_quantizada), title("Histograma quantizada");
subplot(5,2,7), imshow(arroz_splitada), title("Splitada");
subplot(5,2,8),  imhist(arroz_splitada), title("Histograma splitada");
subplot(5,2,9), imshow(arroz_equalizada), title("Imagem Quantizada com 3 niveis de cinza"),
subplot(5,2,10), imhist(arroz_equalizada), title("Histograma equalizada");

#   MAMOGRAFIA
figure,
subplot(5,2,1),   imshow(mamografia), title("Imagem original"),
subplot(5,2,2),   (imhist(mamografia)), title("Histograma da imagem original");
subplot(5,2,3), imshow(mamografia_autoescalada), title("Autoescalada");
subplot(5,2,4),  imhist(mamografia_autoescalada), title("Histograma autoescala");
subplot(5,2,5), imshow(mamografia_quantizada), title("Imagem Quantizada com 3 niveis de cinza"),
subplot(5,2,6), imhist(mamografia_quantizada), title("Histograma quantizada");
subplot(5,2,7), imshow(mamografia_splitada), title("Splitada");
subplot(5,2,8),  imhist(mamografia_splitada), title("Histograma splitada");
subplot(5,2,9), imshow(mamografia_equalizada), title("Imagem Quantizada com 3 niveis de cinza"),
subplot(5,2,10), imhist(mamografia_equalizada), title("Histograma equalizada");

#   BATATAS
figure,
subplot(5,2,1),   imshow(batatas), title("Imagem original"),
subplot(5,2,2),   (imhist(batatas)), title("Histograma da imagem original");
subplot(5,2,3), imshow(batatas_autoescalada), title("Autoescalada");
subplot(5,2,4),  imhist(batatas_autoescalada), title("Histograma autoescala");
subplot(5,2,5), imshow(batatas_quantizada), title("Imagem Quantizada com 3 niveis de cinza"),
subplot(5,2,6), imhist(batatas_quantizada), title("Histograma quantizada");
subplot(5,2,7), imshow(batatas_splitada), title("Splitada");
subplot(5,2,8),  imhist(batatas_splitada), title("Histograma splitada");
subplot(5,2,9), imshow(batatas_equalizada), title("Imagem Quantizada com 3 niveis de cinza"),
subplot(5,2,10), imhist(batatas_equalizada), title("Histograma equalizada");

#   SOLDAS
figure,
subplot(5,2,1),   imshow(solda), title("Imagem original"),
subplot(5,2,2),   (imhist(solda)), title("Histograma da imagem original");
subplot(5,2,3), imshow(solda_autoescalada), title("Autoescalada");
subplot(5,2,4),  imhist(solda_autoescalada), title("Histograma autoescala");
subplot(5,2,5), imshow(solda_quantizada), title("Imagem Quantizada com 3 niveis de cinza"),
subplot(5,2,6), imhist(solda_quantizada), title("Histograma quantizada");
subplot(5,2,7), imshow(solda_splitada), title("Splitada");
subplot(5,2,8),  imhist(solda_splitada), title("Histograma splitada");
subplot(5,2,9), imshow(solda_equalizada), title("Imagem Quantizada com 3 niveis de cinza"),
subplot(5,2,10), imhist(solda_equalizada), title("Histograma equalizada");

#   LARANJAS
figure,
subplot(5,2,1),   imshow(laranjas), title("Imagem original"),
subplot(5,2,2),   (imhist(laranjas)), title("Histograma da imagem original");
subplot(5,2,3), imshow(laranjas_autoescalada), title("Autoescalada");
subplot(5,2,4),  imhist(laranjas_autoescalada), title("Histograma autoescala");
subplot(5,2,5), imshow(laranjas_quantizada), title("Imagem Quantizada com 3 niveis de cinza"),
subplot(5,2,6), imhist(laranjas_quantizada), title("Histograma quantizada");
subplot(5,2,7), imshow(laranjas_splitada), title("Splitada");
subplot(5,2,8),  imhist(laranjas_splitada), title("Histograma splitada");
subplot(5,2,9), imshow(laranjas_equalizada), title("Imagem Quantizada com 3 niveis de cinza"),
subplot(5,2,10), imhist(laranjas_equalizada), title("Histograma equalizada");

# letra E, aplicando binarizaçao em todas as imagens

arroz = im2bw(arroz_splitada);
mamografia = im2bw(mamografia_autoescalada);
batatas = im2bw(batatas_autoescalada);
solda = im2bw(solda_autoescalada);
laranjas = im2bw(laranjas_quantizada);

figure,
subplot(3, 2, 1), imshow(arroz), title("im2bw no arroz splitting");
subplot(3, 2, 2), imshow(mamografia), title("im2bw na mamografia autoescalada");
subplot(3, 2, 3), imshow(batatas), title ("im2bw nas batatas autoescalada");
subplot(3, 2, 4), imshow(solda), title("im2bw na solda autoescalada");
subplot(3, 2, 5), imshow(laranjas), title("im2bw nas laranjas quantizada");