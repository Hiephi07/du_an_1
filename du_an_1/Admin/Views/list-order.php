<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active">
                <a href="#"><b>Danh sách đơn hàng</b></a>
            </li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <?php
                        if (isset($_SESSION['notice__orderAction'])) {
                            $state = $_SESSION['notice__orderAction']['state'];
                            $msg = $_SESSION['notice__orderAction']['msg'];
                            echo 
                                '
                                    <div class="'.$state.' rounded-2  text-center p-2 mb-1 w-100 mb-2" role="alert">
                                        '.$msg.'
                                    </div>
                                ';
                            unset($_SESSION['notice__orderAction']);
                        }
                    ?>
                    <!-- <div class="d-flex justify-content-end align-items-center mb-2 ">
                        <a href="index.php?act=addOrder" class="btn btn-add"><i class="fa-solid fa-plus me-2" ></i>Thêm đơn hàng</a>
                    </div> -->
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                            <tr>
                                <th class="text-center">ID đơn hàng</th>
                                <th class="text-center">Tên khách hàng</th>
                                <th class="text-center">Khoá học</th>
                                <th class="text-center">Thời gian mua</th>
                                <th class="text-center">Tổng tiền</th>
                                <th class="text-center">Trạng thái</th>
                                <!-- <th class="text-center">Hành động</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                foreach($listOrder as $order) {
                                    $orderCourse = getCourse($order['course_id']);
                                    ?>
                                        <tr>
                                            <td class="text-center"><?=$order['order_id']?></td>
                                            <td class="text-center"><?=$order['user_name']?></td>
                                            <td class="text-center"><?=$orderCourse['course_name']?></td>
                                            <td class="text-center"><?=$order['order_date']?></td>
                                            <td class="text-center"><?=$orderCourse['course_price']?></td>
                                            <td class="text-center">
                                                <form action="index.php?act=changeOrderStatus&orderId=<?=$order['order_id']?>&userId=<?=$order['user_id']?>" method="post">
                                                    <select class="form-select changeOrderStatus" aria-label="Default select example" name="order_status">
                                                        <option value="0" <?=($order['order_status']==0)?"selected":FALSE;?> >Hủy</option> 
                                                        <option value="1" <?=($order['order_status']==1)?"selected":FALSE;?> >Thành công</option> 
                                                        <option value="2" <?=($order['order_status']==2)?"selected":FALSE;?> >Chờ</option> 
                                                    </select>
                                                </form>
                                            </td>
                                            <!-- <td class="text-center"> -->
                                                <!-- <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i></button> -->
                                                <!-- <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button> -->
                                            <!-- </td> -->
                                        </tr>
                                    <?php
                                }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<script type="text/javascript">
    var deleteItemBtn = document.querySelectorAll('.deleteItem');
    deleteItemBtn.forEach((element) => {
        element.addEventListener('click', (event) => {
            if (!confirm('Bạn có muốn xóa người dùng này không?')) {
                event.preventDefault();
            }
        })
    });

    var changeOrderStatusList = document.querySelectorAll('.changeOrderStatus');
    changeOrderStatusList.forEach( (selectBox) => {
      selectBox.addEventListener('change', (item) => {
        selectBox.parentElement.submit();
      });
    });
</script>
