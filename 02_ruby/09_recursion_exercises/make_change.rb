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

def make_better_change(amount, coins = [25, 10, 5, 1])
    return [] if amount == 0
    return nil if coins.length == 0

    change = []

    i = 0
    i += 1 while coins[i] > amount
    coin = coins[i]

    change << coin

    continuation = make_better_change(amount - coin, coins[i..-1])
    alternative = make_better_change(amount, coins[1..-1])

    if alternative && alternative.length < continuation.length
        alternative
    else
        change + continuation
    end
end

p make_better_change(14, [10, 7, 1]) # [7, 7]
p make_better_change(24, [10,7,1]) # [10, 7, 7]