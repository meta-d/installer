# Installer

Metad Analytics Cloud Installer

## Docker


执行以下命令启动服务：

```bash
docker-compose up -d
# 或者指定配置文件
docker-compose -f <docker compose file> up -d
```

运行以下命令创建默认的租户和数据：

```bash
docker-compose run --rm api node main.js --command seedModule --name Default
# 或者指定配置文件
docker-compose -f <docker compose file> run --rm api node main.js --command seedModule --name Default
```

### 访问

访问 http://localhost 即可看到 Web UI 页面。

默认账号为
* 超级管理员：`admin@mtda.cloud`，密码为 `admin`
* 管理员：`local.admin@mtda.cloud`，密码为 `admin`

## k8s

设置 Secret，并启动服务

`kubectl create -f manifest.yaml`
