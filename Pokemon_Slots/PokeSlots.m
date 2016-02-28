% Cleaning.
clc;
clearvars;
close all;

% Slot initial variables.
initCards = [12 12];
cash = 0;

% Card loop.
cards = initCards;
for i = 1:12
    % Pay for iteration.
    cash = cash - 3;
    % Pick card.
    deck = randi(2);
    cards(deck) = cards(deck) - 1;
    % Guess card.
    guess = randi(2);
    cash = cash + 6*(deck == guess);
    % Display stats.
    disp(cash);
end