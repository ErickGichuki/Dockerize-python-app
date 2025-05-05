FROM ubuntu

WORKDIR /app

COPY requirements.txt /app/
COPY devops /app/

RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

SHELL ["/bin/bash", "-c"]

RUN python3 -m venv env && \
source env/bin/activate && \
pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD source env/bin/activate && python3 manage.py runserver 0.0.0.0:8000


# FROM ubuntu

# WORKDIR /app

# # Install system dependencies including sonar-scanner dependencies
# RUN apt-get update && \
#     apt-get install -y \
#         python3 \
#         python3-pip \
#         python3-venv \
#         curl \
#         unzip \
#         wget \
#         openjdk-11-jre-headless \
#         git && \
#     apt-get clean

# # Set up Python virtual environment
# COPY requirements.txt /app/
# RUN python3 -m venv /app/env && \
#     /app/env/bin/pip install --no-cache-dir -r /app/requirements.txt

# # Install SonarScanner
# RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip && \
#     unzip sonar-scanner-cli-5.0.1.3006-linux.zip && \
#     mv sonar-scanner-5.0.1.3006-linux /opt/sonar-scanner && \
#     ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner

# # Copy app source code
# COPY devops /app/

# # Expose the app port
# EXPOSE 8000

# # Use full path to activate env and run server
# CMD ["/app/env/bin/python3", "manage.py", "runserver", "0.0.0.0:8000"]

