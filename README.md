# recipe-app-api
Recipe API Project


# Recipe API

## Overview
The **Recipe API** allows users to create, retrieve, update, and delete recipes. It provides functionalities for managing ingredients, categories, and user authentication.

## Features
- User authentication (Register/Login)
- Create, read, update, and delete recipes
- Categorize recipes
- Search and filter recipes
- API documentation with Swagger/OpenAPI

## Tech Stack
- **Backend:** Python, Django, Django Rest Framework (DRF)
- **Database:** PostgreSQL
- **Version Control:** Git, GitHub

## Installation

### Prerequisites
- Python 3.8+
- PostgreSQL
- Virtual Environment (optional but recommended)

### Setup
```bash
# Clone the repository
git clone https://github.com/yourusername/recipe-api.git
cd recipe-api

# Create virtual environment and activate it
python -m venv venv
source venv/bin/activate  # On Windows use `venv\Scripts\activate`

# Install dependencies
pip install -r requirements.txt

# Configure environment variables
cp .env.example .env  # Update the .env file with your settings

# Apply migrations
python manage.py migrate

# Run the server
python manage.py runserver
```

## API Endpoints

### Authentication
| Method | Endpoint          | Description         |
|--------|------------------|---------------------|
| POST   | /api/auth/register/ | Register a new user |
| POST   | /api/auth/login/    | Login and get token |

### Recipes
| Method | Endpoint            | Description               |
|--------|----------------------|---------------------------|
| GET    | /api/recipes/        | List all recipes          |
| POST   | /api/recipes/        | Create a new recipe       |
| GET    | /api/recipes/{id}/   | Retrieve a specific recipe |
| PUT    | /api/recipes/{id}/   | Update a recipe           |
| DELETE | /api/recipes/{id}/   | Delete a recipe           |

### Categories
| Method | Endpoint            | Description               |
|--------|----------------------|---------------------------|
| GET    | /api/categories/     | List all categories       |
| POST   | /api/categories/     | Create a new category     |

## Usage
- **Authentication:** Obtain a token by logging in and include it in the `Authorization` header as `Bearer <token>`.
- **Creating a Recipe:** Send a POST request with `title`, and `ingredients`.

## Running Tests
```bash
python manage.py test
```

## Contribution
1. Fork the repository
2. Create a new branch (`feature-branch`)
3. Commit your changes
4. Push to the branch
5. Create a pull request

## License
This project is licensed under the MIT License.
