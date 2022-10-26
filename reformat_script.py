x = """być – sein

iść – gehen

mieć – haben

grać – spielen

nazywać się – heißen

pracować – arbeiten

pisać – schreiben

uczyć się – lernen

widzieć – sehen

czytać – lesen

interesować – interessieren

dawać – geben

kosztować – kosten

lubić, kochać – lieben

słyszeć – hören

szukać – suchen

znajdować – finden

jechać, prowadzić – fahren

żyć, mieszkać – leben

potrzebować – brauchen"""

lines = x.split('\n\n')
print("|pol.|niem/|")
print("|-|-|")

for line in lines:
    a,b = line.split(" – ")
    print(f"|{a}|{b}|")

