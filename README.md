# Infraestructura Terraform Docker

##  Descripción breve

Este proyecto implementa una infraestructura de desarrollo local usando Terraform y Docker. Permite levantar automáticamente un servidor web, una base de datos Postgres, un servicio Redis y una herramienta de monitoreo Grafana, conectados mediante redes de Docker.

---

## Integrantes

* Alegria Sagastegui, Juan
* Oliden Agreda, Alejandro
* Oncoy Patricio, Angel Mauricio
* Rodriguez Cabrera, Marcelo
* Vereau Plasencia, Maximo

---

##  Cómo empezar

### Inicializar el proyecto

Este comando descarga los proveedores (plugins) necesarios, en este caso el de Docker.

```bash
terraform init
```

### Revisar el plan de ejecución

Permite ver **qué contenedores y redes** se crearán antes de aplicar cambios.

```bash
terraform plan
```

### Aplicar cambios 

Ejecuta la creación de contenedores, redes y volúmenes.

```bash
terraform apply
```

> Cuando pregunte, escribe `yes`.

### Destruir infraestructura

Elimina todos los recursos creados por Terraform.

```bash
terraform destroy
```

---

## Archivos principales del proyecto

* **`main.tf`** → Configuración del proveedor Docker y versiones mínimas de Terraform.
* **`variables.tf`** → Definición de variables (puertos, credenciales, redes).
* **`terraform.tfvars`** → Valores concretos para las variables (ejemplo: `web_server_port_external = 3000`).
* **`web_server.tf`** → Contenedor del servidor web (ej. Nginx).
* **`persistence.tf`** → Contenedores de Redis y Postgres + volúmenes.
* **`grafana.tf`** → Contenedor de Grafana para monitoreo.
* **`outputs.tf`** → Información útil al final de la ejecución (URLs, conexiones).
* **`.gitignore`** → Evita subir archivos no necesarios (`.terraform/`, `*.tfstate`).


##  Ejemplo de Títulos de Código y Commits

Cuando trabajes en este repositorio, usa **Conventional Commits** para que los mensajes sean claros.

### Ejemplo 1 – Agregar el servidor web

**Título del código:** `web_server.tf`

```bash
feat(web): add nginx web server with external port variable
```

### Ejemplo 2 – Configurar Postgres

**Título del código:** `persistence.tf`

```bash
feat(database): add postgres container with user, password and db variables
```

### Ejemplo 3 – Ajustar variables

**Título del código:** `variables.tf`

```bash
refactor(vars): add descriptions and sensitive flag to credentials
```

### Ejemplo 4 – Documentación

**Título del código:** `README.md`

```bash
docs(readme): add setup instructions with terraform commands
```

### Ejemplo 5 – Corrección menor

**Título del código:** `grafana.tf`

```bash
fix(grafana): correct external port mapping for grafana container
```


