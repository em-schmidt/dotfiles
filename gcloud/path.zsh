[[ -d /opt/homebrew ]] && export BREW_PATH=/opt/homebrew
export GCLOUD_SDK_PATH=${BREW_PATH}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

[[ -e ${GCLOUD_SDK_PATH} ]] && source ${GCLOUD_SDK_PATH}
