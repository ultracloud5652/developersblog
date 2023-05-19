# FROM python:3.11.2-alpine3.17
# WORKDIR /app
# ENV PYTHONUNBUFFERED 1

# COPY ./requirements.txt /requirements.txt

# RUN apk add --update --no-cache postgresql-client build-base postgresql-dev \
#                                 musl-dev zlib zlib-dev linux-headers

# RUN python -m venv /py && \
#     /py/bin/pip install --upgrade pip && \
#     /py/bin/pip install -r /requirements.txt



# ENV PATH="/scripts:/py/bin:$PATH"

# COPY ./developer

# EXPOSE 8000

# CMD ["python",  "manage.py", "runserver", "0.0.0.0:8000"]

FROM python:3.11.2
WORKDIR /app 

# set environment variables  
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1  

# install dependencies  
RUN pip install --upgrade pip  

# copy whole project to your docker home directory. 
COPY ./ ./
# run this command to install all dependencies  
RUN pip install -r requirements.txt  
# port where the Django app runs  
EXPOSE 8000  
# start server  
CMD python manage.py runserver