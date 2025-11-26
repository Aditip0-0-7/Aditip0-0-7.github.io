<?php
// กำหนดตัวแปรข้อมูลพื้นฐานของนักศึกษา
$university = "มหาวิทยาลัยตัวอย่าง";           // ชื่อมหาวิทยาลัย
$faculty = "คณะวิทยาการคอมพิวเตอร์";          // ชื่อคณะ
$major = "สาขาเทคโนโลยีสารสนเทศ";             // ชื่อสาขา
$student_name = "ชื่อนักศึกษา อดิทีปย์ นามสกุล ยมศรีเคน"; // ชื่อ–นามสกุลนักศึกษา
$bio = "สวัสดีครับ ผมเป็นนักศึกษาที่ชอบการเขียนโปรแกรม และสนใจด้านเว็บเทคโนโลยี"; // ข้อความแนะนำตัว
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>แนะนำตัวนักศึกษา</title>

    <style>
        /* ตั้งค่ารูปแบบพื้นหลังและฟอนต์ของหน้าเว็บ */
        body {
            font-family: Arial, sans-serif;   /* ฟอนต์หลัก */
            background: #f3f3f3;              /* สีพื้นหลัง */
            margin: 0;
            padding: 0;
        }

        /* กล่องแสดงข้อมูลหลัก */
        .container {
            width: 60%;                       /* กำหนดความกว้าง */
            margin: 40px auto;                /* จัดกึ่งกลางหน้า */
            background: #ffffff;              /* สีพื้น */
            padding: 20px;
            border-radius: 10px;              /* มุมโค้ง */
            box-shadow: 0 0 10px rgba(0,0,0,0.1); /* เงา */
        }

        /* หัวข้อใหญ่ */
        h1 {
            text-align: center;
            color: #333;
        }

        /* ส่วนแสดงข้อมูล */
        .info {
            font-size: 18px;
            line-height: 1.8;                 /* ความสูงบรรทัด */
            margin-top: 20px;
        }

        /* ข้อความหัวข้อ เช่น มหาวิทยาลัย, คณะ */
        .info span {
            font-weight: bold;                /* ตัวหนา */
            color: #555;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>ข้อมูลแนะนำตัวนักศึกษา</h1>

        <div class="info">
            <!-- แสดงข้อมูลจากตัวแปร PHP -->
            <p><span>มหาวิทยาลัย:</span> <?php echo $university; ?></p>
            <p><span>คณะ:</span> <?php echo $faculty; ?></p>
            <p><span>สาขา:</span> <?php echo $major; ?></p>
            <p><span>ชื่อ-นามสกุล:</span> <?php echo $student_name; ?></p>
            <p><span>ข้อมูลแนะนำตัว:</span> <?php echo $bio; ?></p>
        </div>
    </div>
</body>
</html>
