# Troubleshooting Email

Email is notoriously difficult to troubleshoot. This guide will help you troubleshoot common issues with email that you may encounter as well as provide some general tips for troubleshooting email.

!!! note
    *Before contacting support*, please read this guide and try to troubleshoot the issue yourself. If you are unable to resolve the issue or you are unsure of how to resolve the issue, you can contact our support team for assistance. Please provide as much information as possible such as full email messages (including headers), error messages, log files, and any other information that you think may be helpful.

## Troubleshooting Tools

You can use the following tools to troubleshoot email issues as well as get diagnostics. 

| Tool | Description |
| --- | --- |
| [MXToolbox](https://mxtoolbox.com/) | MXToolbox is a free tool that can be used to check DNS records, blacklist status, and more. |
| [Mail-Tester](https://www.mail-tester.com/) | Mail-Tester is a free tool that can be used to test the spam score of an email. |
| [Email Header Analyzer](https://toolbox.googleapps.com/apps/messageheader/) | Google's Email Header Analyzer can be used to analyze the headers of an email. |
| [Exchange Connectivity Tester](https://testconnectivity.microsoft.com/) | Microsoft's Exchange Connectivity Tester can be used to test Exchange email servers. |

Additionally, you can use the following tools to test SMTP connections.

| Tool | Description |
| --- | --- |
| [Telnet](https://en.wikipedia.org/wiki/Telnet) | Telnet is a command-line tool that can be used to test SMTP connections. |
| [PuTTY](https://www.putty.org/) | PuTTY is a graphical tool that can be used to test SMTP connections. |

Sometimes issues can be caused by DNS and missing or incorrect DNS records. You can use the following tools to check DNS records.

| Tool | Description |
| --- | --- |
| [dig](https://en.wikipedia.org/wiki/Dig_(command)) | `dig` is a command-line tool that can be used to check DNS records. |
| [nslookup](https://en.wikipedia.org/wiki/Nslookup) | `nslookup` is a command-line tool that can be used to check DNS records. |
| [MXToolbox](https://mxtoolbox.com/) | MXToolbox is a free tool that can be used to check DNS records, blacklist status, and more. |
| [DNS Checker](https://dnschecker.org/) | DNS Checker is a free tool that can be used to check DNS records. |
| [IntoDNS](https://intodns.com/) | IntoDNS is a free tool that can be used to check DNS records. |
| [What's My DNS](https://www.whatsmydns.net/) | What's My DNS is a free tool that can be used to check DNS records. |

### MXToolbox

MXToolbox is a free tool that can be used to check DNS records, blacklist status, and more. MXToolbox is easy to use by inserting your domain name in the search box and clicking the "MX Lookup" button. 

MXToolbox will then display all MX records for your domain. If you see a MX record that is not supposed to be there, you can remove it by contacting your DNS provider. It will also run some basic tests for SPF, DKIM, and DMARC records.

### Mail-Tester

Mail-Tester is a service that you can use to check the "spammyness" of an email. Mail-Tester will give you a score out of 10 and provide you with a list of things that you can do to improve your score. When you visit Mail-Tester, you will be given a unique email address that you can send an email to. Mail-Tester will then analyze the email and give you a score.

### IntoDNS

IntoDNS is a free tool that can be used to check DNS records. IntoDNS is easy to use by inserting your domain name in the search box and clicking the "Report" button. You will be given a very detailed DNS report that will highlight any issues with your DNS records.

## Common Issues

### Email is not being received

If you are not receiving email, there are a few things that you can check. First, you should check your MX records to make sure that they are correct. You can use MXToolbox to check your MX records. If your MX records are correct, you should check your spam folder. If you are still not receiving email, you can contact our support team for assistance. We will be able to check our mail logs to see if the email was received by our mail servers (if you are using cPanel email) or if the email was received by our spam filter (if you are using professional email). If you're using your own mail server, you can check your mail logs to see if the email was received by your mail server.

### Email is being marked as spam

If your email is being marked as spam, there are a few things that you can check. First, you should check your SPF, DKIM, and DMARC records. You can use MXToolbox to check your SPF, DKIM, and DMARC records. If your SPF, DKIM, and DMARC records are correct, you should check your spam score. You can use Mail-Tester to check your spam score. If your spam score is high, you should follow the recommendations given by Mail-Tester to lower your spam score. 

You can use MXToolbox's Blacklist Check to see if you are on any blacklists. If you are on a blacklist, you should follow the instructions given by the blacklist provider to get removed from the blacklist. In some cases, you may need to contact support as the blacklist provider may require us to contact them to get you removed from the blacklist.

!!! warning "New IPs are typically untrusted"
    If you just setup an email server and start sending email, especially to larger email providers like Gmail, Yahoo, GMX, Outlook.com, etc., you may find that your email is being marked as spam, delayed, or rejected. This is because your IP address is new or hasn't been seen in a long time and is untrusted. You will need to build a reputation for your IP address by sending email that is not considered spam. This can take some time, but you can speed up the process by following the recommendations given by Mail-Tester.

!!! warning "New IP is on a blacklist for spam"
    If you just setup an email server and you find that your server's IP is already listed on a blacklist, please carefully read the next section. We actively monitor our IP space for listings and will attempt to remove IPs from lists as soon as possible. However, some lists require us to perform actions *from the listed IP* and those actions are easier to be performed by you. If you are listed on a blacklist, please contact our support team for assistance.

### Server IP is on a blocklist (blacklist)

Sometimes when you order a new server, you may find that the server's IP is already listed on a blocklist. We assign IP addresses from our pool and sometimes we need to get a block of IPs from our network partners. It may be possible that a customer with a different provider was assigned the IP address before we were and they got the IP blocklisted. **First, contact our support team for assistance.** We may be able to assign a different address for free. If we are unable to assign a different address or you would prefer not to switch IPs, we will actively work with you to get the IP removed from the blacklist. Some lists require us to perform actions *from the listed IP* and those actions are easier to be performed by you, such as sending an email to the list provider or hitting a URL from the IP. Other lists will require our network team to work with the list provider. 

Removing an IP from a blocklist can be a time consuming process! It can take anywhere from a few hours to a few weeks to get an IP removed from a blocklist. Some blocklist operators are easier to work with than others. We will do our best to get the IP removed as quickly as possible.

Unfortunately, there are some blocklists we cannot get IPs removed from. Specifically these are UCEProtect and MIPS. These blocklists are very aggressive and will block entire IP ranges.

??? note "UCEProtect"
    UCEProtect is a blocklist that will block entire IP ranges and demand money to remove them. Further, the operator of UCEProtect has some offensive views and has been known to harass people who speak out against them. We consider UCEProtect to be a scam and we do not recognize them. If you find that your IP is listed on UCEProtect, please contact the person or company that you are trying to send email to and ask them to bypass your IP and strongly urge them to stop using UCEProtect.

??? note "MIPS"
    MIPS has a very *unique* view about email. They believe that email should *never* be used for marketing communication such as newsletters, promotional emails, surveys, etc. even if you agree to receive them through a double opt-in process. Like UCEProtect, they will block entire IP ranges if they find that a single IP in the range is sending marketing emails. When we try to work with MIPS, they get very aggressive and condescending and refuse to remove IPs from their blocklist. MIPS is managed by the company who provides the MagicSpam filtering product that some web hosting providers will use. If you find that your IP is listed on MIPS, please contact the person or company that you are trying to send email to and ask them to bypass your IP and strongly urge them to stop using MIPS.

**In all cases, do not file a chargeback or dispute payment with your payment provider.** This will only make the situation worse and will result in your account being suspended. If you are unable to work with us to get the IP removed from the blocklist, we will work with you to assign a different IP address to your server. If you are unable to work with us to get the IP removed from the blocklist and you do not want to switch IPs, we will work with you to cancel your service and issue a refund.

### Email is being delayed

If your email is being delayed, there is a good chance that your IP address is new or hasn't been seen in a long time and is untrusted. You will need to build a reputation for your IP address by sending email that is not considered spam. This can take some time, but you can speed up the process by following the recommendations given by Mail-Tester. 

A lot of mail servers will use an anti-spam practice called "Greylisting". Greylisting works like this: a mail transfer agent (MTA) using greylisting will "temporarily reject" any email from a sender it does not recognize. If the mail is legitimate, the originating server will try again after a delay, and if sufficient time has elapsed, the email will be accepted. If the mail is from a spammer, it will probably not be retried since a spammer will not usually retry sending their spam. Greylisting is a very effective anti-spam technique, but it can cause delays in email delivery that can last anywhere from a few minutes to a few hours.

Typically, if you're being greylisted, once you send an email and it is accepted by the receiving server, you typically will not be greylisted again. However, if you are sending a lot of email, you may find that you are being greylisted again. This is because the receiving server is seeing a lot of email from your IP address and is greylisting you again. If you are sending a lot of email, you should consider using a SMTP relay service such as [SendInBlue](https://www.sendinblue.com). SMTP relay services are designed to send large amounts of email and will have a good reputation with the major email providers.

If your email is still being delayed, please contact our support team for assistance.

### Email is being rejected

Email being rejected will always be accompanied by a bounce message. The bounce message will contain information about why the email was rejected. Some mail servers will provide a very detailed reason why the email was rejected, while others will provide a very generic reason. At the very least, there should be a code that will help you determine why the email was rejected.

SMTP codes that begin with `4` or `5` are error codes. `4` errors are temporary and the server will try again at a later time. No action is required on your part. `5` errors are permanent and the server will not try again. You will need to take action to resolve the error.

Common 400 errors are:

| Code | Description |
| ---- | ----------- |
| 421 | The receiving server is not accepting any new connections. This is usually a temporary error and the server will try again later. |
| 450 | Requested mail action not taken: mailbox unavailable. |
| 451 | Message not sent because of server error |
| 452 | Command stopped because the storage limit has been exceeded |
| 455 | Server can't deal with the given request at this time |

Common 500 errors are:

| Code | Description |
| ---- | ----------- |
| 500  | The server could not recognize the command due to a syntax error. |
| 501  | A syntax error was encountered in command arguments. |
| 502  | This command is not implemented. |
| 503  | The server has encountered a bad sequence of commands. |
| 541  | The recipient address rejected your message: normally, it's an error caused by an anti-spam filter. |
| 550  | Requested command failed because the user's mailbox was unavailable (for example because it was not found, or because the command was rejected for policy reasons or it was likely spam). |
| 551  | The recipient is not local to the server. |
| 552  | The action was aborted due to exceeded storage allocation. |
| 553  | The command was aborted because the mailbox name is invalid. |
| 554  | The transaction failed for some unstated reason. |

SMTP codes are typically followed by 3 more digits. These digits are specific to the receiving server and will help you determine why the email was rejected. For example, a 550 error followed by `5.7.1` means that the email was rejected because the recipient's mailbox is unavailable. A 550 error followed by `5.7.23` means that the email was rejected because the recipient's mailbox is full.

SMTP codes also will typically be followed by status codes. The first digit of the status code indicates the code class, the second digit indicates the subject, and the third digit indicates the detail. 

### Other issues

If you are having other issues with email, please contact our support team for assistance. Please provide as much information as possible about the issue you are having. If you are receiving a bounce message, please include the bounce message in your support request. 