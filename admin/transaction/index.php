<?php
require '../autoload/session.php';
require '../autoload/db.php';
require '../layouts/header.php';

if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header("Location: ../login.php");
    exit;
}

$sql = "
SELECT 
    t.id AS transaction_id,
    t.user_id,
    u.username,
    COALESCE(SUM(o.price * o.quantity), 0) AS total_amount,
    t.status,
    t.created_at,
    COUNT(o.id) AS total_items,
    SUM(o.quantity) AS total_quantity
FROM transactions t
LEFT JOIN users u ON t.user_id = u.id
LEFT JOIN orders o ON t.id = o.transaction_id
GROUP BY t.id, u.username, t.status, t.created_at
ORDER BY t.created_at DESC
";

$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Quản lý giao dịch</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>

    <div class="container my-4">
        <h2 class="mb-4">Quản lý giao dịch</h2>
        <?php if ($result && $result->num_rows > 0): ?>
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-success">
                    <tr>
                        <th>ID</th>
                        <th>Người dùng</th>
                        <th>Tổng tiền</th>
                        <th>Số Lượng</th>
                        <th>Trạng thái</th>
                        <th>Ngày tạo</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td>#<?php echo $row['transaction_id']; ?></td>
                            <td><?php echo htmlspecialchars($row['username']); ?></td>
                            <td><?php echo number_format($row['total_amount'], 0, ',', '.'); ?> đ</td>
                            <td style="width:100px; text-align:center; white-space:nowrap;">
                                <?php echo $row['total_quantity'] ?: 0; ?>
                            </td>
                            <td>
                                <span class="badge bg-<?php
                                                        echo $row['status'] === 'completed' ? 'success' : ($row['status'] === 'pending' ? 'warning' : 'danger');
                                                        ?>">
                                    <?php echo ucfirst($row['status']); ?>
                                </span>
                            </td>
                            <td><?php echo $row['created_at']; ?></td>
                            <td>
                                <button type="button" class="btn btn-sm btn-primary view-detail" data-id="<?php echo $row['transaction_id']; ?>">
                                    <i class="fa-solid fa-eye"></i> Chi tiết
                                </button>

                                <?php if ($row['status'] === 'pending'): ?>
                                    <form action="update_status.php" method="POST" class="d-inline">
                                        <input type="hidden" name="transaction_id" value="<?php echo $row['transaction_id']; ?>">
                                        <!-- <button type="submit" name="status" value="completed" class="btn btn-sm btn-success">
                                            Hoàn tất
                                        </button> -->
                                    </form>

                                    <form action="update_status.php" method="POST" class="d-inline" onsubmit="return confirm('Bạn có chắc chắn muốn hủy giao dịch này?');">
                                        <input type="hidden" name="transaction_id" value="<?php echo $row['transaction_id']; ?>">
                                        <button type="submit" name="status" value="cancelled" class="btn btn-sm btn-danger">
                                            Hủy
                                        </button>
                                    </form>
                                <?php endif; ?>

                                <form action="delete_transaction.php" method="POST" class="d-inline" onsubmit="return confirm('Xóa giao dịch này?');">
                                    <input type="hidden" name="transaction_id" value="<?php echo $row['transaction_id']; ?>">
                                    <button type="submit" class="btn btn-sm btn-outline-danger">
                                        <i class="fa-solid fa-trash"></i> Xóa
                                    </button>
                                </form>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p class="text-muted">Không có giao dịch nào.</p>
        <?php endif; ?>
    </div>
    <!-- Modal xem chi tiết -->
    <div class="modal fade" id="transactionModal" tabindex="-1" aria-labelledby="transactionModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="transactionModalLabel">Chi tiết đơn hàng</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                </div>
                <div class="modal-body">
                    <div id="transactionDetailContent" class="p-3 text-center text-muted">
                        Đang tải dữ liệu...
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.view-detail').on('click', function() {
                const id = $(this).data('id');
                $('#transactionDetailContent').html('<div class="text-center p-3 text-muted">Đang tải dữ liệu...</div>');

                $.ajax({
                    url: 'transaction_detail_ajax.php',
                    type: 'GET',
                    data: {
                        id: id
                    },
                    success: function(response) {
                        $('#transactionDetailContent').html(response);
                        $('#transactionModal').modal('show');
                    },
                    error: function() {
                        $('#transactionDetailContent').html('<div class="text-danger">Lỗi tải dữ liệu</div>');
                    }
                });
            });
        });
    </script>
</body>
</html>