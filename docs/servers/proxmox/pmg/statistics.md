# Statistics

The statistics are available in the web interface under *Statistics*. It will show you graphs for email filtered by Year, Month, Day. There are graphs for total mail count (incoming and outgoing), incoming mail which will break down all mail, junk mail, and bounces. The same charts are available for outgoing mail. 

Other items include a percentage of incoming vs outgoing mail, virus outbreaks, average mail processing time, and volume of incoming mail traffic and outgoing mail traffic.

## Spam Scores

This section will break down the percentage and numbers of emails received by spam score. Score 0 is not spam, score 3 are messages that are delivered but tagged as spam, score 5 is the threshold for spam that is typically discarded or quarantined. Score >= 10 is the worst spam and you should never see it in your inboxes. 

It's normal to see a wide range of spam scores. You may notice that some scores are higher than others. This is because the spam filter is constantly learning and adapting to new spam.

## Virus Charts

This section will show you any details about messages that contained viruses. 

## Hourly Distribution

These graphs will break down the number of messages received by hour. This is useful to see when your mail server is the busiest. You can also see the number of outgoing messages by hour.

## Postscreen

This graph shows the number of messages that were rejected by postscreen tests. The graph will show messages rejected by RBL and by `pregreet`. For more information on Postscreen tests, see the [Postfix Postscreen README](https://www.postfix.org/POSTSCREEN_README.html)

## Domain

This section is split between incoming and outgoing. Each tab shows a list of domains that received email for a selected time frame with stats for traffic amount, counts for mail flow, how many virused detected, and how many emails classified as spam.

## Sender

The sender panel contains a list of email addresses that have sent mail in the selected timeframe with counts. If you select an email address, you will see a detailed list of recipients.

## Receiver

Similar to [sender panel](#sender), this contains a list of email addresses that received external emails with detailed counts.

## Contact

This panel contains a list of external recipients that received email from this PMG from the external port.
