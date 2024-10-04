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
system_install_prefix="${system_install_prefix:-"/usr/local"}"
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

echo "Installing ${app_namespace} (${install_mode}) ..."

# create destination directory
mkdir -p "${bin_dir}" "${doc_dir}"

# install binaries sequentially
for file in bin/*; do
    # get filename
    filename=$(basename "${file}") && \
    # copy file to destination
    cp -f "${file}" "${bin_dir}/${filename}" && \
    # set perms of installed file
    chmod 755 "${bin_dir}/${filename}"
done

# install docs sequentially
for file in doc/*; do
    # get filename
    filename=$(basename "${file}") && \
    # copy file to destination
    cp -f "${file}" "${doc_dir}/${filename}" && \
    # set perms of installed file
    chmod 644 "${doc_dir}/${filename}"
done

# report installation result
if [ ${?} -eq 0 ]; then
    echo "SUCCESS: ${app_namespace} has been installed successfully."
else
    echo "ERROR: ${app_namespace} installation failed."
    exit 1
fi
