% Cleaning.
clc;
clearvars;
close all;

% Slot initial variables.
initCards = [12 12];

% Card loop.
cards = initCards;
for i = 1:12
    deck = randi(2);
    cards(deck) = cards(deck) - 1;
    disp(cards);
end