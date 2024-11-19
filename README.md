# HTF24 - Are there clouds among the stars?
Welcome aboard Starship_58!  
You are about to embark on an epic journey, where each team pilots their spacecraft and explores new galaxies.  
Through the AWS Cloud, we remain in constant contact with the Mothership.  
We integrate various applications to gather information and map a detailed overview of the universe.  
Use advanced technologies and contribute to groundbreaking space research.  
Starship_58 is waiting for you to make history!

## Requirements
### Install AWS CLI
In order to be able to communicate with the AWS cloud, you need to install its CLI.  
The installation file can be found here:
- [Windows](https://awscli.amazonaws.com/AWSCLIV2.msi)
- [MacOS](https://awscli.amazonaws.com/AWSCLIV2.pkg)
- [Linux](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install)

#### Configure AWS CLI
You'll need to login using your credentials in order to be able to use the AWS CLI.  
The credentials have beent sent to your school email.  
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html

### Install AWS SAM
The AWS SAM (Serverless Application Model) makes it easier to create and manage serverless applications in the AWS cloud.  
This is not a necessity, but can improve the speed and quality of building your applications.

The installation guide can be found here:
- [Windows](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-windows.html)
- [MacOS](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-mac.html)
- [Linux](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-linux.html)

### Install NodeJS and NPM
[NodeJS Download](https://nodejs.org/en/download/)  

## Getting started
### Initial Setup
In order to be able to deploy your project to AWS, you'll need to set a few parameters.

#### deployStudent.sh and deployStudent.ps1
Replace **[TEAMNAME]** with the name of your team excluding spaces.  
Example: "Hack Tuah" becomes "HackTuah".

List:
- AyhanYuseinov
- ByteMe
- HackTuah
- HackTuah2
- PythonBeesten
- TheCloudonaut
- TheImmigrants
- ThicNThin

#### cfn-students.yml
At the top of the files, there is a parameter called "TeamName", enter your team name in the *Default* attribute (excluding spaces).  
Example: "Hack Tuah" becomes "HackTuah".  

Please also do not forget to create the other API keys and such and add them to the Parameters in this file.

### General Notice
Because this is a hackathon, keep in mind that we are using free tiers of many of the tools that you will be integrating with.  
This means that ratelimits are often applied if you send requests too often.  
It is advised to be careful with loops or short intervals on your scheduled requests.  
It is also smart that each teammember creates accounts on these tools and already saves credentials, so you can swap easily if ratelimits have been hit.  
This way you will lose the least amount of time during the hackathon.

### Levels
#### Level 1
The mothership sends morse code to its fleet because it's harder to intercept, and more lightweight of a message to transfer over great distances.  
The mothership sends this to each spaceship using [Amazon EventBridge](https://aws.amazon.com/eventbridge/).  
Find a way to decode the message and send it to your spaceship team.  
Your team internally communicates over Discord only.  
Set up a channel and publish the decoded message over there so anyone in your team can see it.

#### Level 2
Before you launch from Earth, you have to report back to us, the Mothership.  
Before you are allowed to launch, we need to know what location you are launching from and where you will be landing once the mission has been completed.  
Luckily we have a partnership with **Elon Musk** and he's kindly letting us use his [SpaceX](https://www.spacex.com) launchpads and landpads.  
All of their launch- and landpads are available to us and you can choose the one you deem most suitable.  
Use their [GraphQL Endpoint](https://studio.apollographql.com/public/SpaceX-pxxbxen/variant/current/home) to choose yours, and inform the Mothership befhorehand. (Informing the Mothership means sending your message to the SQS queue already defined in the example code :) )
  
Please keep in mind that the Mothership is only able to read messages that are sent in the following JSON format:
```json
{
    "SpaceshipName" : "HackTuah",
    "Launchpad": {
        "ID": "djkhdkfjshkfhdsk",
        "Name": "Launchpad 1"
    },
    "Landpad": {
        "ID": "dadadasdas",
        "Name": "Landpad 7"
    }
}
```

**Note**: Do you know what GraphQL is and why it is commonly used? Try to retrieve the information of both the launch- and landpad with 1 request.

#### Level 3
Before your departure, you need to take the weather in space into account.  
Otherwise, your safe passage could become compromised, and we don't want to lose any teammembers on the way.  
Your biggest enemy are *Geomagnetic Storms*, so you need to check the forecasts in advance.  
Luckily the *Space Weather Prediction Center (NOAA)* continuously monitors a whole set of data and compresses it into 1 simple file per day.  
Since we still need to learn how to interpret this file, we want to receive those from you and save them on the Mothership in order to study them.  
Use a [Lambda](https://aws.amazon.com/lambda/) function to go fetch the latest file on the [Space Weather Prediction Center FTP server](ftp.swpc.noaa.gov/pub/forecasts/geomag_forecast).  
1 file per day will be enough.  
Find a way to save this file to the Motherships' [S3 Bucket](https://aws.amazon.com/pm/serv-s3/).

**Note**: Don't forget to rename the file to the date of the file + your spaceship teamname.

#### Level 4
Because we are all so far apart from eachother, it is important to keep the teamspirit alive and have some fun from time to time.  
Because we are all greate NASA fans, the team wants to see the NASA Picture of the Day in their mailbox first thing in the morning.  
The documentation of their API can be read [here](https://api.nasa.gov/).  
Make sure to request your own credentials and not use the demo credentials as this will get ratelimited after a while.  
Make the API call to NASA to get the picture, download the file from the endpoint returned in the response, and send an email to an email address you created on TempMail.

**Note**: There is a great chance that your account or domain will not get verified in time, meaning mails will never get delivered. For the sake of the Hackathon, you are allowed to create a temporary email address using [TempMail](https://temp-mail.org/en) and send emails to that address.

#### Level 5
As said before, we're still learning about spacial weather as it is quite a bit more complex than your average weather report.  
We've started using the power of AI to help us interpret the files.  
Pick up one of the files you saved in the S3 Bucket in Level 3, read its contents and use [Gemini](https://ai.google.dev/gemini-api/docs/quickstart?lang=rest) to tell us what it means and if it is safe for passage.  
If the AI determines that it is in fact safe to travel, create a ticket with your TeamName and the date in [Clickup](https://clickup.com) in a custom column called "Ready for departure", otherwise create a ticket with the same information in the column "Not ready for departure".  
This way, we are able to create a centralized overview and history of what teams were fully ready for take-off, with the ideal weather conditions.

## Best Practices
### Local development (Only if Docker is installed)
```bash
# Install required NPM packages
cd src/fn-challenge-1
npm install
cd ../fn-challenge-2
npm install
cd ../fn-challenge-3
npm install
cd ../fn-challenge-4
npm install
cd ../fn-challenge-5
npm install
cd ../..

# Execute function locally (only if Docker is installed)
sam local invoke Challenge1Lambda --event ./payloads/ExampleMessage.json -t cfn-students.yaml

# Deploy Project to AWS using bash
bash deployStudent.sh

# Deploy Project to AWS using PowerShell
.\deployStudent.ps1
```
