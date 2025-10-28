<?php
require '../../includes/session.php';
require '../../includes/db.php';

if (!isset($_GET['id'])) {
    echo '<div class="text-danger">ID giao dịch không được cung cấp.</div>';
    exit;
}

$transaction_id = intval($_GET['id']);

// Kiểm tra kết nối cơ sở dữ liệu
if (!$conn) {
    echo '<div class="text-danger">Không thể kết nối đến cơ sở dữ liệu.</div>';
    exit;
}

// Lấy thông tin giao dịch + người dùng
$query = "
    SELECT t.id, t.status, t.created_at, u.username, u.email
    FROM transactions t
    LEFT JOIN users u ON t.user_id = u.id
    WHERE t.id = ?
";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $transaction_id);
$stmt->execute();
$result = $stmt->get_result();
$transaction = $result->fetch_assoc();

if (!$transaction) {
    echo '<div class="text-danger">Giao dịch không tồn tại.</div>';
    exit;
}

// Lấy danh sách sản phẩm + tính tổng tiền
$query_items = "
    SELECT o.*, 
           p.name AS product_name, 
           c.name AS category_name,
           (SELECT pi.image 
            FROM product_images pi 
            WHERE pi.product_id = o.product_id 
              AND pi.is_main = 1 
            LIMIT 1) AS main_image
    FROM orders o
    LEFT JOIN products p ON o.product_id = p.id
    LEFT JOIN categories c ON p.category_id = c.id
    WHERE o.transaction_id = ?
";

$stmt_items = $conn->prepare($query_items);
$stmt_items->bind_param("i", $transaction_id);
$stmt_items->execute();
$result_items = $stmt_items->get_result();

$total_amount = 0; // Tổng tiền động
$rows = [];

while ($row = $result_items->fetch_assoc()) {
    $row_total = $row['price'] * $row['quantity'];
    $total_amount += $row_total;
    $rows[] = $row + ['row_total' => $row_total];
}

// === Hiển thị thông tin giao dịch ===
echo '<h5>Thông tin giao dịch</h5>';
echo '<p><strong>Người dùng:</strong> ' . htmlspecialchars($transaction['username']) . '</p>';
echo '<p><strong>Email:</strong> ' . htmlspecialchars($transaction['email']) . '</p>';
echo '<p><strong>Tổng tiền:</strong> ' . number_format($total_amount, 0, ',', '.') . ' đ</p>';
echo '<p><strong>Trạng thái:</strong> ' . ucfirst($transaction['status']) . '</p>';
echo '<p><strong>Ngày tạo:</strong> ' . $transaction['created_at'] . '</p>';

// === Hiển thị danh sách sản phẩm ===
echo '<h5>Danh sách sản phẩm</h5>';
echo '<table class="table table-bordered">';
echo '<thead>
        <tr>
            <th>Hình ảnh</th>
            <th>Sản phẩm</th>
            <th>Phân loại</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Thành tiền</th>
        </tr>
      </thead>';
echo '<tbody>';
foreach ($rows as $row) {
    echo '<tr>';
    echo '<td>';
    $img = !empty($row['main_image'])
        ? 'http://localhost/my_website/uploads/products/' . htmlspecialchars($row['main_image'])
        : 'http://localhost/my_website/uploads/no-image.png';
    echo '<img src="' . $img . '" alt="' . htmlspecialchars($row['product_name']) . '" style="width:80px;height:80px;object-fit:cover;">';
    echo '</td>';
    echo '<td>' . htmlspecialchars($row['product_name']) . '</td>';
    echo '<td>' . htmlspecialchars($row['category_name']) . '</td>';
    echo '<td>' . $row['quantity'] . '</td>';
    echo '<td>' . number_format($row['price'], 0, ',', '.') . ' đ</td>';
    echo '<td>' . number_format($row['row_total'], 0, ',', '.') . ' đ</td>';
    echo '</tr>';
}
echo '</tbody>';
echo '</table>';
