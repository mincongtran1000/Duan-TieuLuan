    <?php
    require 'includes/session.php';
    require 'includes/db.php';
    include 'includes/header.php';
    include 'includes/navbar.php';

    // Lấy top 10 sản phẩm mới nhất (id hoặc created_at gần nhất)
    $newest_ids = [];
    $newest_query = $conn->query("SELECT id FROM products ORDER BY created_at DESC LIMIT 2");
    while ($r = $newest_query->fetch_assoc()) {
        $newest_ids[] = $r['id'];
    }
    // Lấy toàn bộ sản phẩm cùng ảnh chính
    $sql = "
        SELECT p.*, c.name AS category_name, pi.image AS main_image
        FROM products p
        LEFT JOIN categories c ON p.category_id = c.id
        LEFT JOIN product_images pi ON pi.product_id = p.id AND pi.is_main = 1
        WHERE p.is_hidden = 0
        ORDER BY p.created_at DESC
    ";
    $result = $conn->query($sql);
    ?>
    <div class="container my-4">

    <div class="row">
        <!-- Sidebar bên trái -->
        <div class="col-12 col-md-3 mb-4">
            <!-- Phần menu trang chủ -->
            <nav class="navbar bg-light rounded shadow-sm flex-column align-items-stretch p-3 mb-4">
                <h5 class="mb-3">Menu</h5>
                <ul class="nav nav-pills flex-column">
                    <li class="nav-item mb-2"><a class="nav-link" href="index.php">Trang chủ</a></li>
                    <li class="nav-item mb-2"><a class="nav-link" href="products.php">Sản phẩm</a></li>
                    <li class="nav-item mb-2"><a class="nav-link" href="cart.php">Giỏ hàng</a></li>
                    <li class="nav-item mb-2"><a class="nav-link" href="login.php">Đăng nhập</a></li>
                    <li class="nav-item mb-2"><a class="nav-link" href="register.php">Đăng ký</a></li>
                    <li class="nav-item mb-2"><a class="nav-link" href="profile.php">Tài khoản</a></li>
                    <li class="nav-item mb-2"><a class="nav-link" href="contact.php">Liên hệ</a></li>
                </ul>
            </nav>
            <!-- Phần sản phẩm HOT và MỚI -->
            <div class="bg-light rounded shadow-sm p-3">
                <div class="mb-4">
                    <h6 class="text-danger">HOT</h6>
                    <?php
                    $hot_sql = "SELECT p.*, pi.image AS main_image FROM products p LEFT JOIN product_images pi ON pi.product_id = p.id AND pi.is_main = 1 WHERE p.is_hidden = 0 AND p.is_hot = 1 ORDER BY p.created_at DESC LIMIT 5";
                    $hot_result = $conn->query($hot_sql);
                    if ($hot_result && $hot_result->num_rows > 0):
                        while ($row = $hot_result->fetch_assoc()):
                    ?>
                        <div class="d-flex align-items-center mb-2">
                            <img src="<?php echo !empty($row['main_image']) ? 'uploads/products/' . htmlspecialchars($row['main_image']) : 'uploads/no-image.png'; ?>" alt="<?php echo htmlspecialchars($row['name']); ?>" style="width:32px; height:32px; object-fit:cover; border-radius:4px; margin-right:8px;">
                            <a href="product_detail.php?id=<?php echo $row['id']; ?>" class="small text-danger text-decoration-none"><?php echo htmlspecialchars($row['name']); ?></a>
                        </div>
                    <?php endwhile; else: ?>
                        <div class="text-muted small">Không có sản phẩm HOT.</div>
                    <?php endif; ?>
                </div>
                <div class="mb-2">
                    <h6 class="text-info">Mới</h6>
                    <?php
                    $new_sql = "SELECT p.*, pi.image AS main_image FROM products p LEFT JOIN product_images pi ON pi.product_id = p.id AND pi.is_main = 1 WHERE p.is_hidden = 0 ORDER BY p.created_at DESC LIMIT 5";
                    $new_result = $conn->query($new_sql);
                    if ($new_result && $new_result->num_rows > 0):
                        while ($row = $new_result->fetch_assoc()):
                    ?>
                        <div class="d-flex align-items-center mb-2">
                            <img src="<?php echo !empty($row['main_image']) ? 'uploads/products/' . htmlspecialchars($row['main_image']) : 'uploads/no-image.png'; ?>" alt="<?php echo htmlspecialchars($row['name']); ?>" style="width:32px; height:32px; object-fit:cover; border-radius:4px; margin-right:8px;">
                            <a href="product_detail.php?id=<?php echo $row['id']; ?>" class="small text-info text-decoration-none"><?php echo htmlspecialchars($row['name']); ?></a>
                        </div>
                    <?php endwhile; else: ?>
                        <div class="text-muted small">Không có sản phẩm mới.</div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
        <!-- Nội dung bên phải -->
        <div class="col-12 col-md-9">
            <form action="index.php" method="GET" class="mb-4">
                <div class="input-group">
                    <input type="text" name="search" id="search" class="form-control" placeholder="Tìm kiếm sản phẩm..." value="<?php echo isset($_GET['search']) ? htmlspecialchars($_GET['search']) : ''; ?>">
                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                </div>
                <div id="suggestions" class="mt-2"></div>
                <!-- gợi ý tìm kiếm -->
            </form>
            <!-- Banner trang chủ -->
            <div class="mb-4 text-center">
                <img src="uploads/banner/banner.jpg" alt="Banner" style="max-width:100%; height:auto; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,0.1);">
            </div>
            <!-- Thanh tìm kiếm -->
            <div class="row g-4">
            <?php
            $search = isset($_GET['search']) ? '%' . $_GET['search'] . '%' : '%';

            $sql = "
                    SELECT p.*, c.name AS category_name, pi.image AS main_image,
                        IFNULL(pr.avg_rating, 0) AS avg_rating,
                        IFNULL(pr.cnt, 0) AS review_count
                    FROM products p
                    LEFT JOIN categories c ON p.category_id = c.id
                    LEFT JOIN product_images pi ON pi.product_id = p.id AND pi.is_main = 1
                    LEFT JOIN (
                        SELECT product_id, ROUND(AVG(rating),1) AS avg_rating, COUNT(*) AS cnt
                        FROM product_reviews
                        GROUP BY product_id
                    ) pr ON pr.product_id = p.id
                    WHERE p.is_hidden = 0
                    AND p.name LIKE ?
                    ORDER BY p.created_at DESC
                ";

            $stmt = $conn->prepare($sql);
            $stmt->bind_param("s", $search);
            $stmt->execute();
            $result = $stmt->get_result();

            ?>
            <?php if ($result && $result->num_rows > 0): ?>
                <?php while ($row = $result->fetch_assoc()): ?>
                    <?php
                    $is_new = in_array($row['id'], $newest_ids);
                    $is_hot = $row['is_hot'];
                    ?>
                    <div class="col-6 col-sm-4 col-md-3 col-lg-custom">
                        <div class="card h-200 shadow-sm position-relative">
                            <div class="position-relative">
                                <?php if ($is_hot): ?>
                                    <span class="badge bg-danger position-absolute top-0 start-0 translate-middle-y">HOT</span>
                                <?php endif; ?>
                                <?php if ($is_new): ?>
                                    <span class="badge bg-info position-absolute top-0 end-0 translate-middle-y">NEW</span>
                                <?php endif; ?>
                            </div>

                            <!-- Ảnh -->
                            <div style="width:100%; height:200px; display:flex; align-items:center; justify-content:center; background:#f9f9f9;">
                                <?php if (!empty($row['main_image'])): ?>
                                    <img src="uploads/products/<?php echo htmlspecialchars($row['main_image']); ?>"
                                        alt="<?php echo htmlspecialchars($row['name']); ?>"
                                        style="max-width:100%; max-height:100%; object-fit:contain;">
                                <?php else: ?>
                                    <img src="uploads/no-image.png" alt="No image"
                                        style="max-width:100%; max-height:100%; object-fit:contain;">
                                <?php endif; ?>
                            </div>

                            <!-- Nội dung -->
                            <div class="card-body text-center">
                                <h6 class="card-title"><?php echo htmlspecialchars($row['name']); ?></h6>
                                <!-- Đánh giá trung bình -->
                                <p class="mb-1">
                                    <?php if ($row['review_count'] > 0): ?>
                                        <span class="text-warning">
                                            <?= str_repeat('★', round($row['avg_rating'])) . str_repeat('☆', 5 - round($row['avg_rating'])) ?>
                                        </span>
                                        <span class="text-dark">
                                            (<?= $row['avg_rating'] ?>/5 • <?= $row['review_count'] ?> lượt)
                                        </span>
                                    <?php else: ?>
                                        <span class="text-muted">Chưa có đánh giá</span>
                                    <?php endif; ?>
                                </p>

                                <p class="card-text text-muted mb-1">
                                    <?php
                                    $gift_query = $conn->prepare("SELECT gift_description FROM product_gifts WHERE product_id = ?");
                                    $gift_query->bind_param("i", $row['id']);
                                    $gift_query->execute();
                                    $gift_result = $gift_query->get_result();
                                    if ($gift_result->num_rows > 0) {
                                        $gift = $gift_result->fetch_assoc();
                                        echo htmlspecialchars($gift['gift_description']);
                                    } else {
                                        echo "Không có quà đi kèm.";
                                    }
                                    ?>
                                </p>
                                <a href="product_detail.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-primary">Xem chi tiết</a>
                                <form action="add_to_cart.php" method="POST" class="mt-2">
                                    <input type="hidden" name="product_id" value="<?php echo $row['id']; ?>">
                                    <input type="hidden" name="quantity" value="1">
                                    <button type="submit" class="btn btn-sm btn-success">Mua ngay</button>
                                </form>
                            </div>
                        </div>
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <div class="col-12 text-muted">Không tìm thấy sản phẩm nào.</div>
            <?php endif; ?>
        </div>
    </div>

    <style>
        @media (min-width: 1200px) {
            .col-lg-custom {
                flex: 0 0 20%;
                max-width: 20%;
            }
        }
    </style>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- giữ đăng nhập tồn tại -->
    <script>
        let warningTime = 25 * 60 * 1000; // 25 phút
        let timeoutTime = 30 * 60 * 1000; // 30 phút

        setTimeout(() => {
            if (confirm("Phiên đăng nhập sắp hết hạn, bạn có muốn tiếp tục không?")) {
                fetch('keep_alive.php');
                alert("Phiên của bạn đã được gia hạn.");
            } else {
                window.location.href = "logout.php";
            }
        }, warningTime);

        setTimeout(() => {
            window.location.href = "logout.php";
        }, timeoutTime);
    </script>
    <!-- gợi ý tìm kiếm -->
    <script>
        document.getElementById('search').addEventListener('input', function() {
            const query = this.value;

            if (query.length > 2) {
                fetch(`search_suggestions.php?query=${query}`)
                    .then(response => response.json())
                    .then(data => {
                        const suggestionsDiv = document.getElementById('suggestions');
                        suggestionsDiv.innerHTML = '';

                        if (data.length > 0) {
                            const ul = document.createElement('ul');
                            ul.className = 'list-group';

                            data.forEach(item => {
                                const li = document.createElement('li');
                                li.className = 'list-group-item';
                                li.textContent = item;
                                li.addEventListener('click', function() {
                                    document.getElementById('search').value = item;
                                    suggestionsDiv.innerHTML = '';
                                });
                                ul.appendChild(li);
                            });

                            suggestionsDiv.appendChild(ul);
                        }
                    });
            } else {
                document.getElementById('suggestions').innerHTML = '';
            }
        });
    </script>
    <?php include 'includes/footer.php'; ?>