# CLI Help

## Modes

VyOS has two modes: operational mode and configuration mode. Operational mode is used to view the current configuration and to run commands. Configuration mode is used to configure VyOS. You can know which mode you are in by looking at the prompt. If you see a `$` at the end of the prompt, you are in operational mode. If you see a `#` at the end of the prompt, you are in configuration mode.

Some commands operate differently depending on what mode you are in. For example, the `show` command will show the current configuration in operational mode and will show the current configuration for the current level in configuration mode. 

### Run Operational Mode Commands in Configuration Mode

If you are in configuration mode and you want to run an operational mode command, you can prefix the command with `run`. For example, if you want to run the `show configuration` command while in configuration mode, you can run the following command:

```bash
run show configuration
```

## Commands to Know

!!! tip
    VyOS has tab completion. If you're not sure what command to use, you can type the first few letters of the command and press the `Tab` key to see a list of available commands or to complete the current command.

### configure Command

The `configure` command is used to enter configuration mode. This is where you will configure VyOS. You can run the following command to enter configuration mode:

```bash
configure
```
You will know you are in configuration mode when you see the following prompt:

```
[edit]
vyos@vyos#
```

### show Command

The `show` command is used to view the current configuration. For example, if you want to view the current firewall configuration, you would run the following command:

```bash
show firewall
```
The `show` command has different options depending on what mode you are in.

#### View the current configuration

To view the active configuration, you must be in operational mode. To view the active configuration, you can run the following command:

```bash
show configuration
```

### edit Command

The `edit` command is used to navigate down the configuration tree. For example, if you want to configure an interface, you would run the following command:

```bash
edit interfaces ethernet eth0
```
!!! example
    To navigate from the top level down to the interfaces level:
  
    ```
    [edit]
    vyos@vyos# edit interfaces
    [edit interfaces]
    vyos@vyos#
    ```

    To change to the eth0 interface:
  
    ```
    [edit interfaces]
    vyos@vyos# edit ethernet eth0
    [edit interfaces ethernet eth0]
    vyos@vyos#
    ```

    It is also possible to navigate down multiple levels at once:
  
    ```
    [edit]
    vyos@vyos# edit interfaces ethernet eth0
    [edit interfaces ethernet eth0]
    vyos@vyos#
    ```

If you wish to return to the previous level, you can use the `up` command. For example, if you are in the `interfaces ethernet eth0` level and you want to return to the `ethernet` level, you can run the following command:

```bash
up
```

To return to the top level, you can run the following command:

```bash
top
```

This can save you typing when entering configuration commands. Here's an example for configuring a firewall rule without using the `edit` command:

```bash
set firewall name WAN_IN rule 10 action accept
set firewall name WAN_IN rule 10 state established enable
set firewall name WAN_IN rule 10 state related enable
set firewall name WAN_IN rule 10 state invalid disable
set firewall name WAN_IN rule 10 protocol tcp_udp
set firewall name WAN_IN rule 10 destination port 22
```

Here's the same example using the `edit` command:

```bash
edit firewall name WAN_IN rule 10
set action accept
set state established enable
set state related enable
set state invalid disable
set protocol tcp_udp
set destination port 22
```

To exit edit and return to standard configuration mode, you can run the following command:

```bash
exit
```

