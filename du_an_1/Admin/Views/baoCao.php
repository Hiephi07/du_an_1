
  <!-- Begin Main -->
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

