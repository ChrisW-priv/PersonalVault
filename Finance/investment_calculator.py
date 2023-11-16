saved_per_month = 1_000
saved_per_year = saved_per_month * 12
target_percent_above_inflation = 2
target_as_percent = target_percent_above_inflation / 100 
target_as_rate = target_as_percent + 1

age_of_start = 22
age_of_retire = 60
age_of_death = 95
target_salary = 8_000


def make_investment(cash, rate): return cash * rate


print(f"You decide to invest {saved_per_month} per month which is {saved_per_year} in a year")
print(f"You assume average {target_percent_above_inflation}% above inflation")
print(f"You decide to start investing at the age of {age_of_start}, retire at {age_of_retire} with salary equal to {target_salary}")
print(f"You assume to live no longer than {age_of_death}")


investment_log = []
investment_from_last_year = 0
for year in range(age_of_start, age_of_retire):
    cash_on_hand = 0
    cash_on_hand += saved_per_year
    cash_on_hand += investment_from_last_year

    new_investment = make_investment(cash_on_hand, target_as_rate)
    investment_from_last_year = new_investment
   
    total = cash_on_hand + new_investment
    investment_log.append(total)

print(f"After {age_of_retire - age_of_start} years of saving and investing you collect {investment_log[-1]:.2f}")
print(f"Assuming you keep investing this is how your retirement will go:")

money_remaing = investment_log[-1]
for year in range(age_of_retire, age_of_death):
    money_remaing -= target_salary * 12
    new_investment = make_investment(money_remaing, target_as_rate)
    money_remaing = new_investment
    print(f"After year {year} you are left with {money_remaing:.2f}")
    if money_remaing < target_salary * 12:
        print("Next year you will not be able to pay for your lifestyle!")
        exit()

print(f"After all this you are still left with some money!")

