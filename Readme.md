# Real Engineering Discord Projects Infrastructure
This repo contains the ansible playbooks to spin up the infrastructure hosting the Real Engineering Discord server community projects. At present this means it will do the following:

- Install [docker](https://www.docker.com/) ✅
- Install [prometheus](https://www.prometheus.io/) ✅
- Install [grafana](https://grafana.com/) ✅
- Install [Traefik](https://containo.us/traefik/) ✅
- Spin up an instance of the [RE Community Bot](https://github.com/RE-Discord-Development/CommunityBot) ✅

---

## Making it work
Before you begin, you will need the following:
- A remote server running Debian buster somewhere in the cloud
- Cloudflare DNS and API tokens generated (used for LE cert generation)
- A local linux box with [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html) installed ([WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10) also works if you are running Windows 10)

Then to fire everything up,,,

1. Create `vars/secrets.yml` with the following contents
```yml
CF_API_EMAIL: "{{ CLOUDFLARE API EMAIL }}"
CF_DNS_API_TOKEN: "{{ CLOUDFLARE DNS API TOKEN }}"
CF_ZONE_API_TOKEN: "{{ CLOUDFLARE ZONE API TOKEN }}"

grafana_smtp_host: {{YOUR SMTP SERVER HERE}}
grafana_smtp_from_email: {{YOUR SMTP EMAIL FROM HERE}}
grafana_smtp_from_name: {{NAME OF THE SMTP EMAILER HERE}}
grafana_smtp_username: {{THE SMTP USERNAME HERE}}
grafana_smtp_password: {{THE SMTP USER PASSWORD HERE}}

COMMUNITYBOT_DISCORD_TOKEN: {{You bot discord token here}}
```
2. Enter values into `vars/values.yml`
3. Run `ansible-playbook provision-server.yml` to provision a Digital Ocean droplet with associated DNS records
4. Run `ansible-playbook deploy-stack.yml` to deploy the listed stack to the newly provisioned droplet


Enjoy your newly provisioned server, bot and monitoring stack.