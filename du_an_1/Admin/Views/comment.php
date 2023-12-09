    <main class="app-content">
      <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item active"><a href="#"><b>Quản lý bình luận</b></a></li>
        </ul>
        <div id="clock"></div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
                <!--  -->
              <!-- <form action="index.php?act=comment" method="post"> -->
              <table class="table table-hover table-bordered" id="sampleTable">
                <thead>
                  <tr>
                    <th>ID Comment</th>
                    <th>Username</th>
                    <th>Bình luận</th>
                    <th>Ngày bình luận</th>
                    <th>Khóa học</th>
                    <th>Chức năng</th>
                  </tr>
                </thead>
                <tbody>
                  <?php 
                  foreach($load_all_cmt as $cmt){
                    extract($cmt);
                  
                  ?>
                  <tr>
                    <td>#<?= $review_id?></td>
                    <td><?= $username?></td>
                    <td><?= $review_content?></td>
                    <td><?= $review_date?></td>
                    <td><span class="badge bg-warning"><?= $course_name?></span></td>
                    <td>
                      <input type="hidden" name="cmt_id" value="<?= $review_id?>">
                      <button name="deleteCmt" onclick="return check_action()" class="btn btn-primary btn-sm trash" type="submit" title="Xóa"><i class="fas fa-trash-alt"></i></button>
                      <?php
                      if($comment_status == 1)
                      echo "
                      <a href='index.php?act=hiddenCmt&cmt_id=$review_id' class='btn btn-warning btn-sm haha' type='button' title='Ẩn' id='show-emp' data-toggle='' data-target=''><i class='fas fa-eye'></i></a>  
                      ";
                      else
                      echo "
                      <a href='index.php?act=showCmt&cmt_id=$review_id' class='btn btn-warning btn-sm haha' type='button' title='Hiện' id='show-emp' data-toggle='' data-target=''><i class='fas fa-eye-slash'></i></a>  
                      ";
                      ?>
                      
                    </button>
                    </td>
                  </tr>

                  <?php }?>
                </tbody>
              </table>
              <!-- </form> -->

            </div>
          </div>
        </div>
      </div>
    </main>
   <!-- Essential javascripts for application to work-->
  <script src="./Views/js/jquery-3.2.1.min.js"></script>
  <script src="./Views/js/popper.min.js"></script>
  <script src="./Views/js/bootstrap.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="./Views/src/jquery.table2excel.js"></script>
  <script src="./Views/js/main.js"></script>
  <!-- The javascript plugin to display page loading on top-->
  <script src="./Views/js/plugins/pace.min.js"></script>
  <!-- Page specific javascripts-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
  <!-- Data table plugin-->
  <script type="text/javascript" src="./Views/js/plugins/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="./Views/js/plugins/dataTables.bootstrap.min.js"></script>
  <script type="text/javascript">$('#sampleTable').DataTable();</script>
  <script>
        function check_action(){
            return confirm("Bạn có chắc chắn xóa không ?");
        }
    </script>
  <script>
    function deleteRow(r) {
      var i = r.parentNode.parentNode.rowIndex;
      document.getElementById("myTable").deleteRow(i);
    }
    // jQuery(function () {
    //   jQuery(".trash").click(function () {
    //     swal({
    //       title: "Cảnh báo",
         
    //       text: "Bạn có chắc chắn là muốn xóa?",
    //       buttons: ["Hủy bỏ", "Đồng ý"],
    //     })
    //       .then((willDelete) => {
    //         if (willDelete) {
    //           swal("Đã xóa thành công.!", {
                
    //           });
    //         }
    //       });
    //   });
    // });
    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
      $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
      e.stopImmediatePropagation();
    });

    //EXCEL
    // $(document).ready(function () {
    //   $('#').DataTable({

    //     dom: 'Bfrtip',
    //     "buttons": [
    //       'excel'
    //     ]
    //   });
    // });


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
    //In dữ liệu
    var myApp = new function () {
      this.printTable = function () {
        var tab = document.getElementById('sampleTable');
        var win = window.open('', '', 'height=700,width=700');
        win.document.write(tab.outerHTML);
        win.document.close();
        win.print();
      }
    }
    //     //Sao chép dữ liệu
    //     var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

    // copyTextareaBtn.addEventListener('click', function(event) {
    //   var copyTextarea = document.querySelector('.js-copytextarea');
    //   copyTextarea.focus();
    //   copyTextarea.select();

    //   try {
    //     var successful = document.execCommand('copy');
    //     var msg = successful ? 'successful' : 'unsuccessful';
    //     console.log('Copying text command was ' + msg);
    //   } catch (err) {
    //     console.log('Oops, unable to copy');
    //   }
    // });


    //Modal
    $("#show-emp").on("click", function () {
      $("#ModalUP").modal({ backdrop: false, keyboard: false })
    });
  </script>
  </body>
</html>