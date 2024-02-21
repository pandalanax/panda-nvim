import smtplib
import random
from itertools import combinations
import json

f = open('creds.json')
data = json.load(f)
mail = data["app_creds"]["mail"]
pw = data["app_creds"]["pw"]
app_pw = data["app_creds"]["app_pw"]

mails = data["participants"]

YEAR = 2024

def give(givers):
    res = {}
    
    recipients = list(givers)  # Make a copy

    for idx, giver in enumerate(givers):

        # Grab random person from the recipients
        recipient = random.choice(recipients)

        # Make sure we haven't either randomly chosen the same recipient and giver OR
        # ended up with only one un-gifted person in the list.
        if recipient == giver:
            return False
        else:
            # Remove this recipient from the pool
            recipients.remove(recipient)
            res[giver] = recipient

    return res

# Keep trying until we get through the set with no failures

results=give(mails.keys())
while not results:
    results = give(mails.keys())

"""
for picker,choosen in results.items():
    print(f"{picker} --> {choosen}")
"""

for picker,choosen in results.items():
    try:
        # create an email message with just a subject line,
        msg = f'''Subject: {YEAR}: Wichtel-O-Mat: \n\n You picked {choosen}!'''
        # set the 'from' address,
        fromaddr = mail
        # set the 'to' addresses,
        toaddrs = [mails[picker]]
        
        # setup the email server, go to google settings to enable smtp
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        # add my account login name and password,
        server.login(mail, app_pw)

        # send the email
        server.sendmail(fromaddr, toaddrs, msg)
        print(f'Message was send to {picker} !!')
        # disconnect from the server
        server.quit()
    except Exception as e:
        print(e)

