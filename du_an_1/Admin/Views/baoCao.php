<!DOCTYPE html>
<html lang="en">

<head>
  <title>Danh sách nhân viên | Quản trị Admin</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="./Views/css/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <!-- Font-icon css-->
  <link rel="stylesheet" href="../Public/fontawesome-free-6.4.2-web/css/all.css" />
  <link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

</head>

<body onload="time()" class="app sidebar-mini rtl">
  <!-- Navbar-->
  <header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
      aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">


      <!-- User Menu-->
      <li><a class="app-nav__item" href="index.php?act=logout"><i class='bx bx-log-out bx-rotate-180'></i> </a>

      </li>
    </ul>
  </header>
  <!-- Sidebar menu-->
  <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
  <aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="/images/hay.jpg" width="50px"
        alt="User Image">
      <div>
        <p class="app-sidebar__user-name"><b>Anonymous</b></p>
        <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
      </div>
    </div>
    <hr>
    <ul class="app-menu">
      <li><a class="app-menu__item haha" href="phan-mem-ban-hang.html"><i class='app-menu__icon bx bx-film'></i>
          <span class="app-menu__label">Quản lý Slide</span></a></li>
      <li><a class="app-menu__item active" href="index.php?act=dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
            class="app-menu__label">Bảng điều khiển</span></a></li>
      <li><a class="app-menu__item" href="index.php?act=listCategory"><i class=" app-menu__icon fa-solid fa-list fa-lg"></i><span
            class="app-menu__label">Quản lý danh mục</span></a></li>
      <li><a class="app-menu__item " href="index.php?act=userList"><i class='app-menu__icon bx bx-id-card'></i> <span
            class="app-menu__label">Quản lý khách hàng</span></a></li>
      <li><a class="app-menu__item" href="index.php?act=listCourses"><i class='app-menu__icon bx bx-purchase-tag-alt'></i><span 
            class="app-menu__label">Quản lý khóa học</span></a>
      </li>
      <li><a class="app-menu__item" href="index.php?act=listOrder"><i class='app-menu__icon bx bx-task'></i><span
            class="app-menu__label">Quản lý đơn hàng</span></a></li>
      <li><a class="app-menu__item" href="index.php?act=listComment"><i class='app-menu__icon bx bx-run'></i><span
            class="app-menu__label">Quản lý bình luận
          </span></a></li>
      <li><a class="app-menu__item" href="#"><i
            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo số thu</span></a>
      </li>
    </ul>
  </aside>
  <main class="app-content">
    <div class="row">
      <div class="col-md-12">
        <div class="app-title">
          <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="#"><b>Báo cáo doanh thu</b></a></li>
          </ul>
          <div id="clock"></div>
        </div>
      </div>
    </div>

        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <div>
                        <h3 class="tile-title">KHÓA HỌC BÁN CHẠY</h3>
                    </div>
                    <div class="tile-body">
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    <th>ID Khóa học</th>
                                    <th>Tên khóa học</th>
                                    <th>Lượt mua</th>
                                    <th>Danh mục</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                foreach($courses as $course){
                                    extract($course);
                                    echo"
                                    <tr>
                                        <td>#$course_id</td>
                                        <td>$course_name</td>
                                        <td>$course_members</td>
                                        <td>$category_name</td>
                                    </tr>
                                    ";
                                }
                                ?>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
                <form action="../Models/exportExcel.php" method="post" class="col-md-12">
                    <div class="tile">
                        <div>
                            <h3 class="tile-title">DOANH THU KHOÁ HỌC</h3>
                        </div>
                        <div class="row element-button d-flex justify-content-between">
                            <div class="col-sm-2">
                                <button type="submit" name="exportExcel" class="btn btn-excel btn-xl" title="Xuất Excel">
                                <i class="fas fa-file-excel">
                                </i> Xuất Excel</button>
                            </div>
                            <div style="width: auto;">
                                <div class="input-group">
                                    <input type="date" name="dateStart" id="dateStart" class="form-control" placeholder="Username"
                                        aria-label="Username">
                                    <span class="input-group-text">Đến ngày</span>
                                    <input type="date" name="dateEnd" id="dateEnd" class="form-control" placeholder="Server" aria-label="Server">
                                    <button type="button" name="" onclick="searchDate()" class="btn btn-primary">Xem</button>
                                </div>
                            </div>
                        </div>
                        <div class="tile-body">
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>    
                                            <th>STT</th>
                                            <th>ID đơn hàng</th>
                                            <th>Khách hàng</th>
                                            <th>Tên khóa học</th>
                                            <th>Ngày mua</th>
                                            <th>Giá</th>
                                    </tr>
                                </thead>
                                <tbody id="showDate">
                                    <?php
                                    $i = 0;
                                    foreach ($doanhThu as $dt){
                                        extract($dt);
                                        ++$i;
                                        echo"
                                        <tr>
                                            <td>{$i}</td>
                                            <td>#$order_id</td>
                                            <td>$user_name</td>
                                            <td>$course_name</td>
                                            <td>$order_date</td>
                                            <td>$course_price đ</td>
                                        </tr>
                                        ";
                                    }
                                    ?>
                                    <tr>
                                        <th colspan="5">Tổng cộng:</th>
                                        <td>104.890.000 đ</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        <div class="row">
            <div class="col-md-6">
                <div class="tile">
                    <h3 class="tile-title">DỮ LIỆU HÀNG THÁNG</h3>
                    <div class="embed-responsive embed-responsive-16by9">
                        <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="tile">
                    <h3 class="tile-title">THỐNG KÊ DOANH SỐ</h3>
                    <div class="embed-responsive embed-responsive-16by9">
                        <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
                    </div>
                </div>
            </div>
        </div>

        
    </main>
    <script>
        function searchDate() {
            let dateStart = document.getElementById('dateStart').value;
            console.log(dateStart);
            let dateEnd = document.getElementById('dateEnd').value;
            let showDate = document.getElementById('showDate');
            console.log(dateEnd);

            if(dateStart != "" && dateEnd != ""){
                let xmlHttp = new XMLHttpRequest();
                xmlHttp.onload = function () {
                    showDate.innerHTML = xmlHttp.responseText;
                }

                xmlHttp.open('POST', '../Models/doanhThu.php');
                xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xmlHttp.send(`dateStart=${dateStart}&dateEnd=${dateEnd}`);
            }else{
                showDate.innerHTML = "";
            }
        }
    </script>

    <!-- Essential javascripts for application to work-->
    <script src="./views/js/jquery-3.2.1.min.js"></script>
    <script src="./views/js/popper.min.js"></script>
    <script src="./views/js/bootstrap.min.js"></script>
    <script src="./views/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="./views/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="./views/js/plugins/chart.js"></script>
    <script type="text/javascript">
    var data = {
      labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
      datasets: [{
          label: "Dữ liệu đầu tiên",
          fillColor: "rgba(255, 255, 255, 0.158)",
          strokeColor: "black",
          pointColor: "rgb(220, 64, 59)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "green",
          data: [20, 59, 90, 51, 56, 100, 40, 60, 78, 53, 33, 81]
        },
        {
          label: "Dữ liệu kế tiếp",
          fillColor: "rgba(255, 255, 255, 0.158)",
          strokeColor: "rgb(220, 64, 59)",
          pointColor: "black",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "green",
          data: [48, 48, 49, 39, 86, 10, 50, 70, 60, 70, 75, 90]
        }
      ]
    };


        var ctxl = $("#lineChartDemo").get(0).getContext("2d");
        var lineChart = new Chart(ctxl).Line(data);

        var ctxb = $("#barChartDemo").get(0).getContext("2d");
        var barChart = new Chart(ctxb).Bar(data);
    </script>
    <!-- Google analytics script-->
    <script type="text/javascript">
        if (document.location.hostname == 'pratikborsadiya.in') {
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
            ga('create', 'UA-72504830-1', 'auto');
            ga('send', 'pageview');
        }
    </script>
</body>

</html>