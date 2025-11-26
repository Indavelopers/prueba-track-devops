# README

Prueba track devOps/ingeniero de plataforma

## Descripción de la prueba

Instrucciones generales:

- El ejercicio está pensado para seguir una progresión general, intenta completar todos los pasos que puedas en el tiempo disponible.
- Si no eres capaz de completar del todo un apartado, intenta continuar con los siguientes pasos.
- Utiliza tu cuenta de usuario de Google corporativa y el proyecto de Google Cloud asignado.
- Utiliza tu IDE y herramientas de desarrollo local, o Cloud Shell Editor en la Google Cloud Console con su entorno preparado.

## Tareas a realizar

1. Lee con detenimiento las instrucciones.
2. Trabaja en el directorio `ejercicio`.
3. Prepara tu entorno de trabajo:
   1. Clona el repositorio: `git clone https://github.com/Indavelopers/prueba-track-devops.git`
   2. Comprueba que Cloud SDK está instalado y disponible, e inicia sesión con tu cuenta de usuario de Google si es necesario.
   3. Comprueba que `docker`, `kubectl`, `terraform`, están instalados y disponibles.
4. Conteneriza la aplicación web `webapp`:
   1. Si necesitas testear localmente la aplicación web, puedes hacerlo: en `webapp`, `source venv/bin/activate`, `flask --debug --app main run`, `deactivate`
   2. Crea una imagen de contenedor usando el Dockerfile proporcionado, preparada para subirla al repositorio de Docker de Artifact Registry proporcionado, con nombre `webapp` y etiqueta `v1`.
      1. No podemos testear localmente la aplicación web en el contenedor, ya que no cuenta con credenciales de Google para comunicarse con Cloud Storage.
   3. Configura la autenticación de `docker` local para Artifact Registry con tu cuenta de usuario de Google.
   4. Sube la imagen de contenedor al repositorio Docker de Artifact Registry.
5. Usando como base los scripts de Terraform en `terraform`, complétalos siguiendo sus instrucciones para crear un clúster de GKE y un bucket de Cloud Storage:
   1. Utiliza variables para el proyecto de Google Cloud, los nombres y localización de ambos recursos.
   2. Incluye el valor de dichas variables en el archivo `terraform/terraform.tfvars`.
   3. Despliega el clúster de GKE y el bucket de Cloud Storage con Terraform.
6. Despliega la aplicación web contenerizada en el clúster de GKE:
   1. Descarga las credenciales de conexión al cúster para tu configuración de `kubectl`.
   2. Crea un namespace llamado `webapp` para desplegar la aplicación de forma declarativa (crea un manifiesto YAML/JSON).
   3. Usando los manifiestos de Kubernetes en `webapp/manifests`, completa su información y crea los siguientes objetos en el namespace `webapp`:
      1. Deployment
      2. Service
      3. ConfigMap
   4. Despliega los objetos en el clúster de GKE y comprueba que se han creado correctamente.
   5. Sube un archivo de ejemplo al bucket de Cloud Storage para que lo liste la aplicación web.
      1. Por ejemplo, algún archivo de este repositorio.
   6. Testea la aplicación web a través de su Service externo.
7. Analizando los logs de Cloud Logging, encuentra el objeto de Cloud Storage listado y logueado por la aplicación web.
8. Crea una política de alerta en Cloud Monitoring con la siguiente configuración:
   1. Objetivo: alertar si un Pod queda en estado de "pending" durante más de 2 minutos.
   2. Métrica: `prometheus.googleapis.com/kube_pod_status_phase/gauge`
   3. Duración: 2 minutos.
   4. Canal de notificación: tu email.
9. Ejecuta una pipeline de CI/CD en Cloud Build con la configuración de `webapp/cloudbuid.yaml`:
   1. Modifica el código de la aplicación para que devuelva `"app_version": "v2"` en lugar de `"app_version": "v1"`.
   2. Asegúrate de que Cloud Build tiene permiso para desplegar en GKE.
   3. En `cloudbuild.yaml`, sustituye `YOUR_PROJECT_ID` por tu ID de proyecto de Google Cloud.
   4. Lanza manualmente la pipeline para que despliegue la nueva versión de la aplicación con etiqueta `v2`.
      1. _Nota del instructor_: Los pasos de despliegue seguidos no son los habituales ni siguen las buenas prácticas recomendadas, pero son utilizados aquí para simplificar el ejercicio, p. ej. al no disponer de un repositorio externo para los commits del alumno.
   5. Testea la aplicación web de nuevo a través de su Service externo.

## Dispones de

- Tienes acceso libre a toda la documentación, tutoriales, quickstarts, etc., cualquier recurso público disponible. ¡Haz uso de ellos!
- Si tienes algún asistente de IA disponible (Gemini, Gemini Code Assist, Gemini Cloud Code, etc.), también puedes utilizarlo.
- IDE con herramientas de trabajo local o Cloud Shell.

Recursos:

- Aplicación web completa: `webapp/main.py`.
- Dockerfile listo para contenerizarla: `webapp/Dockerfile`
- Scripts de Terraform a completar en `terraform`.
- Manifiestos de Kubernetes en `webapp/manifests`.
- Archivo de configuración de Cloud Build en `webapp/cloudbuild.yaml`.
- Repositorio de imágenes de contenedor formato Docker en Artifact Registry ya creado en el proyecto de GCP.

## Evaluación

- Gestión de entornos de trabajo.
- Uso de documentación y recursos.
- Diseño y gestión de aplicaciones contenerizadas en Kubernetes.
- Desarrollo y uso de scripts de Terraform.
- Despliegue de pipelines de CI/CD.
- Diseño de soluciones de monitorización.
- Capacidad de resolución de problemas técnicos.
- Seguimiento de buenas prácticas.
- Innovación y excelencia.

## APIs utilizadas

- storage.googleapis.com
- cloudbuild.googleapis.com
- container.googleapis.com
- artifactregistry.googleapis.com
- monitoring.googleapis.com
- logging.googleapis.com
- iamcredentials.googleapis.com
