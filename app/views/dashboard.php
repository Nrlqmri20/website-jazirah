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
    <title>Dashboard Monitoring ZI Aceh</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="../../public/css/dashboard.css">
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
                            <a href="admin.php" class="dropdown-item">
                                <i class="fas fa-user-shield"></i>
                                <span>Admin</span>
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
        <div class="stats-grid-dash">
            <div class="stat-card">
                <div class="stat-icon-dash">
                    <i class="fas fa-tasks"></i>
                </div>
                <div class="stat-number" id="totalTasks">0</div>
                <div class="stat-label">Total Kegiatan</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon-dash">
                    <i class="fas fa-clock"></i>
                </div>
                <div class="stat-number" id="ongoingTasks">0</div>
                <div class="stat-label">Sedang Berjalan</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon-dash">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="stat-number" id="completedTasks">0</div>
                <div class="stat-label">Selesai</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon-dash">
                    <i class="fas fa-percentage"></i>
                </div>
                <div class="stat-number" id="avgProgress">0%</div>
                <div class="stat-label">Rata-rata Progress</div>
            </div>
        </div>

        <!-- KOMPONEN FILTER -->
        <div class="filter-container">
            <div class="filter-header">
                <i class="fas fa-filter"></i>
                <h3>Pencarian Data</h3>
            </div>

            <div class="filter-grid">
                <!-- Search Input -->
                <div class="filter-group">
                    <label>
                        <i class="fas fa-search input-icon"></i>
                        Pencarian
                    </label>
                    <input type="text" class="search-input" id="searchInput"
                        placeholder="Cari berdasarkan rencana kerja, output, PJK..." autocomplete="off">
                </div>

                <!-- Kabupaten Filter -->
                <div class="filter-group">
                    <label>
                        <i class="fas fa-map-marker-alt input-icon"></i>
                        Kabupaten
                    </label>
                    <select class="filter-select" id="kabupatenFilter">
                        <option value="">-- Pilih Satker --</option>
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

                <!-- Tahun Filter -->
                <div class="filter-group">
                    <label>
                        <i class="fas fa-calendar-alt input-icon"></i>
                        Tahun
                    </label>
                    <select class="filter-select" id="tahunFilter">
                        <option value="">Semua Tahun</option>
                        <option value="2024">2023</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                        <option value="2026">2026</option>
                    </select>
                </div>

                <!-- Filter Actions -->
                <div class="filter-actions">
                    <button class="btn-filter" onclick="applyFilters()">
                        <i class="fas fa-search"></i>
                        <span>Filter</span>
                    </button>
                    <button class="btn-reset" onclick="resetFilters()">
                        <i class="fas fa-undo"></i>
                    </button>
                </div>
            </div>

            <!-- Active Filters Display -->
            <div class="active-filters" id="activeFilters">
                <div class="active-filters-label">Filter Aktif:</div>
                <div class="filter-tags" id="filterTags"></div>
            </div>
        </div>

        <div class="top-bar">
            <div class="page-title">Data Monitoring</div>
            <button class="btn" onclick="openModal()">
                <i class="fas fa-plus-circle"></i> Tambah Data
            </button>
        </div>

        <div class="table-container">
            <div class="table-header">
                <i class="fas fa-table"></i>
                Data Kegiatan Zona Integritas
            </div>
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Rencana Kerja</th>
                            <th>Rencana Aksi</th>
                            <th>Output</th>
                            <th>PJK</th>
                            <th>Target Bulan</th>
                            <th>Link Bukti</th>
                            <th>Progress</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody id="dashboardTable">
                        <tr>
                            <td colspan="9" class="loading">
                                <div class="spinner"></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modal Pop-up -->
    <div class="modal" id="formModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Input Data Monitoring</h3>
                <span class="close" onclick="closeModal()">
                    <i class="fas fa-times"></i>
                </span>
            </div>

            <div class="modal-body">
                <form id="inputForm" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="id" value="">
                    <input type="hidden" name="sub_deskripsi" value="">

                    <!-- Tambahkan ke dalam <form> tepat setelah input hidden -->
                    <div class="form-group">
                        <label><i class="fas fa-building input-icon"></i> Kode Satker</label>
                        <select name="kode_satker" required>
                            <option value="">-- Pilih Satker --</option>
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
                        <label><i class="fas fa-key input-icon"></i> ID Deskripsi</label>
                        <input type="text" name="id_deskripsi" placeholder="Contoh: A.1.I.i.a" required>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-clipboard-list input-icon"></i> Rencana Kerja</label>
                        <input type="text" name="rencanaKerja" placeholder="Masukkan rencana kerja..." required>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-tasks input-icon"></i> Rencana Aksi</label>
                        <textarea name="rencanaAksi" placeholder="Masukkan rencana aksi..." required
                            rows="3"></textarea>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-bullseye input-icon"></i> Output</label>
                        <input type="text" name="output" placeholder="Masukkan output yang diharapkan..." required>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-user-tie input-icon"></i> PJK (Penanggung Jawab Kegiatan)</label>
                        <input type="text" name="pjk" placeholder="Masukkan nama PJK..." required>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-calendar-alt input-icon"></i> Target Bulan</label>
                        <input type="month" name="target_bulan" required>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-link input-icon"></i> Link Bukti</label>
                        <input type="url" name="link" placeholder="https://example.com/bukti" required>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-chart-line input-icon"></i> Progress (%)</label>
                        <input type="number" name="progress" min="0" max="100" value="0" placeholder="0-100" required>
                    </div>
                </form>
            </div>

            <div class="form-actions">
                <button type="button" class="btn-cancel" onclick="closeModal()">
                    <i class="fas fa-times"></i> Batal
                </button>
                <button type="submit" form="inputForm" class="btn-submit">
                    <i class="fas fa-paper-plane"></i> Simpan Data
                </button>
            </div>
        </div>
    </div>

    <!-- Edit modal -->
    <div id="modal-edit" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Edit Data Monitoring</h3>
                <span class="close" onclick="tutupModalEdit()">&times;</span>
            </div>

            <div class="modal-body">
                <form id="form-edit" method="post">
                    <input type="hidden" name="id" id="edit-id">

                    <div class="form-group">
                        <label><i class="fas fa-key input-icon"></i> ID Deskripsi</label>
                        <input type="text" id="edit-id_deskripsi" name="id_deskripsi" placeholder="Contoh: A.1.I.i.a" required>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-clipboard-list input-icon"></i> Rencana Kerja</label>
                        <input type="text" id="edit-rencana_kerja" name="rencana_kerja" placeholder="Masukkan rencana kerja..." required>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-tasks input-icon"></i> Rencana Aksi</label>
                        <textarea id="edit-rencana_aksi" name="rencana_aksi" placeholder="Masukkan rencana aksi..." required rows="3"></textarea>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-bullseye input-icon"></i> Output</label>
                        <input type="text" id="edit-output" name="output" placeholder="Masukkan output yang diharapkan..." required>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-user-tie input-icon"></i> PJK (Penanggung Jawab Kegiatan)</label>
                        <input type="text" id="edit-pjk" name="pjk" placeholder="Masukkan nama PJK..." required>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-calendar-alt input-icon"></i> Target Bulan</label>
                        <input type="month" id="edit-target_bulan" name="target_bulan" required>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-link input-icon"></i> Link Bukti</label>
                        <input type="url" id="edit-link" name="link" placeholder="https://example.com/bukti">
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-chart-line input-icon"></i> Progress (%)</label>
                        <input type="number" id="edit-progress" name="progress" min="0" max="100" placeholder="0-100" required>
                    </div>
                </form>
            </div>

            <div class="form-actions">
                <button type="button" class="btn-cancel" onclick="tutupModalEdit()">
                    <i class="fas fa-times"></i> Batal
                </button>
                <button type="submit" form="form-edit" class="btn-submit">
                    <i class="fas fa-save"></i> Simpan Perubahan
                </button>
            </div>
        </div>
    </div>

    <script src="../../public/js/dashboard.js"></script>
</body>

</html>