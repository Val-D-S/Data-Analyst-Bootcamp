--MINI PROJECT--

-- 1. Analisis Produk
-- Tim Product ingin mengetahui karakteristik produk yang dijual. Tampilkan nama produk,
-- kategori, department, merek, dan harga retail dari tabel products. Batasi hasil menjadi 20
-- produk pertama.

SELECT
name,
category,
department,
brand,
retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
LIMIT 20;

-- 2. Identifikasi Produk Premium
--Tim Marketing ingin menyiapkan kampanye untuk produk premium. Cari produk dengan
--retail_price di atas 100. Tampilkan nama produk, kategori, merek, dan harga retail, lalu
--urutkan dari harga tertinggi ke terendah.

--Query:
SELECT
name,
category,
brand,
retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE retail_price > 100
ORDER BY retail_price DESC;

--3. Evaluasi Kategori Produk
--Tim Product ingin mengetahui kategori dengan jumlah produk terbanyak. Hitung jumlah
--produk pada setiap kategori dari tabel products, lalu urutkan hasil dari jumlah produk terbesar.

--Query:
SELECT
category,
COUNT(*) AS total_products
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY category
ORDER BY total_products DESC;

-- 4. Mengenal Pelanggan dan Pesanan
-- Tim CRM ingin melihat pelanggan yang melakukan pemesanan. Gabungkan tabel users dan
-- orders untuk menampilkan ID pesanan, status pesanan, tanggal pesanan dibuat, serta nama
-- depan dan nama belakang pelanggan.

--Query :
SELECT
order_id,
o.status,
o.created_at,
u.first_name,
u.last_name
FROM `bigquery-public-data.thelook_ecommerce.orders` o
INNER JOIN `bigquery-public-data.thelook_ecommerce.users` u
ON o.user_id = u.id;

-- 5. Analisis Penjualan per Kategori
-- Manajer bisnis ingin mengetahui kategori produk dengan nilai penjualan terbesar. Gabungkan
-- tabel order_items dan products, lalu hitung total nilai penjualan berdasarkan kategori.
-- Tampilkan kategori dan total penjualan, kemudian urutkan dari nilai terbesar. Gunakan
-- order_items.sale_price sebagai nilai transaksi per item.

-- Query:
SELECT
category,
SUM (oi.sale_price) AS total_penjualan
FROM `bigquery-public-data.thelook_ecommerce.products` p
INNER JOIN `bigquery-public-data.thelook_ecommerce.order_items` oi
ON oi.product_id = p.id
GROUP BY category
ORDER BY total_penjualan DESC;