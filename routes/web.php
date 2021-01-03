<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
/* FrontEnd Location */

Route::get('/', 'IndexController@index');
// Route::get('/list-products', 'IndexController@shop');
Route::get('/cat/{id}', 'IndexController@listByCat')->name('cats');
Route::get('/product-detail/{id}', 'IndexController@detailpro');
Route::get('/payment', 'IndexController@payment');

/// Simple User Login /////
// Route::get('/login', 'UsersController@index');
Route::post('/register_user', 'UsersController@register');
Route::post('/user_login', 'UsersController@login');
Route::get('/logout', 'UsersController@logout');


////// User Authentications ///////////
Route::group(['middleware' => ['FrontLogin_middleware', 'pelanggan']], function () {
    Route::get('/myaccount', 'UsersController@account');
    Route::put('/update-profile/{id}', 'UsersController@updateprofile');
    Route::put('/update-password/{id}', 'UsersController@updatepassword');
    Route::get('/check-out', 'CheckOutController@index');
    Route::post('/submit-checkout', 'CheckOutController@submitcheckout');
    Route::get('/order-review', 'OrdersController@index');
    Route::post('/submit-order', 'OrdersController@order');
    Route::get('/order-payment/{id}', 'OrdersController@payment');

    ///// Cart Area /////////
    Route::post('/addToCart', 'CartController@addToCart')->name('addToCart');
    Route::get('/viewcart', 'CartController@index');
    Route::get('/cart/deleteItem/{id}', 'CartController@deleteItem');
    Route::get('/cart/update-quantity/{id}/{quantity}', 'CartController@updateQuantity');

    /// Coupon Area ///
    Route::post('/apply-coupon', 'CouponController@applycoupon');
    Route::post('/apply-expedition', 'ExpeditionController@applyexpedition');

    /// Detail Order ///
    Route::get('/orders/belum-dibayar', 'OrdersPelangganController@belumdibayar');
    Route::put('/orders/belum-dibayar/upload/{id}', 'OrdersPelangganController@uploadpembayaran')->name('uploadpembayaran');

    Route::get('/orders/sedang-proses', 'OrdersPelangganController@sedangproses');

    Route::get('/orders/sudah-selesai', 'OrdersPelangganController@sudahselesai');
    Route::put('/orders/sudah-selesai/konfirmasi/{id}', 'OrdersPelangganController@konfirmasipenerimaan')->name('konfirmasipenerimaan');

    // Chat
    Route::get('/chat-consultant', 'MessageController@index');
    Route::get('/chat/{id}', 'MessageController@getMessage')->name('message');
    Route::post('chat', 'MessageController@sendMessage');
});


// ==============================================================================================

/* Admin Location */
Auth::routes(['register' => false]);
Route::group(['prefix' => 'admin', 'middleware' => ['auth', 'admin']], function () {
    Route::get('/', 'AdminController@index');

    /// Setting Area
    Route::get('/edit-profile', 'AdminController@settings');
    Route::get('/check-pwd', 'AdminController@chkPassword');
    Route::post('/update-pwd', 'AdminController@updatAdminPwd');
    Route::post('/updateprofile/{id}', 'AdminController@updateprofile');

    /// Category Area
    Route::resource('category', 'CategoryController');
    Route::get('delete-category/{id}', 'CategoryController@destroy');
    Route::get('/check_category_name', 'CategoryController@checkCateName');

    /// Products Area
    Route::resource('/product', 'ProductsController');
    Route::get('delete-product/{id}', 'ProductsController@destroy');
    Route::get('delete-image/{id}', 'ProductsController@deleteImage');

    /// Product Attribute
    Route::resource('/product_attr', 'ProductAtrrController');
    Route::get('delete-attribute/{id}', 'ProductAtrrController@deleteAttr');

    /// Product Images Gallery
    Route::resource('/image-gallery', 'ImagesController');
    Route::get('delete-imageGallery/{id}', 'ImagesController@destroy');

    /// Coupon
    Route::resource('/coupon', 'CouponController');
    Route::get('delete-coupon/{id}', 'CouponController@destroy');

    /// Orders
    Route::get('/orders/belum-dibayar', 'OrdersAdminController@belumdibayar');
    Route::get('/orders/pembayaran/{id}', 'OrdersAdminController@pembayaran')->name('pembayaran');

    Route::get('/orders/sedang-proses', 'OrdersAdminController@sedangproses');
    Route::get('/orders/create-pengiriman/{id}', 'OrdersAdminController@createpengiriman');
    Route::put('/orders/pengiriman/{id}', 'OrdersAdminController@pengiriman')->name('pengiriman');

    Route::get('/orders/sudah-selesai', 'OrdersAdminController@sudahselesai');

    /// Konsultan
    Route::get('/konsultan', 'KonsultanController@admin');
    Route::get('/konsultan/create', 'KonsultanController@create');
    Route::post('/konsultan', 'KonsultanController@store');
});

// ==============================================================================================

/* Konsultan Location */
Route::group(['prefix' => 'konsultan', 'middleware' => ['FrontLogin_middleware', 'konsultan']], function () {
    Route::get('/', 'KonsultanController@index');
    Route::get('/edit-profile', 'KonsultanController@settings');
    Route::get('/check-pwd', 'KonsultanController@chkPassword');
    Route::post('/update-pwd', 'KonsultanController@updatKonsPwd');
    Route::post('/updateprofile/{id}', 'KonsultanController@updateprofile');

    //Chat
    Route::get('/chat', 'MessageController@index');
    Route::get('/chat/{id}', 'MessageController@getMessage')->name('message');
    Route::post('chat', 'MessageController@sendMessage');
});
