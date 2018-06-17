
from random import choice, randint

out = ""
emails = ['vybaby@gmail.com', 'mad@yahoo.ca', 'catdog@gmail.com', 'json@hotmail.com', 
'nabstua@gmail.com', 'superfoody@live.com', 'greenearth@yahoo.ca', 'snowstorm@outlook.com',
'itsdatboi@gmail.com', 'deskrage@gmail.com', 'nonadmin@gmail.com', 'admin@gmail.com']

mnum = 6

with open("trimmedmovielines.txt", 'r') as f:
    for line in f:
        strippedLine = line[line.rfind('+')+2 : min(len(line), 200) ].replace("'","").replace('"','').replace("\n",'')

        month = randint(1,6)
        if month <= 5:
            day = randint(1,28)
        else:
            day = randint(1,15)
        date = "2018-" + str(month) + "-" + str(day)

        sentEmail = choice(emails)
        while True:
            receivedEmail = choice(emails)
            if (receivedEmail != sentEmail):
                break


        out += "insert into message values("+str(mnum)+", '"+strippedLine+"', '"+date+"', '"+sentEmail+"', '"+receivedEmail+"');" + "\n"
        mnum += 1


with open("messageData.txt", 'w') as f:
    f.write(out)