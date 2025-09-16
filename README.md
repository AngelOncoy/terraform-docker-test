# Proyecto

**Infraestructura Terraform Docker**

##  Descripción breve

Este proyecto despliega con Terraform y Docker una infraestructura de desarrollo compuesta por:

* Tres contenedores Nginx (`app1`, `app2`, `app3`) en la red `app_net`.
* Un contenedor de Redis y otro de Postgres en la red `persistence_net`.
* Un contenedor de Grafana en la red `monitor_net`.

Los puertos externos se definen en el archivo `terraform.tfvars` para poder acceder desde el host.

---

## Integrantes

* Alegria Sagastegui, Juan
* Oliden Agreda, Alejandro
* Oncoy Patricio, Angel Mauricio
* Rodriguez Cabrera, Marcelo
* Vereau Plasencia, Maximo

---

##  Cómo ejecutar

```bash
# Inicializar el proyecto (descarga los providers)
terraform init

# Ver el plan de ejecución
terraform plan

# Crear los recursos (contenedores, redes)
terraform apply
# confirma con: yes

# Eliminar los recursos creados
terraform destroy
```

---

## Archivos y qué hace cada uno

* **`main.tf`**

  * Configura el provider de Docker.
  * Crea las redes `app_net`, `persistence_net` y `monitor_net`.

* **`variables.tf`**

  * Define las variables para los puertos de `app1`, `app2`, `app3`, Redis, Postgres y Grafana.

* **`terraform.tfvars`**

  * Asigna valores concretos a las variables, por ejemplo:

    ```hcl
    web_server_ports_external_app1    = 3000
    web_server_ports_external_app2    = 3001
    web_server_ports_external_app3    = 3002
    web_server_port_external_redis    = 3006
    web_server_port_external_postgres = 3007
    web_server_port_external_grafana  = 3003
    ```

* **`web_server.tf`**

  * Crea los tres contenedores Nginx (`app1`, `app2`, `app3`).
  * Cada uno expone su puerto externo hacia el interno `80`.
  * Se conectan a la red `app_net`.

* **`persistence.tf`**

  * Crea un contenedor de Redis (puerto interno 6379 → puerto externo definido en variables).
  * Crea un contenedor de Postgres (puerto interno 5432 → puerto externo definido en variables).
  * Ambos se conectan a la red `persistence_net`.

* **`grafana.tf`**

  * Despliega un contenedor de Grafana.
  * Expone el puerto interno `3000` hacia el puerto externo definido en variables.
  * Se conecta a la red `monitor_net`.

---

## Accesos (según puertos definidos en `terraform.tfvars`)

* **App1:** `http://localhost:3000`
* **App2:** `http://localhost:3001`
* **App3:** `http://localhost:3002`
* **Grafana:** `http://localhost:3003`
* **Redis:** `localhost:3006` (mapea al 6379 interno)
* **Postgres:** `localhost:3007` (mapea al 5432 interno)

---

## Commit

### `main.tf`

```text
feat(infra): configure docker provider and create networks
```

### `variables.tf`

```text
refactor(vars): declare port variables for apps, redis, postgres and grafana
```

### `terraform.tfvars`

```text
chore(config): set default external ports for apps and services
```

### `web_server.tf`

```text
feat(web): add nginx containers app1, app2 and app3 with external ports
```

### `persistence.tf`

```text
feat(persistence): add redis and postgres containers with port mapping
```

### `grafana.tf`

```text
feat(monitoring): deploy grafana container with configurable external port
```

### `README.md`

```text
docs(readme): add setup guide and commit examples
```
