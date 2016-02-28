% Cleaning.
clc;
clearvars;
close all;

% Params.
N = 1000;
deckSize = 12;
cost = 3;

% Slot initial variables.
initCards = [deckSize deckSize];
cash = 0;
cashHistory = zeros(N*deckSize, 1);
smartCash = 0;
smartCashHistory = zeros(N*deckSize, 1);

% Game iterations.
round = 0;
for j = 1:N
    % Card loop.
    cards = initCards;
    for i = 1:deckSize
        round = round + 1;
        % Pay for iteration.
        cash = cash - cost;
        smartCash = smartCash - cost;
        % Pick card.
        card = randi(sum(cards));
        deck = 1 + (card > cards(1));
        % Guess card randomly.
        guess = randi(2);
        cash = cash + 2*cost*(deck == guess);
        cashHistory(round) = cash;
        % Guess card in a smart way.
        guess = 1 + (cards(2) > cards(1));
        smartCash = smartCash + 2*cost*(deck == guess);
        smartCashHistory(round) = smartCash;
        % Remove card.
        cards(deck) = cards(deck) - 1;
    end
end

% Plotting.
hold on;
plot(cashHistory);
plot(smartCashHistory);
hold off;