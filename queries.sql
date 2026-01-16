SELECT
  b.booking_id,
  u.name AS customer_name,
  v.name AS vehicle_name,
  b.start_date,
  b.end_date,
  b.status
FROM bookings b
INNER JOIN users u
  ON b.user_id = u.user_id
INNER JOIN vehicles v
  ON b.vehicle_id = v.vehicle_id
ORDER BY b.booking_id;


SELECT
  v.vehicle_id,
  v.name,
  v.type,
  v.model,
  v.registration_number,
  v.rental_price,
  v.status
FROM vehicles v
WHERE NOT EXISTS (
  SELECT 1
  FROM bookings b
  WHERE b.vehicle_id = v.vehicle_id
)
ORDER BY v.vehicle_id;


SELECT
  vehicle_id,
  name,
  type,
  model,
  registration_number,
  rental_price,
  status
FROM vehicles
WHERE type = 'car'
  AND status = 'available'
ORDER BY vehicle_id;


SELECT
  v.name AS vehicle_name,
  COUNT(b.booking_id) AS total_bookings
FROM bookings b
INNER JOIN vehicles v
  ON b.vehicle_id = v.vehicle_id
GROUP BY v.vehicle_id, v.name
HAVING COUNT(b.booking_id) > 2
ORDER BY total_bookings DESC, v.name;