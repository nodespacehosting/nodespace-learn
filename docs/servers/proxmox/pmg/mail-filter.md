# Mail Filter Settings

The Mail Filter section contains the rules for filtering email messages. The rules are applied in the order they are listed. The first rule that matches the message will be applied. If no rules match, the message will be delivered to the recipient without any filtering.

## Rules Overview

Rules can be applied on inbound and outbound messages. Rules are processed based on inbound and outbound as well as priority. The larger the priority, the higher the priority. For example, a rule with priority 100 will be processed before a rule with priority 95. 

Rules are made up of objects and these objects are applied to rules. Objects can be used in multiple rules.

| Object | Description |
| ------ | ----------- |
| Action | The action to take when a rule matches such as reject, quarantine, sending a notification, etc. |
| Who    | These are email addresses, domains, IP addresses, IP networks, LDAP groups, and LDAP users. |
| What   | These are items like attachments, spam scores, viruses, etc. |
| When   | These are times and days of the week. Such as only applying a rule during business hours. |

## Default Rules

!!! note
    While the default rules will help protect your server, they may not be suitable for your environment. You should review the default rules and adjust them as needed. Several of the default rules are disabled by default as they are restrictive. You can use these rules as a starting point for your own rules.

By default, PMG will create a few rules for you. These rules are:

| Rule Name | Description | Direction | Priority | 
| --------- | ----------- | -------- | -------- |
| Blacklist | Rejects messages from blacklisted senders. | In | 98 |
| Block Viruses | Rejects messages that contain a virus. | In | 96 |
| Virus Alert   | Sends a notification when a virus is detected. | Out | 96 |
| Block Dangerous Files | Rejects messages that contain a dangerous file such as vbs, exe, etc. | In | 93 |
| Modify Header | Modifies the spam score header. | In | 90 |
| Quarantine Office Files | Quarantines messages that contain office files. **Disabled by default** | In | 89 |
| Block Multimedia Files | Rejects messages that contain multimedia files. **Disabled by default** | In & Out | 87 |
| Whitelist | Accepts messages from whitelisted senders. | In | 85 |
| Block Spam (Level 10) | Rejects messages that are classified as spam with a score of 10 or higher. | In | 82 |
| Quarantine/Mark Spam (Level 5) | Quarantines messages that are classified as spam with a score of 5 or higher. | In | 81 |
| Quarantine/Mark Spam (Level 3) | Quarantines messages that are classified as spam with a score of 3 or higher. | In | 80 |
| Block outgoing Spam | Rejects messages that have a spam score of 3 or higher, notifies sender and admin. | Out | 70 |
| Add Disclaimer | Adds a disclaimer to outbound messages. | Out | 60 |

Remember, these are defaults and can be modified or removed as needed. They can also aid you in developing your own rules. 

## Create a Rule

Creating a rule is a multi-step process.

1. On the **Rules** page, click on the **Add** button. Give your rule a name, priority, set the direction of mail flow this rule should apply to, and if it should be enabled or not.

2. In the far right pane, build your rule using the objects. At minimum, every rule needs at least an Action Object and a Who or What rule.

!!! note
    If you don't see an Object, you can create the object under the appropriate category for the Object you're trying to create.

3. Save the rule and test.

## Enable/Disable a Rule

If you need to disable a rule, click on the toggle icon on the far right of the rule list, next to the pencil icon. To enable the rule, click the toggle again.