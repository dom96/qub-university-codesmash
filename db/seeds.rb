Sale.create!(
  'total' => 6.00,
  'items' => [
    { 'name' => 'soft drink', 'price' => 1.50 },
    { 'name' => 'burger', 'price' => 4.50 }
  ]
)

Sale.create!(
  'total' => 9.00,
  'items' => [
    { 'name' => 'milkshake', 'price' => 2.50 },
    { 'name' => 'burger', 'price' => 4.50 },
    { 'name' => 'chips', 'price' => 2.00 }
  ]
)
