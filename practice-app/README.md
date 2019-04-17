# Practice App

This is our practice application for CMPE352/451 project. 
We are going to implement the manual investment feature of our project for this app. 

## How to Install & Run

1 - Make sure you have Python 3.6 or higher and pip installed.
```bash
python3 --version
pip3 --version
```

2 - Install dependencies.
```bash
pip3 install -r requirements.txt
```

3 - Now run the project.
```bash
python3 manage.py migrate
python3 manage.py runserver
```

4 - Go to your browser and type: http://localhost:8000/helloworld.

## How to Develop

For a quick start, you can check how the helloworld API endpoint was implemented in [THIS](https://github.com/bounswe/bounswe2019group2/commit/3787eeabb6bb7b8c76879e076565ced3c5060181) commit.

You should also see:
- Django REST framework: https://www.django-rest-framework.org/tutorial/quickstart/
- Documentation: https://www.django-rest-framework.org/topics/documenting-your-api/
- Testing: 
    * https://www.django-rest-framework.org/api-guide/testing/
    * https://docs.djangoproject.com/en/2.2/topics/testing/

