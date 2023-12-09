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
      <li><a class="app-menu__item
        <?php
          switch ($_GET['act']) {
            case 'dashboard':
              echo 'active';
              break;
            default:
              break;
          }
        ?>
      " href="index.php?act=dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
            class="app-menu__label">Bảng điều khiển</span></a></li>
      <li><a class="app-menu__item
        <?php
          switch ($_GET['act']) {
            case 'listCategory':
              echo 'active';
              break;
            default:
              break;
          }
        ?>
      " href="index.php?act=listCategory"><i class=" app-menu__icon fa-solid fa-list fa-lg"></i><span
            class="app-menu__label">Quản lý danh mục</span></a></li>
      
      <li><a class="app-menu__item 
        <?php
          switch ($_GET['act']) {
            case 'listCourses':
            case 'add-course':
            case 'editCourse':
            case 'listChapters':
            case 'addChapter':
            case 'editChapter':
            case 'listLessons':
            case 'addLessonToCourse':
            case 'addLesson':
            case 'editLesson':
              echo 'active';
              break;
            default:
              break;
          }
        ?>
      " href="index.php?act=listCourses"><i
            class='app-menu__icon fa-solid fa-film fa-lg'></i><span class="app-menu__label">Quản lý khóa học</span></a>
      <div class="ml-5">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link text-white" href="index.php?act=listChapters">Quản lý chương học</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" href="index.php?act=listLessons">Quản lý bài học</a>
            </li>
          </ul>
        </div>
      </li>

      <li><a class="app-menu__item 
        <?php
          switch ($_GET['act']) {
            case 'userList':
            case 'addUser':
              echo 'active';
              break;
            default:
              break;
          }
        ?>
      " href="index.php?act=userList"><i class='app-menu__icon bx bx-id-card'></i> <span
            class="app-menu__label">Quản lý khách hàng</span></a>
      </li>
      
      

        
      <li><a class="app-menu__item
          <?php
          switch ($_GET['act']) {
              case 'listOrder':
                echo 'active';
                break;
              default:
                break;
            }
          ?>
      " href="index.php?act=listOrder"><i class='app-menu__icon bx bx-task'></i><span
            class="app-menu__label">Quản lý đơn hàng</span></a></li>
      <li><a class="app-menu__item
            <?php
              switch ($_GET['act']) {
                  case 'comment':
                    echo 'active';
                    break;
                  default:
                    break;
                }
            ?>
      " href="index.php?act=comment"><i class='app-menu__icon fa-regular fa-comment fa-lg'></i><span
            class="app-menu__label">Quản lý bình luận
          </span></a></li>
      <li><a class="app-menu__item 
            <?php
              switch ($_GET['act']) {
                  case 'listSlide':
                    echo 'active';
                    break;
                  default:
                    break;
                }
            ?>
      " href="index.php?act=listSlider"><i class='app-menu__icon fa-regular fa-images fa-lg'></i>
          <span class="app-menu__label">Quản lý Slide</span></a></li>

      <li><a class="app-menu__item  
            <?php
            switch ($_GET['act']) {
                case 'baocao':
                  echo 'active';
                  break;
                default:
                  break;
              }
            ?>
      " href="index.php?act=baoCao"><i
            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo số thu</span></a>
      </li>
      
    </ul>
  </aside>
  <main class="app-content">
    <div class="row">
      <div class="col-md-12">
        <div class="app-title">
          <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="#"><b>Bảng điều khiển</b></a></li>
          </ul>
          <div id="clock"></div>
        </div>
      </div>
    </div>
    <div class="row">
      <!--Left-->
      <div class="col-md-12 col-lg-6">
        <div class="row">
          <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
              <div class="info">
                <h4>Tổng số User</h4>
                <p><b><?= $totalUser['totalUser'] ?> khách hàng</b></p>
                <p class="info-tong">Tổng số khách hàng.</p>
              </div>
            </div>
          </div>
          <!-- col-6 -->
          <!-- <div class="col-md-6">
            <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
              <div class="info">
                <h4>Tổng khách hàng / tháng</h4>
                <p><b>56 khách hàng</b></p>
                <p class="info-tong">Tổng số khách hàng đăng ký mới / tháng.</p>
              </div>
            </div>
          </div> -->
          <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
              <div class="info">
                <h4>Khóa học đã bán</h4>
                <p><b><?= $soldCourse['sold']?> khóa học</b></p>
                <p class="info-tong">Số khóa học được bán ra.</p>
              </div>
            </div>
          </div>
          <!-- col-6 -->
          <!-- <div class="col-md-6">
            <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
              <div class="info">
                <h4>Tổng khóa học đã bán / tháng</h4>
                <p><b>1850 khóa học</b></p>
                <p class="info-tong">Tổng số khóa học được bán ra / tháng.</p>
              </div>
            </div>
          </div> -->
          <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
              <div class="info">
                <h4>Tổng doanh thu</h4>
                <p><b><?= number_format($totalRevenue['totalRevenue']) ?> đ</b></p>
                <p class="info-tong">Doanh thu bán khóa học.</p>
              </div>
            </div>
          </div>
          <!-- col-6 -->
          <!-- <div class="col-md-6">
            <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
              <div class="info">
                <h4>Doanh thu / tháng</h4>
                <p><b>247.000.000 đ</b></p>
                <p class="info-tong">Tổng số doanh thu khóa học được bán / tháng.</p>
              </div>
            </div>
          </div> -->
          <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small danger coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
              <div class="info">
                <h4>Số Khóa học</h4>
                <p><b><?= $allCourse['courses'] ?></b></p>
                <p class="info-tong">Tổng số khóa học.</p>
              </div>
            </div>
          </div>
          <!-- col-6 -->
          <!-- <div class="col-md-6">
            <div class="widget-small danger coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
              <div class="info">
                <h4>Khóa học / tháng</h4>
                <p><b>247.000.000 đ</b></p>
                <p class="info-tong">Tổng số doanh thu khóa học được bán / tháng.</p>
              </div>
            </div>
          </div> -->
          <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small yellow coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
              <div class="info">
                <h4>ĐH chờ xác nhận</h4>
                <p><b><?= $orderAwaiting['awating'] ?></b></p>
                <p class="info-tong">Số đơn hàng cần xác nhận.</p>
              </div>
            </div>
          </div>
          <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small purple coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
              <div class="info">
                <h4>Danh mục khóa học</h4>
                <p><b><?= $category['countCategoty'] ?></b></p>
                <p class="info-tong">Tổng số danh mục khóa học.</p>
              </div>
            </div>
          </div>

        </div>
      </div>
      <!--END left-->
      <!--Right-->
      <div class="col-md-12 col-lg-6">
        <div class="row">
          <div class="col-md-12">
            <div class="tile">
              <h3 class="tile-title">Tổng quan dữ liệu</h3>
              <div class="embed-responsive embed-responsive-16by9">
                <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <div class="tile">
              <h3 class="tile-title">Tổng quan dữ liệu tháng</h3>
              <div class="embed-responsive embed-responsive-16by9">
                <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
              </div>
            </div>
          </div>
        </div>

      </div>
      <!--END right-->
    </div>


    <div class="text-center" style="font-size: 13px">
      <p><b>Copyright
          <script type="text/javascript">
            document.write(new Date().getFullYear());
          </script> Phần mềm quản lý khóa học | PolyUni
        </b></p>
    </div>
  </main>
  <script src="./Views/js/jquery-3.2.1.min.js"></script>
  <!--===============================================================================================-->
  <script src="./Views/js/popper.min.js"></script>
  <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
  <!--===============================================================================================-->
  <script src="./Views/js/bootstrap.min.js"></script>
  <!--===============================================================================================-->
  <script src="./Views/js/main.js"></script>
  <!--===============================================================================================-->
  <script src="./Views/js/plugins/pace.min.js"></script>
  <!--===============================================================================================-->
  <script type="text/javascript" src="./Views/js/plugins/chart.js"></script>
  <!--===============================================================================================-->
  <script type="text/javascript">
    var data = {
      labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
      datasets: [
        {
          label: "TỔNG SỐ KHÁCH HÀNG",
          fillColor: "rgba(185, 255, 211, 0.767), 212, 59)", //màu
          strokeColor: "rgb(185, 255, 211)",
          pointColor: "rgb(185, 255, 211)",
          pointStrokeColor: "rgb(185, 255, 211)",
          pointHighlightFill: "rgb(185, 255, 211)",
          pointHighlightStroke: "rgb(185, 255, 211)",
          data: [20, 59, 90, 51, 56, 100, 80, 95, 123, 145, 170, 155, 190]
        },
        {
          label: "TỔNG KHÓA HỌC ĐÃ BÁN",
          fillColor: "rgba(173, 203, 243, 0.651)  ", // màu
          pointColor: "rgb(173, 203, 243)",
          strokeColor: "rgb(173, 203, 243)",
          pointStrokeColor: "rgb(173, 203, 243)",
          pointHighlightFill: "rgb(173, 203, 243)",
          pointHighlightStroke: "rgb(173, 203, 243)",
          data: [63, 122, 13, 13, 6, 144, 234, 89, 55, 109, 146, 240]
        },
        {
          label: "DOANH THU",
          fillColor: "rgba(253, 225, 195, 0.767), 212, 59)", //màu
          strokeColor: "rgb(253, 225, 195)",
          pointColor: "rgb(253, 225, 195)",
          pointStrokeColor: "rgb(253, 225, 195)",
          pointHighlightFill: "rgb(253, 225, 195)",
          pointHighlightStroke: "rgb(253, 225, 195)",
          data: [106, 38, 48, 97, 158, 188, 180, 211, 225, 137, 153, 221]
        },
        {
          label: "KHÓA HỌC",
          fillColor: "rgba(249, 186, 186, 0.767), 212, 59)", //màu
          strokeColor: "rgb(249, 186, 186)",
          pointColor: "rgb(249, 186, 186)",
          pointStrokeColor: "rgb(249, 186, 186)",
          pointHighlightFill: "rgb(249, 186, 186)",
          pointHighlightStroke: "rgb(249, 186, 186)",
          data: [106, 110, 241, 226, 22, 189, 130, 255, 209, 200, 145, 28]
        },
        {
          label: "TRUY CẬP",
          fillColor: "rgba(253, 126, 20, 0.767), 212, 59)", //màu
          strokeColor: "rgb(253, 126, 20)",
          pointColor: "rgb(253, 126, 20)",
          pointStrokeColor: "rgb(253, 126, 20)",
          pointHighlightFill: "rgb(253, 126, 20)",
          pointHighlightStroke: "rgb(253, 126, 20)",
          data: [53, 131, 203, 147, 235, 116, 187, 31, 100, 147, 72, 158]
        },
      ]
    };
    var ctxl = $("#lineChartDemo").get(0).getContext("2d");
    var lineChart = new Chart(ctxl).Line(data);

    var ctxb = $("#barChartDemo").get(0).getContext("2d");
    var barChart = new Chart(ctxb).Bar(data);
  </script>
  <script type="text/javascript">
    //Thời Gian
    function time() {
      var today = new Date();
      var weekday = new Array(7);
      weekday[0] = "Chủ Nhật";
      weekday[1] = "Thứ Hai";
      weekday[2] = "Thứ Ba";
      weekday[3] = "Thứ Tư";
      weekday[4] = "Thứ Năm";
      weekday[5] = "Thứ Sáu";
      weekday[6] = "Thứ Bảy";
      var day = weekday[today.getDay()];
      var dd = today.getDate();
      var mm = today.getMonth() + 1;
      var yyyy = today.getFullYear();
      var h = today.getHours();
      var m = today.getMinutes();
      var s = today.getSeconds();
      m = checkTime(m);
      s = checkTime(s);
      nowTime = h + " giờ " + m + " phút " + s + " giây";
      if (dd < 10) {
        dd = '0' + dd
      }
      if (mm < 10) {
        mm = '0' + mm
      }
      today = day + ', ' + dd + '/' + mm + '/' + yyyy;
      tmp = '<span class="date"> ' + today + ' - ' + nowTime +
        '</span>';
      document.getElementById("clock").innerHTML = tmp;
      clocktime = setTimeout("time()", "1000", "Javascript");

      function checkTime(i) {
        if (i < 10) {
          i = "0" + i;
        }
        return i;
      }
    }
  </script>
</body>

</html>