# 🍽️ Restaurant Dish Search Backend

A simple **Node.js + MySQL** backend service that allows users to search for restaurants based on a dish name, restricted by a **mandatory price range**.  
Results are sorted by the **number of times the dish has been ordered**.

---

## 🛠️ Tech Stack

- Node.js
- Express.js
- MySQL
- Docker & Docker Compose

---

## 📁 Project Structure

```text
restaurant-search-backend/
│
├── src/
│   ├── app.js
│   ├── db.js
│   ├── controllers/
│   │   └── search.controller.js
│   └── routes/
│       └── search.routes.js
│
├── seed.sql
├── Dockerfile
├── docker-compose.yml
├── .env
├── package.json
└── README.md

```

## 🗄️ Database Design

### Restaurants

- `id`
- `name`
- `city`

### Menu Items

- `id`
- `restaurant_id`
- `name`
- `price`

### Orders

- `id`
- `menu_item_id`
- `restaurant_id`
- `created_at`

---

## 🚀 How to Run the Application

### 1️⃣ Prerequisites

Ensure the following are installed:

- Node.js (v18 or higher)
- Docker & Docker Compose

2️⃣ Environment Configuration

Create a .env file in the project root:

```
DB_HOST=db
DB_USER=root
DB_PASSWORD=password
DB_NAME=restaurant_db
PORT=3000
```

3️⃣ Start the Application (Docker)

From the project root, run:

```
docker compose up --build
```

Server running on port 3000

GET http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300

Sample Response:

```
{
"restaurants": [
{
"restaurantId": 1,
"restaurantName": "Hyderabadi Spice House",
"city": "Hyderabad",
"dishName": "Chicken Biryani",
"dishPrice": 220,
"orderCount": 15
}
]
}
```

## 🌍 Live Deployment (Railway)

Backend deployed on Railway:

🔗 https://restaurant-search-backend-production-39c9.up.railway.app/search/dishes?name=biryani&minPrice=150&maxPrice=300
