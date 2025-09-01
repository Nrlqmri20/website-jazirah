<?php
session_start();

if (!isset($_SESSION['user'])) {
    // Jika pengguna belum login, arahkan ke halaman login
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
    <title>My Profile - Monitoring ZI Aceh</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="../../public/css/dashboard.css">
    <link rel="stylesheet" href="../../public/css/profil.css">

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
                            <i class="fas fa-chevron-down dropdown-arrow"></i>
                        </div>
                        <!-- Dropdown Menu -->
                        <div class="dropdown-menu dropdown-content" id="dropdown1">
                            <a href="admin.php" class="dropdown-item">
                                <i class="fas fa-user-circle"></i>
                                <span>Admin</span>
                            </a>
                            <a href="dashboard.php" class="dropdown-item">
                                <i class="fas fa-user-shield"></i>
                                <span>Dashboard</span>
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

    <div class="profile-container">
        <!-- Breadcrumb -->
        <div class="breadcrumb">
            <a href="dashboard.php"><i class="fas fa-home"></i> Dashboard</a>
            <i class="fas fa-chevron-right"></i>
            <span>My Profile</span>
        </div>

        <?php if (isset($success_message)): ?>
            <div class="success-message">
                <i class="fas fa-check-circle"></i>
                <?php echo $success_message; ?>
            </div>
        <?php endif; ?>

        <!-- Profile Header -->
        <div class="profile-header">
            <div class="avatar-section">
                <div class="avatar-container" onclick="toggleAvatarMenu(event)">
                    <img id="avatarImage" src="" alt="Foto Profil" class="hidden">
                    <div id="avatarDefault" class="avatar-placeholder">A</div>

                    <!-- Menu dropdown avatar -->
                    <div id="avatarMenu" class="avatar-menu hidden">
                        <label for="avatarInput">Upload Foto</label>
                        <button type="button" onclick="viewAvatar()">Lihat Foto</button>
                        <button type="button" onclick="deleteAvatar()">Hapus Foto</button>
                    </div>
                </div>

                <!-- input file tetap ada, tapi disembunyikan -->
                <input type="file" id="avatarInput" class="hidden" accept="image/*">
            </div>

            <!-- Modal untuk lihat foto fullscreen -->
            <div id="avatarModal" class="avatar-modal" onclick="this.style.display='none'">
                <img id="modalAvatar" src="">
            </div>

            <div class="profile-info">
                <div class="profile-name"></div>
                <div class="profile-role"></div>

                <div class="profile-stats">
                    <div class="stat-item">
                        <div class="stat-number" id="statTotal">0</div>
                        <div class="stat-label">Total Kegiatan</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number" id="statAvg">0%</div>
                        <div class="stat-label">Avg. Progress</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number" id="statCompleted">0</div>
                        <div class="stat-label">Completed</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Profile Tabs -->
        <div class="profile-tabs">
            <button class="tab-button active" onclick="switchTab('personal')">
                <i class="fas fa-user"></i> Informasi Personal
            </button>
            <button class="tab-button" onclick="switchTab('settings')">
                <i class="fas fa-cog"></i> Pengaturan Akun
            </button>
            <!-- <button class="tab-button" onclick="switchTab('activity')">
                <i class="fas fa-history"></i> Aktivitas Terakhir
            </button> -->
        </div>

        <!-- Tab Content: Personal Information -->
        <div id="personal" class="tab-content active">
            <div class="profile-card">
                <h3><i class="fas fa-id-card"></i> Informasi Personal</h3>

                <form method="post" id="personalForm">
                    <input type="hidden" name="action" value="update_profile">

                    <div class="form-row">
                        <div class="form-group">
                            <label><i class="fas fa-user input-icon"></i> Nama Lengkap</label>
                            <input type="text" name="nama_lengkap" value="" required>
                        </div>
                        <div class="form-group">
                            <label><i class="fas fa-at input-icon"></i> Username</label>
                            <input type="text" name="username" value="" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label><i class="fas fa-envelope input-icon"></i> Email</label>
                            <input type="email" name="email" value="" required>
                        </div>
                        <div class="form-group">
                            <label><i class="fas fa-phone input-icon"></i> Nomor Telepon</label>
                            <input type="tel" name="nomor_telepon" value="" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label><i class="fas fa-briefcase input-icon"></i> Jabatan</label>
                            <input type="text" name="jabatan" value="" required>
                        </div>
                        <div class="form-group">
                            <label><i class="fas fa-building input-icon"></i> Bidang/Bagian</label>
                            <input type="text" name="bidang" value="" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label><i class="fas fa-map-marker-alt input-icon"></i> Satker</label>
                            <select name="satker" required>
                                <option value="1100">BPS Provinsi Aceh</option>
                                <option value="1101">BPS Kabupaten Simeulue</option>
                                <option value="1102">BPS Kabupaten Aceh Singkil</option>
                                <option value="1103">BPS Kabupaten Aceh Selatan</option>
                                <option value="1104">BPS Kabupaten Aceh Tenggara</option>
                                <option value="1105">BPS Kabupaten Aceh Timur</option>
                                <option value="1106">BPS Kabupaten Aceh Tengah</option>
                                <option value="1107">BPS Kabupaten Aceh Barat</option>
                                <option value="1108">BPS Kabupaten Aceh Besar</option>
                                <option value="1109">BPS Kabupaten Pidie</option>
                                <option value="1110">BPS Kabupaten Bireuen</option>
                                <option value="1111">BPS Kabupaten Aceh Utara</option>
                                <option value="1112">BPS Kabupaten Aceh Barat Daya</option>
                                <option value="1113">BPS Kabupaten Gayo Lues</option>
                                <option value="1114">BPS Kabupaten Aceh Tamiang</option>
                                <option value="1115">BPS Kabupaten Nagan Raya</option>
                                <option value="1116">BPS Kabupaten Aceh Jaya</option>
                                <option value="1117">BPS Kabupaten Bener Meriah</option>
                                <option value="1118">BPS Kabupaten Pidie Jaya</option>
                                <option value="1171">BPS Kota Banda Aceh</option>
                                <option value="1172">BPS Kota Sabang</option>
                                <option value="1173">BPS Kota Langsa</option>
                                <option value="1174">BPS Kota Lhokseumawe</option>
                                <option value="1175">BPS Kota Subulussalam</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label><i class="fas fa-calendar-alt input-icon"></i> Tanggal Bergabung</label>
                            <input type="date" name="tanggal_gabung" value="" readonly>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn-submit">
                            <i class="fas fa-save"></i> Simpan Perubahan
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Tab Content: Account Settings -->
        <div id="settings" class="tab-content">
            <div class="profile-card">
                <h3><i class="fas fa-shield-alt"></i> Keamanan Akun</h3>

                <form method="post">
                    <input type="hidden" name="action" value="change_password">

                    <div class="form-group">
                        <label><i class="fas fa-lock input-icon"></i> Password Lama</label>
                        <div class="input-wrapper">
                            <input type="password" name="current_password" id="currentPassword" placeholder="Masukkan password saat ini"
                                required>
                            <i class="fas fa-eye password-toggle" data-target="currentPassword"></i>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label><i class="fas fa-key input-icon"></i> Password Baru</label>
                            <div class="input-wrapper">
                                <input type="password" name="new_password" id="newPassword" placeholder="Masukkan password baru" required>
                                <i class="fas fa-eye password-toggle" data-target="newPassword"></i>
                            </div>
                        </div>
                        <div class="form-group">
                            <label><i class="fas fa-check-circle input-icon"></i> Konfirmasi Password</label>
                            <input type="password" name="confirm_password" placeholder="Konfirmasi password baru"
                                required>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn-submit">
                            <i class="fas fa-shield-alt"></i> Ubah Password
                        </button>
                    </div>
                </form>
            </div>
        
    <script src="../../public/js/profil.js"></script>
</body>

</html>