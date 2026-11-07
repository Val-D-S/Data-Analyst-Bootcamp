# Data-Analyst-Bootcamp
Repository berisi file - file yang digunakan sebagai protofolio pada saat mengikuti Data Analyst Bootcamp.

# Tujuan Project:
untuk melatih pemahaman tentang SQL dengan menganalisa pertanyaan bisnis, memproses query yang sesuai dengan kebutuhan, dan menghasilkan data yang menjawab pertanyaan bisnis.

# Dataset :
Dataset yang digunakan adalah dataset thelook.ecommerce yang disediakan oleh google bigquery.

# Pertanyaan Bisnis :

1. Analisis Produk
Tim Product ingin mengetahui karakteristik produk yang dijual. Tampilkan nama produk,
kategori, department, merek, dan harga retail dari tabel products. Batasi hasil menjadi 20
produk pertama.

2. Identifikasi Produk Premium
Tim Marketing ingin menyiapkan kampanye untuk produk premium. Cari produk dengan
retail_price di atas 100. Tampilkan nama produk, kategori, merek, dan harga retail, lalu
urutkan dari harga tertinggi ke terendah.

3. Evaluasi Kategori Produk
Tim Product ingin mengetahui kategori dengan jumlah produk terbanyak. Hitung jumlah
produk pada setiap kategori dari tabel products, lalu urutkan hasil dari jumlah produk
terbesar

4. Mengenal Pelanggan dan Pesanan
Tim CRM ingin melihat pelanggan yang melakukan pemesanan. Gabungkan tabel users dan
orders untuk menampilkan ID pesanan, status pesanan, tanggal pesanan dibuat, serta nama
depan dan nama belakang pelanggan.

5. Analisis Penjualan per Kategori
Manajer bisnis ingin mengetahui kategori produk dengan nilai penjualan terbesar. Gabungkan
tabel order_items dan products, lalu hitung total nilai penjualan berdasarkan kategori.
Tampilkan kategori dan total penjualan, kemudian urutkan dari nilai terbesar. Gunakan
order_items.sale_price sebagai nilai transaksi per item.

# Query :
Pertanyaan 1 :
SELECT
name,
category,
department,
brand,
retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
LIMIT 20;

Pertanyaan 2 :
SELECT
name,
category,
brand,
retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE retail_price > 100
ORDER BY retail_price DESC;

Pertanyaan 3:
SELECT
category,
COUNT(*) AS total_products
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY category
ORDER BY total_products DESC;

Pertanyaan 4:
SELECT
order_id,
o.status,
o.created_at,
u.first_name,
u.last_name
FROM `bigquery-public-data.thelook_ecommerce.orders` o
INNER JOIN `bigquery-public-data.thelook_ecommerce.users` u
ON o.user_id = u.id;

Pertanyaan 5:
SELECT
category,
SUM (oi.sale_price) AS total_penjualan
FROM `bigquery-public-data.thelook_ecommerce.products` p
INNER JOIN `bigquery-public-data.thelook_ecommerce.order_items` oi
ON oi.product_id = p.id
GROUP BY category
ORDER BY total_penjualan DESC;

# Screenshot hasil Query:
Pertanyaan 1 :
<img width="942" height="240" alt="image" src="https://github.com/user-attachments/assets/8423daeb-c257-4d0f-9cc6-f7ee431d03e2" />

Pertanyaan 2 :
<img width="949" height="242" alt="image" src="https://github.com/user-attachments/assets/7c84d7d7-b231-4fee-b9bd-7ff7008d128b" />

Pertanyaan 3 :
<img width="944" height="239" alt="image" src="https://github.com/user-attachments/assets/70a761c8-6bc3-4743-80ad-640564f587b8" />

Pertanyaan 4 :
<img width="953" height="244" alt="image" src="https://github.com/user-attachments/assets/9c7c896a-1537-4edb-9acd-99c2896fdfe6" />

Pertanyaan 5 :
<img width="947" height="242" alt="image" src="https://github.com/user-attachments/assets/d09f279d-3b79-49a0-b444-2a61906b9080" />

# Insight
Pertanyaan 3 :
- Intimates menjadi Category dengan produk terbanyak sebanyak 2363 produk
- Clothing sets menjadi category dengan produk paling sedikit sebanyak 37 produk.

Pertanyaan 5 :
- Outerwear & Coats menjadi category dengan jumlah penjualan terbanyak sebanyak 1338500.56
- Clothing Sets menjadi category dengan jumlah penjualan paling sedikit sebanyak 16897.89





