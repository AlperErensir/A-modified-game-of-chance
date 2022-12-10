clear all, clc
money = 100000;
count = 0;
total_loss = 0;
number_of_games = 100;   % ## Adjustable parameter ##
gamble_amount = 1000;    % ## Adjustable parameter ##
t = 1:number_of_games;
xx = 0; j = 1;  k = 0; n=0;
negative_value_count = 0;
zero_value_count = 0;

while k<number_of_games

    for i = 1:number_of_games

        variable = rand;

        if variable < 0.50                                 %Winning case
            money = money + gamble_amount + total_loss;     %
            count = 0;                                      %
            total_loss = 0;                                 %
        else                                                %Losing case
            money = money - gamble_amount - total_loss;     %
            count = count + 1;                              %
            total_loss = total_loss + count*gamble_amount;  %
        end

        if money == 0 && money < 0                          %Case of bankrupt
            i = number_of_games;
        end

        if k<number_of_games                                %Playing the game with different amount of times
            if i==number_of_games
                final_money_matrix(1,j) = money;
                j = j + 1;
                i = 0;
                k = k + 1;
                money = 100000;
            end
        end

    end
end

plot(t,final_money_matrix) 
xlabel('Number of plays'), ylabel('Money')


for m = 1:number_of_games
    xx = xx + final_money_matrix(1,m);
end

mean = xx/number_of_games;
mean

for h = 1:number_of_games
    if final_money_matrix(1,h) < 0
        negative_value_count = negative_value_count + 1;
    end
end

for n = 1:number_of_games
    if final_money_matrix(1,n) == 0
        zero_value_count = zero_value_count + 1;
    end
end

negative_value_count
zero_value_count






