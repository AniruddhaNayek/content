#!/bin/bash
# packages = authselect
# platform = Red Hat Enterprise Linux 8,Red Hat Enterprise Linux 9,multi_platform_fedora

authselect create-profile hardening -b sssd
CUSTOM_PROFILE="custom/hardening"
authselect select $CUSTOM_PROFILE --force

CUSTOM_SYSTEM_AUTH="/etc/authselect/$CUSTOM_PROFILE/system-auth"
sed -i --follow-symlinks -e '/^password\s*requisite\s*pam_pwquality\.so/ s/^#*/#/g' $CUSTOM_SYSTEM_AUTH
authselect apply-changes -b
