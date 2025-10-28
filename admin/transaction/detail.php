<!-- <?php
require '../../includes/session.php';
require '../../includes/db.php';

if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header("Location: ../login.php");
    exit;
}

// Lấy ID giao dịch từ URL
if (!isset($_GET['id'])) {
    die("ID giao dịch không được cung cấp.");
}
$transaction_id = intval($_GET['id']);

// Lấy thông tin giao dịch
$query = "
    SELECT t.*, u.username, u.email 
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
    die("Giao dịch không tồn tại.");
}

// Lấy danh sách sản phẩm trong giao dịch
$query_items = "
    SELECT o.*, p.name AS product_name, c.name AS category_name, 
           (SELECT pi.image 
            FROM product_images pi 
            WHERE pi.product_id = o.product_id AND pi.is_main = 1 
            LIMIT 1) AS main_image
    FROM orders o
    LEFT JOIN products p ON o.product_id = p.id
    LEFT JOIN categories c ON o.category_id = c.id
    WHERE o.transaction_id = ?
";
$stmt_items = $conn->prepare($query_items);
$stmt_items->bind_param("i", $transaction_id);
$stmt_items->execute();
$result_items = $stmt_items->get_result();
?>
