cd remote
curl -s https://api.github.com/repos/yyyar/gobetween/releases | grep browser_download_url | grep linux_amd64 | cut -d '"' -f 4 | head -n 1 | wget -i - -O gobetween
wget -O - https://releases.hashicorp.com/consul-template/0.21.2/consul-template_0.21.2_linux_amd64.tgz | tar xzf -
