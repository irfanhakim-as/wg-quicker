#!/usr/bin/env bash
#
#         :::   :::  ::::::::::::::    :::    :::
#       :+:+: :+:+:     :+:    :+:   :+:   :+: :+:
#     +:+ +:+:+ +:+    +:+    +:+  +:+   +:+   +:+  Irfan Hakim (MIKA)
#    +#+  +:+  +#+    +#+    +#++:++   +#++:++#++:  https://sakurajima.social/@irfan
#   +#+       +#+    +#+    +#+  +#+  +#+     +#+   https://github.com/irfanhakim-as
#  #+#       #+#    #+#    #+#   #+# #+#     #+#    https://gitlab.com/irfanhakim
# ###       #################    ######     ###
#
app_namespace="wg-quicker"

# environment variables
system_install_prefix="${system_install_prefix:-"/usr"}"
user_install_prefix="${user_install_prefix:-"${HOME}/.local"}"

# local variables
required_vars=("bin_dir" "doc_dir")

# determine installation directories
if [[ ${EUID} -eq 0 ]]; then
    bin_dir="${system_install_prefix}/bin"
    doc_dir="${system_install_prefix}/share/doc/${app_namespace}"
    install_mode="system"
else
    bin_dir="${user_install_prefix}/bin"
    doc_dir="${user_install_prefix}/share/doc/${app_namespace}"
    install_mode="local"
fi

# ensure all required variables are set
for var in "${required_vars[@]}"; do
    if [ -z "${!var}" ]; then
        echo "ERROR: Required variable ${var} was not set successfully. Aborting installation of ${app_namespace}."
        exit 1
    fi
done

echo "Uninstalling ${app_namespace} (${install_mode}) ..."

# uninstall binaries sequentially
for file in bin/*; do
    # get filename
    filename="${bin_dir}/$(basename "${file}")" && \
    # remove file
    echo "Removing ${filename}" && rm -f "${filename}"
done && \
# uninstall docs
echo "Removing ${doc_dir}" && rm -rf "${doc_dir}"

# report uninstallation result
if [ ${?} -eq 0 ]; then
    echo "SUCCESS: ${app_namespace} has been uninstalled successfully."
else
    echo "ERROR: ${app_namespace} uninstallation failed."
    exit 1
fi
