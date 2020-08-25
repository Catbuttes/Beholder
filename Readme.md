# Beholder Server

This repo contains the ansible playbooks to spin up the beholder server. Created originally to monitor the availability of Essex University sites during the 2020 Hot Clearing period. It contains:

- [Docker](https://www.docker.com/) 
- [Traefik](https://containo.us/traefik/)
- [InfluxDB](https://www.influxdata.com/)
- [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/)
- [Grafana](https://grafana.com)

It also runs the Real Engineering Discord Community Bot

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

DISCORD_BOT_TOKEN: {{ DISCORD BOT TOKEN HERE }}

```
2. Put your hosts into `hosts/hosts.yml`
3. Enter values into `vars/values.yml`
4. Run `ansible-playbook main.yml -i hosts/hosts.yml --become` to deploy the listed stack to the newly provisioned server

Enjoy your newly provisioned monitoring stack.
