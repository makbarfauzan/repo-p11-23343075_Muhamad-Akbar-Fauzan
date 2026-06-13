# repo-p11-23343075_Muhamad-Akbar-Fauzan

# REST API Integration Architecture with Repository Pattern

## Deskripsi Proyek

Proyek ini dibuat sebagai tugas mata kuliah **Mobile Programming Lanjutan** untuk mempelajari implementasi **Repository Pattern** pada aplikasi Flutter yang menggunakan REST API.

Tujuan utama proyek ini adalah memahami bagaimana memisahkan tanggung jawab antar komponen aplikasi agar kode lebih mudah dipelihara, diuji, dan dikembangkan pada lingkungan produksi.

---

## Alasan Memilih Repository Pattern

Repository Pattern dipilih karena mampu memisahkan logika pengambilan data dari tampilan (UI).

Keuntungan penggunaan Repository Pattern:

* Memisahkan UI dari sumber data.
* Memudahkan penggantian sumber data (API atau cache lokal).
* Memudahkan pengujian (testing).
* Mengurangi ketergantungan antar komponen.
* Mendukung pengembangan aplikasi skala besar.

---

## Struktur Arsitektur

```text
UI Layer
    ↓
Repository Interface
    ↓
Repository Implementation
   ↙            ↘
Remote Data     Local Data
Source          Source
    ↓              ↓
 REST API      Local Storage
```

---

## Diagram Interaksi Komponen

```text
User
 ↓
Flutter UI
 ↓
Repository
 ↓
Repository Implementation
 ├── Remote Data Source
 │      ↓
 │    REST API
 │
 └── Local Data Source
        ↓
   SharedPreferences
```

Alur kerja:

1. UI meminta data ke Repository.
2. Repository menentukan sumber data yang digunakan.
3. Jika data tersedia di cache lokal, data dapat diambil dari Local Data Source.
4. Jika tidak tersedia, data diambil dari Remote Data Source melalui REST API.
5. Data yang diperoleh dapat disimpan kembali ke cache lokal.
6. Data dikembalikan ke UI untuk ditampilkan kepada pengguna.

---

## Komponen yang Diimplementasikan

### 1. Remote Data Source

Tanggung Jawab:

* Mengambil data dari REST API.
* Mengirim request HTTP menggunakan Dio.
* Melakukan parsing response JSON.

File:

```text
lib/data/remote/
```

---

### 2. Local Data Source

Tanggung Jawab:

* Menyimpan data ke penyimpanan lokal.
* Membaca data cache.
* Mendukung penggunaan offline sederhana.

File:

```text
lib/data/local/
```

---

### 3. Repository Implementation

Tanggung Jawab:

* Menghubungkan Remote Data Source dan Local Data Source.
* Menentukan sumber data yang digunakan.
* Menyediakan data bagi UI.

File:

```text
lib/data/repository/
```

---

### 4. Dio Auth Interceptor

Tanggung Jawab:

* Menambahkan token autentikasi ke setiap request.
* Menangani error autentikasi.
* Mengelola proses refresh token.

File:

```text
lib/core/network/
```

---

## Pembagian Tugas Anggota

| Nama Anggota | Tanggung Jawab            |
| ------------ | ------------------------- |
| Anggota 1    | Remote Data Source        |
| Anggota 2    | Local Data Source         |
| Anggota 3    | Repository Implementation |
| Anggota 4    | Dio Auth Interceptor      |

---

## Workflow GitHub

Proyek ini dikerjakan menggunakan GitHub Flow.

### Branch

* main
* feature/remote-data-source
* feature/local-data-source
* feature/repository-implementation
* feature/auth-interceptor

### Alur Kerja

1. Membuat Issue.
2. Assign Issue ke anggota.
3. Membuat branch sesuai tugas.
4. Implementasi komponen.
5. Commit dan Push.
6. Membuat Pull Request.
7. Review oleh minimal 1 anggota tim.
8. Merge ke branch main.

---

## GitHub Issues

Issue yang dibuat:

* Implement Remote Data Source
* Implement Local Data Source
* Implement Repository Pattern
* Implement Dio Auth Interceptor

---

## Panduan Setup

Clone repository:

```bash
git clone <repository-url>
```

Masuk ke folder project:

```bash
cd project-name
```

Install dependency:

```bash
flutter pub get
```

Jalankan aplikasi:

```bash
flutter run
```

---

## Teknologi yang Digunakan

* Flutter
* Dart
* Dio
* SharedPreferences
* GitHub Projects
* GitHub Issues
* GitHub Pull Request

---

## Tujuan Pembelajaran

Melalui proyek ini, tim mempelajari:

* Repository Pattern
* REST API Integration
* Dio Interceptor
* Local Data Storage
* GitHub Collaboration Workflow
* Code Review Process
* Project Management menggunakan GitHub Projects

---

## Lisensi

Digunakan untuk keperluan pembelajaran pada mata kuliah Mobile Programming Lanjutan.
