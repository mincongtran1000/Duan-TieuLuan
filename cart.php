<?php
session_start();
require 'includes/db.php';
require 'includes/header.php';
require 'includes/navbar.php';

// Nếu chưa đăng nhập, hiển thị giao diện yêu cầu đăng nhập
if (!isset($_SESSION['user_id'])) {
    echo '
    <div style="
        display:flex;
        justify-content:center;
        align-items:center;
        height:100vh;
        flex-direction:column;
        font-family:Arial, sans-serif;
    ">
        <p style="font-size:20px; margin-bottom:20px;">
            Bạn cần đăng nhập để xem giỏ hàng.
        </p>
        <a href="login.php" 
           style="
               padding:12px 30px;
               background:#007bff;
               color:white;
               border-radius:6px;
               text-decoration:none;
               font-size:16px;
           "
           onmouseover="this.style.background=\'#0056b3\'"
           onmouseout="this.style.background=\'#007bff\'">
           Đăng nhập
        </a>
    </div>';
    require 'includes/footer.php';
    exit();
}

$user_id = intval($_SESSION['user_id']);

// Lấy danh sách sản phẩm trong transaction đang pending
$query = "
    SELECT 
        o.product_id, 
        SUM(o.quantity) AS total_quantity, 
        SUM(o.price * o.quantity) AS total_price,
        p.name AS product_name,
        c.name AS category_name,
        (
            SELECT pi.image 
            FROM product_images pi 
            WHERE pi.product_id = p.id AND pi.is_main = 1 
            LIMIT 1
        ) AS main_image
    FROM orders o
    LEFT JOIN products p ON o.product_id = p.id
    LEFT JOIN categories c ON p.category_id = c.id
    WHERE o.transaction_id IN (
        SELECT id FROM transactions WHERE user_id = ? AND status = 'pending'
    )
    GROUP BY o.product_id
    ORDER BY p.name ASC
";

$stmt = $conn->prepare($query);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
?>

<div class="container my-4">
    <h2 class="mb-4">Giỏ hàng của bạn</h2>
    <?php if ($result && $result->num_rows > 0): ?>
        <table class="table table-bordered align-middle">
            <thead class="table-light">
                <tr>
                    <th>Hình ảnh</th>
                    <th>Sản phẩm</th>
                    <th>Phân loại</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                    <th>Thành tiền</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td>
                            <img src="http://localhost/my_website/uploads/products/<?php echo htmlspecialchars($row['main_image'] ?? 'no-image.png'); ?>"
                                alt="<?php echo htmlspecialchars($row['product_name']); ?>"
                                style="width: 80px; height: 80px; object-fit: cover;">
                        </td>
                        <td><?php echo htmlspecialchars($row['product_name']); ?></td>
                        <td><?php echo htmlspecialchars($row['category_name']); ?></td>
                        <td><?php echo $row['total_quantity']; ?></td>
                        <td><?php echo number_format($row['total_price'] / $row['total_quantity'], 0, ',', '.'); ?> đ</td>
                        <td><?php echo number_format($row['total_price'], 0, ',', '.'); ?> đ</td>
                        <td>
                            <form action="remove_from_cart.php" method="POST">
                                <input type="hidden" name="product_id" value="<?php echo $row['product_id']; ?>">
                                <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
                            </form>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
        <form action="checkout.php" method="POST">
            <button type="submit" class="btn btn-success btn-lg mt-3">Thanh toán</button>
        </form>

    <?php else: ?>
        <div class="text-center text-muted" style="margin-top:50px;">
            <p style="font-size:18px;">Giỏ hàng của bạn đang trống.</p>
            <a href="index.php" class="btn btn-primary mt-3">Tiếp tục mua sắm</a>
        </div>
    <?php endif; ?>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<?php require 'includes/footer.php'; ?>