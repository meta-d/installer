# Metad Analytics Cloud Installer

## Docker

Execute the following commands to start the service:

```bash
cd docker
# copy env.tmpl to .env
docker-compose up -d
# Or run with file
docker-compose -f <docker compose file> up -d
```

### Access

Visit http://localhost or http://your-ip to access the Web UI page.

## k8s

Set up the Secret and start the service.

`kubectl create -f manifest.yaml`
