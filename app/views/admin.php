<?php
session_start();

if (!isset($_SESSION['user'])) {
    header('Location: ../../index.php');
    exit();
}

$username = htmlspecialchars($_SESSION['user']['username']);
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Monitoring ZI Aceh</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="../../public/css/admin.css">
</head>

<body>
    <header>
        <div class="header-content">

            <!-- KIRI: Logo + Judul (digabung) -->
            <div class="header-left">
                <!-- Logo BPS -->
                <div class="logo-container">
                    <img src="../../public/img/LOGO BPS.png" alt="" style="width: 55px;">
                </div>

                <!-- Icon + Judul -->
                <div class="title-section">
                    <div>
                        <div class="header-title">MONITORING ZI ACEH</div>
                        <div class="header-subtitle">Sistem Monitoring Zona Integritas</div>
                    </div>
                </div>
            </div>

            <!-- KANAN: Button Area -->
            <div class="header-right" id="userDropdown">
                <div class="header-buttons-container" onclick="toggleDropdown('dropdown1')">
                    <div class="user-info">
                        <div class="user-details dropdown-btn">
                            <span class="user-role"><?php echo $username ?></span>
                        </div>
                        <i class="fas fa-chevron-down dropdown-arrow"></i>
                        <!-- Dropdown Menu -->
                        <div class="dropdown-menu dropdown-content" id="dropdown1">
                            <a href="profile.php" class="dropdown-item">
                                <i class="fas fa-user-circle"></i>
                                <span>My Profile</span>
                            </a>
                            <a href="dashboard.php" class="dropdown-item">
                                <i class="fas fa-user-shield"></i>
                                <span>dahsboard</span>
                            </a>
                            </a>
                            <a href="../controllers/logout.php" class="dropdown-item logout">
                                <i class="fas fa-sign-out-alt"></i>
                                <span>Sign Out</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="container">
        <!-- Statistics Cards -->
        <div class="stats-grid-adm">
            <div class="stat-card">
                <div class="stat-icon-adm">
                    <i class="fas fa-users"></i>
                </div>
                <div class="stat-number" id="totalUsers"></div>
                <div class="stat-label">Total Pengguna</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon-adm">
                    <i class="fas fa-crown"></i>
                </div>
                <div class="stat-number" id="adminCount"></div>
                <div class="stat-label">Total Admin</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon-adm">
                    <i class="fas fa-user"></i>
                </div>
                <div class="stat-number" id="userCount"></div>
                <div class="stat-label">Total Pegawai</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon-adm">
                    <i class="fas fa-calendar-day"></i>
                </div>
                <div class="stat-number" id="pemeriksaCount"></div>
                <div class="stat-label">Total Petugas</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon-adm">
                    <i class="fas fa-calendar-day"></i>
                </div>
                <div class="stat-number" id="todayUsers"></div>
                <div class="stat-label">Total User Hari Ini</div>
            </div>
        </div>

        <!-- Page Header -->
        <div class="page-header fade-in">
            <div class="page-title">
                <i class="fas fa-users-cog"></i>
                Manajemen Pengguna
            </div>
            <div class="page-actions">
                <button class="btn" onclick="openModal('add')">
                    <i class="fas fa-plus"></i>
                    Tambah Pengguna
                </button>
            </div>
        </div>

        <!-- Filters Container -->
        <div class="filters-container fade-in">
            <div class="filters-content">
                <div class="filter-group" style="flex: 2;">
                    <label class="filter-label">
                        <i class="fas fa-search"></i> Cari Pengguna
                    </label>
                    <input type="text" id="searchInput" class="filter-input"
                        placeholder="Cari berdasarkan username, nama, atau email...">
                </div>

                <div class="filter-group">
                    <label class="filter-label">
                        <i class="fas fa-filter"></i> Filter Role
                    </label>
                    <select id="roleFilter" class="filter-input">
                        <option value="all">Semua Role</option>
                        <option value="1">Admin Provinsi</option>
                        <option value="2">Admin Kabupaten/Kota</option>
                        <option value="3">Operator</option>
                        <option value="4">Pegawai</option>
                        <option value="5">Pemeriksa</option>
                    </select>
                </div>

                <!-- Filter Actions -->
                <div class="filter-actions">
                    <button class="btn-filter" id="applyFilters">
                        <i class="fas fa-search"></i>
                        <span>Filter</span>
                    </button>
                    <button class="btn-reset" id="resetFilters">
                        <i class="fas fa-undo"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Users Table -->
        <div class="table-container fade-in">
            <div class="table-header">
                <i class="fas fa-table"></i>
                <h3>Daftar Pengguna Sistem</h3>
            </div>

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th>Dibuat</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody id="userTableBody">
                        <!-- Table content will be populated by JavaScript -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modal Pop-up -->
    <div class="modal" id="userModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="modalTitle">Tambah Pengguna Baru</h3>
                <span class="close" onclick="closeModal()">
                    <i class="fas fa-times"></i>
                </span>
            </div>

            <div class="modal-body">
                <form id="userForm" method="post">
                    <input type="hidden" id="userId" name="id_pengguna" value="" />
                    <input type="hidden" name="action" value="add" id="action">
                    <!-- Tambahkan ke dalam <form> tepat setelah input hidden -->
                    <div class="form-group">
                        <label><i class="fas fa-user input-icon"></i>Username</label>
                        <input type="text" name="username" placeholder="Masukkan username unik" id="username" required />
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-envelope input-icon"></i>Email
                            Address</label>
                        <input type="email" name="email" placeholder="user@example.com" id="email" required />
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-lock input-icon"></i>Password</label>
                        <input type="password" name="password" placeholder="Minimal 8 Karakter" id="pass" required />
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-user-tag input-icon"></i>Role
                            Pengguna</label>
                        <select name="role" id="role" required>
                            <option value="">-- Pilih Role Pengguna --</option>
                            <option value="1">Admin provinsi</option>
                            <option value="2">Admin Kabupaten/Kota</option>
                            <option value="3">Operator</option>
                            <option value="4">Pegawai</option>
                            <option value="5">Pemeriksa</option>
                        </select>
                    </div>
                </form>
            </div>

            <div class="form-actions">
                <button type="button" class="btn-cancel" onclick="closeModal()">
                    <i class="fas fa-times"></i> Batal
                </button>
                <button type="submit" form="userForm" class="btn-submit">
                    <i class="fas fa-paper-plane"></i> Simpan Data
                </button>
            </div>
        </div>
    </div>

    <script src="../../public/js/admin.js"></script>

</body>

</html>