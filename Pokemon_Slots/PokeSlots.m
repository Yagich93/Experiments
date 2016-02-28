% Cleaning.
clc;
clearvars;
close all;

% Params.
N = 10000;
deckSize = 12;
cost = 3;

% Slot initial variables.
initCards = [deckSize deckSize];
cash = 0;
cashHistory = zeros(N*deckSize, 1);

% Game iterations.
round = 0;
for j = 1:N
    % Card loop.
    cards = initCards;
    for i = 1:deckSize
        round = round + 1;
        % Pay for iteration.
        cash = cash - cost;
        % Pick card.
        deck = randi(2);
        cards(deck) = cards(deck) - 1;
        % Guess card.
        guess = randi(2);
        cash = cash + 2*cost*(deck == guess);
        cashHistory(round) = cash;
    end
end

% Plotting.
plot(cashHistory);