FROM public.ecr.aws/amazonlinux/amazonlinux:latest

# Instalar Python 3.11 y pip
RUN yum update -y && \
    yum install -y python3.11 python3.11-pip && \
    yum clean all

# Configurar directorio de trabajo
COPY . /app
WORKDIR /app

# Instalar dependencias
RUN pip3.11 install -r requirements.txt

# Exponer puerto
EXPOSE 8080

# Comando de inicio
CMD ["python3.11", "main.py"]
