![License BSDv2](https://img.shields.io/badge/license-BSDv2-brightgreen.svg)

# goklp: Golang OpenSSH Keys Ldap Provider for AuthorizedKeysCommand
Forked from [AppliedTrust](https://github.com/AppliedTrust/goklp) and modified for our everyday use.

Improvements:
 - Added ldap filter
 - Added option to specify ldap attribute for ssh key
 - Added builds for OpenBSD and FreeBSD
 - Added auto create home folder if keys are returned for the user
 - Working with FreeIPA

## Usage:
1. Setup goklp.ini - preferly in same directory as goklp or use `--config` option.
2. Test to ensure goklp returns SSH keys: `goklp <username>`

```
Usage:
  goklp <username>
  goklp [--config=<config>] <username>
  goklp -h --help
  goklp --version

Options:
  --version              Show version.
  -h, --help             Show this screen.
  -c, --config=<file>    Path to goklp config file
```


## Debug
Log output and debugging is piped to syslog. If you provide wrong path for config file or config file permissions is off, the error is written in the console

## Example config

### goklp.ini config file is required:
Use the optional ldap_filter if you only want to allow a certain group of users to be able to login.

```
goklp_ldap_uri              = server1,server2
goklp_ldap_bind_dn          = CN=someuser,O=someorg,C=sometld
goklp_ldap_base_dn          = O=someorg,C=sometld
goklp_ldap_bind_pw          = someSecretPassword
goklp_ldap_timeout          = 5
goklp_ldap_filter           = memberOf=cn=local-firewalls,cn=groups,cn=accounts,dc=example,d=com
goklp_debug                 = false
goklp_ldap_user_attr        = uid
goklp_ldap_ssh_key_attr     = sshPublicKey
goklp_insecure_skip_verify  = false
```

### Example sshd_config

```
UsePrivilegeSeparation sandbox
Subsystem sftp internal-sftp
ClientAliveInterval 180
UseDNS no
PermitRootLogin no
PasswordAuthentication no
ChallengeResponseAuthentication no
AuthorizedKeysCommand /bin/goklp --config=/etc/goklp/goklp.ini %u
AuthorizedKeysCommandUser root
```
