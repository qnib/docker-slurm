#!/bin/bash

if [ ! -d /chome/cluser ];then
    mkdir /chome/cluser
    chown -R cluser: /chome/cluser/
fi
## add .bash_profile
if [ ! -f /chome/cluser/.bash_profile ];then
    cat << \EOF > /chome/cluser/.bash_profile
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
    fi

    # User specific environment and startup programs

    PATH=$PATH:$HOME/.local/bin:$HOME/bin

    export PATH
EOF
    chown -R cluser: /chome/cluser/.bash_profile
fi
## add .bashrc
if [ ! -f /chome/cluser/.bashrc ];then
    cat << \EOF > /chome/cluser/.bashrc
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
export LD_LIBRARY_PATH=/usr/local/lib/
EOF
    chown -R cluser: /chome/cluser/.bashrc
fi

if [ ! -f /chome/cluser/.ssh/id_rsa.pub ];then
    cat << \EOF > /chome/cluser/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDa5bba0/684Y1lM67zWoSXQNVN48jLjntVnSKwnSQRqpHQ6jIyENrKFv7r8hNE6pGePyvOvMt28pCLhnMXa3V1z/AWCNrMUrozJupi2ErR+iplUYzLZ3n2KyfxEgxdzVc4uL6Y0r9wAKB4KiG4Y2qPR9Caqf6zWNoPyjKf14J6GmnDbOV2/pfLVJcE6YBBAs9crN2KwCizm3DB7O2DZAPTa/kRoQX3MeOLVnHqK2rsv5azlLWN0qNRuyl2hutWE0FYxQdxXGX6OfsjeU88XkFGxjaHfeulECTDWR3lVeB+tq2DhXQ9Gi4aVy1mMs2P27BuuHqqeCnOyfsOWr461EFt cluser@qnibterminal
EOF
    chmod 644 /chome/cluser/.ssh/id_rsa.pub
    chown cluser: /chome/cluser/.ssh/id_rsa.pub
    mkdir -p /chome/cluser/.ssh
    cp /chome/cluser/.ssh/id_rsa.pub /chome/cluser/.ssh/authorized_keys
    chown cluser: /chome/cluser/.ssh/authorized_keys
    cat << \EOF > /chome/cluser/.ssh/id_rsa
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEA2uW22tP+vOGNZTOu81qEl0DVTePIy457VZ0isJ0kEaqR0Ooy
MhDayhb+6/ITROqRnj8rzrzLdvKQi4ZzF2t1dc/wFgjazFK6MybqYthK0foqZVGM
y2d59isn8RIMXc1XOLi+mNK/cACgeCohuGNqj0fQmqn+s1jaD8oyn9eCehppw2zl
dv6Xy1SXBOmAQQLPXKzdisAos5twweztg2QD02v5EaEF9zHji1Zx6itq7L+Ws5S1
jdKjUbspdobrVhNBWMUHcVxl+jn7I3lPPF5BRsY2h33rpRAkw1kd5VXgfratg4V0
PRouGlctZjLNj9uwbrh6qngpzsn7Dlq+OtRBbQIDAQABAoIBAGx4wPAXdXhr3QF1
ZxC4nlPFkO4UHoCgjoWSZIpYlHMcrz1zkIQ2zfSvCIwrXVkdVCOy8iZ0b+71rKM3
cPj+Cyria/q/UI1HwXVvp15sCEedTD0A+GAjWtCd+iD/7JjfFIXLJsfcR3ldFif1
2Nfii/+MetbpvolpUkXY0NVcmg+e9Hv7n9SDJXOA9EYWkRsqpBvyuU6UQpAFarHn
g/KxolYHSl3Hjd7L0KQrM3FaRe2wcFU69MDP9zvPyvDSZLx+PZy4/e7DawTyeFQQ
vAAXwgxBROWdhoIezsCAufoqQMxiKFWwbTwrvuGSyQGUggKtomEKVuINAH+scwYF
ZeCApRECgYEA8OG+IPY3yBZU2Lni5KQrkDr7kbPf8yTWAtwzmAlxeas0Z26Ubb4E
zkVWCiRhXYOpw9RX9rkA2tWXWL0RmZF8Cex0esFeU1S37om5eKgg6NXiIQwjwUUi
q2VUPZ6ZFkfxQniriXnCZXXtOeCJZRh7akck2lPlpHyx3Yx91sjQ8BMCgYEA6KK+
+do03to/6R6jq4Wq42M5Hy5kuZNf+QRzAVWUaV4XNwo8JWaJMIQukdyy4f4dD1XU
tYgRQS/v7NhhMLt0a9X0VQF1Nt9rLeCXUgQtL0r/AJXp6g3nuoQEmrI5iNxpX6Ef
MvbbVqW5nBV2bPtN8jrF+11ybwXgWORk1b3TOH8CgYEAiABMoruhXv0MxpidPE5c
skA7DVarmNIxasf88VhTk0hQfB14/EUO3Y9UNsG3n17ZGNHpIEnv654wp0+IglYb
3FZ+pVhL82yftLRZ3X+/pPYtiE8cWOC55F9/opLLCENyOf97ilEOqs5cNBNMP6IE
/EpSyloYDDjDC71oxz32ibUCgYBbaVfRpcSQrQHgAIIfq+5yW1LexcQeh6J2nyDx
rUccADTvE75+k8PkpIwIFMjVtJyGohtrGYRuMP/9+Sh3lbExjmjr3h7I6RGcfVv4
hlua8cUx3baEmeIskCOfBdlFxhZB1XYE+KtHaOd+RZC7UiRWwnF5TEbjCVQWmehl
dKnC0QKBgEBu2Se2F+qc4nZd61ymnx0sIdlxc1CXBZPe0Qd1xYYGNVyWByZNzeKq
fcgWtkxQqu7mxpJvu7553WA85JCcSWUsb7rDcNFr3lNsJI3hgL9XzKZ5/ca7qXpw
UeOMadyfzn9VcwIbtJiuZbWFiPCAtIjdysdH5KlnKdDfkUyzCAMA
-----END RSA PRIVATE KEY-----
EOF
    chmod 600 /chome/cluser/.ssh/id_rsa
    chown cluser: /chome/cluser/.ssh/id_rsa
fi
    
echo "domain node.consul" >> /etc/resolv.conf
