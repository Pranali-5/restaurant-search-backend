const db = require('../db')

exports.searchDishes = async (req, res) => {
  const { name, minPrice, maxPrice } = req.query

  if (!name || !minPrice || !maxPrice) {
    return res.status(400).json({
      message: 'name, minPrice and maxPrice are required',
    })
  }

  const query = `
    SELECT
      r.id AS restaurantId,
      r.name AS restaurantName,
      r.city,
      m.name AS dishName,
      m.price AS dishPrice,
      COUNT(o.id) AS orderCount
    FROM menu_items m
    JOIN restaurants r ON r.id = m.restaurant_id
    LEFT JOIN orders o ON o.menu_item_id = m.id
    WHERE
      LOWER(m.name) LIKE LOWER(?)
      AND m.price BETWEEN ? AND ?
    GROUP BY
      r.id, r.name, r.city, m.name, m.price
    ORDER BY
      orderCount DESC
    LIMIT 10;
  `

  const [rows] = await db.execute(query, [`%${name}%`, minPrice, maxPrice])

  res.json({ restaurants: rows })
}
