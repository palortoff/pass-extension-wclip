# pass wclip

An extension for the [password store](https://www.passwordstore.org/) that copies a stored password into the windows clipboard using [wclip](https://github.com/palortoff/wclip) to hide it from password history managers.

## Usage
```
pass wclip pass-name
```

## Example
```
pass wclip email/gmail
```

## Installation
(This extensions is for windows only)
- First you have to enable extensions in pass by setting ``PASSWORD_STORE_ENABLE_EXTENSIONS=true``
- Add the `wclip.bash` file to `.password-store/.extensions`
  - Either copy the file or
  - Clone this repo as a submodule into `.password-store/.extensions/wclip` and
  - Create a symlink (in `cmd`, not in `bash`)
```
cd %userprofile%\.password-store\.extensions
mklink wclip.bash wclip\src\wclip.bash
```

## Contribution

Contributions are always welcome.
