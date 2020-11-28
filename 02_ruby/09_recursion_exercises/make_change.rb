def greedy_make_change(amount, coins = [25, 10, 5, 1])
    return [] if amount == 0
    change = []
    i = 0
    i += 1 while coins[i] > amount
    coin = coins[i]
    change << coin
    change += greedy_make_change(amount - coin, coins)
    change
end

p greedy_make_change(39) # [25, 10, 1, 1, 1, 1]