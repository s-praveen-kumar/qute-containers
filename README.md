# qute-containers
Browser Containers for [Qutebrowser](https://qutebrowser.org)

## What are containers?
Browser Containers is a feature available as an official extension in Mozilla 
Firefox. It allows users to have separate 'containers'. All the browser data, 
cookies and site storage are stored and separated within these containers.
Common use cases include having multiple containers to mitigate cookie tracking
and using multiple web logins without confusion (Eg: Multiple gmail accounts).

## Browser Containers for qutebrowser
Qutebrowser supports containers through the `-B` basedir command line option.
These scripts provide a simple interface to manage the containers by manipulating
the basedir parameter.

## Requirements
- dmenu / rofi (although it is possible to use without them)

## How it works?
The script creates a file with a list of containers in the location specified by
`CONTAINER_LIST` variable in the `containers_config` file.

The actual containers are created as directories within the `CONTAINER_BASE` directory.

Containers can be created or deleted manually by editing the `CONTAINER_LIST` 
file and creating/removing respective directory from `CONTAINER_BASE`.
Helper scripts are provided to make this process easier.

## Usage
The scripts can be used standalone (from terminal) or as userscripts in qutebrowser.

### Opening a browser window in a container
```sh
container-open
```
or from qutebrowser
```
:spawn --userscript container-open
```
This opens dmenu with an option to select which container to open.

### Opening a browser window in a particular container
```sh
container-open <container-name>
```
or from qutebrowser
```
:spawn --userscript container-open <container-name>
```
This opens a window with the given container.

### Opening a URL in a given container
```sh
container-open <container-name> <URL>
```
or from qutebrowser
```
:spawn --userscript container-open <container-name> <URL>
```
or using hint mode
```
:hint links userscript container-open
```

### Getting a list of existing containers
```sh
container-ls
```
or from qutebrowser
```
:spawn --userscript container-ls
```
### Adding a new container
```sh
container-add <container-name>
```
or from qutebrowser
```
:spawn --userscript container-add <container-name>
```
### Removing a new container
```sh
container-rm <container-name>
```
or from qutebrowser
```
:spawn --userscript container-rm <container-name>
```

## Useful bindings and aliases
```python
config.bind('C','spawn --userscript container-open')
config.bind('<Alt-c>','set-cmd-text -s :spawn --userscript container-open')
config.bind('<Alt-f>','hint links userscript container-open')
config.bind('<Alt-f>','hint links userscript container-open')

c.aliases['container-open'] = 'spawn --userscript container-open'
c.aliases['container-ls'] = 'spawn --userscript container-ls'
c.aliases['container-add'] = 'spawn --userscript container-add'
c.aliases['container-rm'] = 'spawn --userscript container-rm'
```

## Bonus Tip
You can bind the container-open script to a keybinding within your window manager
 / hotkey daemon and launch containers directly.

## Thank you
I love using qutebrowser and wanted to make this tiny contribution. I hope you find
it useful. Suggestions and bugs are welcomed.
