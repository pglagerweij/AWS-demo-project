from setuptools import setup, find_packages

with open('LICENSE') as f:
    license = f.read()

# Setting up
setup(
       # the name must match the folder name 'verysimplemodule'
        name="data-testing", 
        version="0.0.1",
        author="Pascal Lagerweij",
        author_email="plagerweij@email.com>",
        description="short description",
        long_description="longer description",
        license=license,
        packages=find_packages(exclude=('tests'))       
)