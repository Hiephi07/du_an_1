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
      <li><a class="app-menu__item" href="index.php?act=dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
            class="app-menu__label">Bảng điều khiển</span></a></li>
      <li><a class="app-menu__item
        <?php
          switch ($_GET['act']) {
            case 'listCategory';
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
            case 'listCourses';
            case 'add-course';
            case 'editCourse';
            case 'listChapters';
            case 'addChapter';
            case 'editChapter';
            case 'listLessons';
            case 'addLessonToCourse';
            case 'addLesson';
            case 'editLesson';
              echo 'active';
              break;
            default:
              break;
          }
        ?>
      " href="index.php?act=listCourses"><i
            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý khóa học</span></a>
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
            case 'userList';
            case 'addUser';
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
              case 'listOrder';
                echo 'active';
                break;
              default:
                break;
            }
          ?>
      " href="index.php?act=listOrder"><i class='app-menu__icon bx bx-task'></i><span
            class="app-menu__label">Quản lý đơn hàng</span></a></li>
      <li><a class="app-menu__item" href="index.php?act=listComment"><i class='app-menu__icon bx bx-run'></i><span
            class="app-menu__label">Quản lý bình luận
          </span></a></li>
      <li><a class="app-menu__item" href="index.php?act=baoCao"><i
            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo số thu</span></a>
      </li>
    </ul>

  </aside>