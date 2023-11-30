<?php

function totalCourseInCategory($categoryId) {
    $sql = "SELECT * FROM category WHERE category_id=$categoryId";
    return pdo_get_rows($sql);
}

function checkCategoryNameAvailable($categoryName) {
    $sql = "SELECT * FROM category WHERE category_name='$categoryName'";
    return pdo_query_one($sql);
}

function insertCategory($categoryName) {
    $sql = "INSERT INTO category(category_name) VALUES('$categoryName')";
    return pdo_checkStatusSql($sql);
}

function changeCategoryStatus($categoryId, $categoryStatus) {
    $sql = "UPDATE category SET category_status=$categoryStatus WHERE category_id=$categoryId";
    return pdo_checkStatusSql($sql);
}

function getCategory($categoryId) {
    $sql = "SELECT * FROM category WHERE category_id=$categoryId";
    return pdo_query_one($sql);
}

function editCategory($categoryName, $categoryId) {
    $sql = "UPDATE category SET category_name='$categoryName' WHERE category_id=$categoryId";
    return pdo_checkStatusSql($sql);
}

function deleteCategory($categoryId) {
    $sql = "DELETE FROM category where category_id=$categoryId";
    return pdo_checkStatusSql($sql);
}

?>