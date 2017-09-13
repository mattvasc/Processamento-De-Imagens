close all % fechar todas as janelas
clear % limpar a memória
clc
% limpa a tela da área de trabalho
A=imread('../moon.tif'); % Ler o arquivo
figure, imshow(A); % mostrar a imagem original
figure, imhist(A); % mostrar o histograma original
B=histeq(A); % equalizar o histograma
figure, imshow(B);% mostrar a imagem equalizada
figure, imhist(B); % mostrar histograma equalizado