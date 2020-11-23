# pass wclip

An extension for the [password store](https://www.passwordstore.org/) that copies a stored password into the windows clipboard using PowerShell commands to hide it from password history managers. Bascily minor mods on https://github.com/palortoff/pass-extension-wclip

## Usage
```
pass wclip pass-name
```

## Example
```
pass wclip email/gmail
```

## Parameters

As pass wclip uses the show command internally the `--clip` or `-c` parameter can be used to specify the line number.

```
pass wclip -c2 email/gmail
pass wclip --clip=6 email/gmail
```

## Installation
(This extensions is for windows only)
- First you have to enable extensions in pass by setting ``PASSWORD_STORE_ENABLE_EXTENSIONS=true``
- Add the `wclip.bash` file to `.password-store/.extensions`
  - Either copy the file or
  - Clone this repo as a submodule into `.password-store/.extensions/wclip` and
  - Create a symlink (in an elevated `cmd`, not in `bash`)
```
cd %userprofile%\.password-store\.extensions
mklink wclip.bash wclip\src\wclip.bash
```

## Contribution

Contributions are always welcome.
