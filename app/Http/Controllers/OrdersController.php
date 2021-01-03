<?php

namespace App\Http\Controllers;

use App\User;
use App\Orders_model;
use App\OrderDetails_model;
use App\Cart_model;
use App\Mail\NotifikasiPemesanan;
use App\Products_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Mail;

class OrdersController extends Controller
{
    public function index()
    {
        $cart_data = Cart_model::where('users_id', Auth::id())->count();
        if ($cart_data == 0) {
            return redirect(url('/viewcart'))->with('message', 'Keranjang anda kosong.');
        } else {
            $last_orders = DB::select("SELECT id FROM orders ORDER BY id DESC LIMIT 1");
            foreach ($last_orders as $last_order) {
                $order_id = $last_order->id + 1;
            }

            $session_id = Session::get('session_id');
            $auth_id = Auth::id();
            $cart_datas = DB::select("SELECT cart.id, cart.users_id,products.description , products.p_name, products.price, cart.quantity, products.image, products.stock FROM `cart`,`products`, `users` WHERE users.id = $auth_id and cart.products_id = products.id and cart.users_id = users.id");

            $session_coupon = Session::get('coupon_code');
            $session_expedition = Session::get('expedition_total');

            if ($session_coupon != NULL) {
                $coupon_id = DB::select("SELECT id FROM `coupons` WHERE coupon_code = '$session_coupon'");
                $coupon_id = $coupon_id[0]->id;
            }

            $user_data = User::where('id', $auth_id)->first();

            $total_price = 0;
            foreach ($cart_datas as $cart_data) {
                $total_price += $cart_data->price * $cart_data->quantity;
            }
            return view('checkout.review_order', compact('cart_datas', 'total_price', 'user_data', 'coupon_id', 'order_id'));
        }
    }
    public function order(Request $request)
    {
        $input_data = $request->all();
        Orders_model::create($input_data);

        //Mengisi tabel order, order details. Menghapus baris cart
        $last_orders = DB::select("SELECT id FROM orders ORDER BY id DESC LIMIT 1");
        foreach ($last_orders as $last_order) {
            $order_id = $last_order->id;
        }

        $cart_datas = DB::select("SELECT products_id, quantity FROM `cart` WHERE cart.users_id = $request->users_id");

        foreach ($cart_datas as $cart_data) {
            $order_details = new OrderDetails_model;

            $order_details->orders_id = $order_id;
            $order_details->products_id = $cart_data->products_id;
            $order_details->quantity = $cart_data->quantity;
            $order_details->save();

            $product = Products_model::findOrFail($cart_data->products_id);
            $product->stock = $product->stock - $cart_data->quantity;
            $product->save();
        }
        
        // Mengirim Email notifikasi
        $order_user = DB::select("SELECT id FROM orders where users_id = $request->users_id order by id DESC LIMIT 1");
        $order_user = $order_user[0]->id;
        
        $order = DB::select("SELECT orders.id, users.name, orders.order_date, orders.grand_total FROM `USERS`, `orders` WHERE users.id = orders.users_id and orders.id = $order_user");        
        $order = $order[0];
        $admins = User::where('status', 1)->get();
        
        $data = array(
            'id' => $order->id,
            'users_name' => $order->name,
            'order_date' => $order->order_date,
            'grand_total' => $order->grand_total,
        );
        
        foreach ($admins as $admin) {
            Mail::send('emails.notifikasiPemesanan', $data, function ($notifikasiPemesanan) use ($admin, $order) {
                $notifikasiPemesanan->to($admin->email, $admin->name)->subject("Pesanan baru diterima #" . $order->id);
            });
        }
        
        Cart_model::where('users_id', $request->users_id)->delete();
        
        return redirect(url('/order-payment', $order_id));
    }
    public function payment($id)
    {
        $user_order = Orders_model::findOrFail($id);
        if ($user_order != NULL) {
            if ($user_order->checkout_status == 'belum dibayar') {
                $user = User::select('name')->where('id', Auth::id())->first();
                // dd($user);
                $order_detail = DB::select("SELECT order_details.orders_id, products.p_name, order_details.quantity
                FROM `orders`, `order_details`, `products`
                WHERE orders.id = order_details.orders_id and order_details.products_id = products.id");
                return view('payment.order-payment', compact('user_order', 'order_detail', 'user'));
            } else {
                return redirect('orders/belum-dibayar');
            }
        } else {
            return redirect('orders/belum-dibayar');
        }
    }
}
