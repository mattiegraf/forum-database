
import praw
from random import choice, randint

reddit = praw.Reddit(client_id='cl4s6yCGNb8nlg',
                     client_secret='YFXXSpszqrrZcuXTGaNgysU_aDs',
                     user_agent='just parsing stuff')

emails = ["superfoody@live.com", 'deskrage@gmail.com', 'mad@yahoo.ca', 'vybaby@gmail.com', 
'json@hotmail.com', 'deskrage@gmail.com', 'snowstorm@outlook.com', 'json@hotmail.com', 
'mad@yahoo.ca', 'itsdatboi@gmail.com']


threadtext = "" # threads for the thread god
replytext = ""  # replies for the reply throne
tnum = 6


conversion = {
    'Food':'cooking',
    'Movies/Television':'truefilm',
    'Sports':'sportsbook',
    'Gaming':'games',
    'Music':'letstalkmusic'
}

for key, value in conversion.items():
    threadtext += "\n"

    # Gen titles and replies
    for submission in reddit.subreddit(value).top('all', limit=10):

        # thanks jason
        if tnum == 17:
            tnum += 1

        month = randint(1,6)
        if month <= 5:
            threadDay = randint(1,28)
        else:
            threadDay = randint(1,15)
        date = "2018-" + str(month) + "-" + str(threadDay)

        email = choice(emails)
        threadBody = submission.selftext[:100].replace('\n',' ')
        threadBody = threadBody.replace("'","").replace('"','')
        title = submission.title[:45].replace("'","").replace('"','')

        threadout = "insert into thread values('"+key+"',"+str(tnum)+",'"+title+"','"+threadBody+"','"+date+"', '"+email+"');"

        threadtext += threadout + "\n"


        cnum = 5

        for comment in submission.comments[:10]:
            if comment.body == "[deleted]" or comment.body == "[removed]":
                continue

            cbody = comment.body[:100].replace("'","").replace('"','').replace("\n",'')
            cday = randint(threadDay,28)
            cdate = "2018-"+str(month)+"-"+str(cday)

            commentout = "insert into reply values("+str(cnum)+","+str(tnum)+", '"+key+"','"+cbody+"','"+cdate+"','"+choice(emails)+"');"
            replytext += commentout + "\n"

            cnum += 1

        replytext += "\n"
        tnum += 1



with open("threadTitlesOutput.txt", 'w') as f:
    f.write(threadtext)

with open("threadRepliesOutput.txt", 'w') as f:
    f.write(replytext)
