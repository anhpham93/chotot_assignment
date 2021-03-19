# chotot_assignment
Write a test case for Đăng Nhập (Login) on Chotot website
https://www.chotot.com
- Design code to make it readable, maintainable, and reusable.
- Programming language: Java, or another language (optional)
- Framework: Selenium, Chrome driver, TestNG (optional)

### Documentation
If you want to run it, please updated data in data file. It should be followed in file:
`Resources/TestData/Login.robot`
Please contact me if you have any question (`phamha.anh13993@gmail.com`)

### Prerequisites
* Python > 3.6
* pipenv > 8.3

### Installing pipenv
brew install pipenv

### Installing pipenv development packages
pipenv install -d

### Running command
pipenv run robot -v

### Running tests
pipenv run robot  --outputdir ./Report/chotot_assignment  --variablefile ./Resources/Variables/local.py  -i  login  -v headless:False  -v BROWSER:chrome -v remote_debug_port:9223  ./selenium_chotot
